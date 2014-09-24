/* Laser-pop Arduino controller code for Arduino Mega 2560
 * Chotee 2014-8, GPLv3 or later
*/

#include <CmdMessenger.h> // obtained from http://thijs.elenbaas.net/downloads/?did=9

#define PROG_VERSION 1
#define NR_OF_LASERS 1

const byte PINS_LASER[NR_OF_LASERS][5] = {
 // TP = *ANALOG PIN* Temperature of the current regulator for the laser. Internal to LT3086.
 //      Should not exceed 125⁰C!
 // TD = *ANALOG PIN* Temperature of the laser diode. Via MCP9701A.
 //      Should not exceed 110⁰C!
 // TL = *ANALOG PIN* Temperature if the laser-light energy sink. Via MCP9701A.
 //      Should not exceed 125⁰C!
 //      (see TD)
 // LL = *DIGITAL INPUT PIN* Laser sink light detector.
 //      HIGH = No light; LOW = Light detected
 // LC = *DIGITAL OUTPUT PIN* Control the laser power output.
 //      P(0)=Minimal output; P(1024)=Maximal output
 // pin layout.
//    {TP ,TD ,TL , LL, LC}
    { A0, A1, A2, 22, 12}, // Laser A
//    { A3, A4, A5, 24, 11}, // Laser B
//    { A6, A7, A8, 26, 10}, // Laser C
//    { A9,A10,A11, 28,  9}, // Laser D
//    {A12,A13,A14, 30,  8}  // Laser E

//     { A0, A1, A2, 12, 11}, // Laser Test (w/ Uno)
//     { A3, A4, A5, 10,  9}, // Laser Test (w/ Uno)
};

const byte TP = 0;
const byte TD = 1;
const byte TL = 2;

const byte LL_PIN = 3;
const byte LC_PIN = 4;

const byte INT_EVENT_PIN = 19; // Pin where the LIGHT and LOCK event interrupt is reported.
const byte INT_EVENT_NR = 4;   // Number of the LIGHT and LOCK event interrupt.

const unsigned int PUBLISH_FREQUENCY = 1000; // in miliseconds
const unsigned int ADJUST_FREQUENCY = 100; // in miliseconds
const unsigned int SAMPLE_FREQUENCY = 10;   // in miliseconds

const byte TEMP_MAX[3]     = {125, 110, 125}; // {TP ,TD ,TL} Absolute maximum temperatures.
const byte TEMP_BACKOFF[3] = {80,  80, 100}; // {TP ,TD ,TL} Maximum normal operating temperatures.

// --- Globals -----------------
byte ProgramState;
volatile bool InterruptTriggered = false;
volatile unsigned long PopTime; // Time in microSeconds that popping is running.
unsigned long PreviousAdjustUpdate  = 0; // Miliseconds of the last update.
unsigned long PreviousPublishUpdate = 0; // Miliseconds of the last update.
unsigned long PreviousSampleUpdate  = 0; // Miliseconds of the last sample update;
unsigned long SampleNrs; // Number of samples taken
unsigned long AdjustNrs; // Number of adjustments done between publication.
volatile byte LaserPower[NR_OF_LASERS];      // Current power to the lasers. Value from 0 to 100.
byte LaserPowerReq[NR_OF_LASERS]; // Power requested of the lasers
unsigned long SampleTotals[NR_OF_LASERS][3]; // {TP ,TD ,TL}; Sum of all samples.
                                             // Divide with SampleNrs to get average value
unsigned long Temperatures[NR_OF_LASERS][3]; // {TP ,TD ,TL}; Last calculated temperatures in miliCelcius.

enum { // States of the machine.
  sInit                 , // State during startup routine
  sStandBy              , // State system ready standby.
};

// --- Communcations ----------------------------

// Attach a new CmdMessenger object to the default Serial port
CmdMessenger cmdMessenger = CmdMessenger(Serial);

// This is the list of recognized commands. These can be commands that can either be sent or received. 
// In order to receive, attach a callback function to these events
enum { // Commands between systems.
  kAcknowledge          , // Command to acknowledge that cmd was received.
                          // Arg: A string.
  kError                , // Command to report errors
                          // Arg: A string.
  kStatusPublish        , // Command to report status of the corn machine
                          // Arg: State nr of the Arduino ; Time since start of popping (in µS);
                          // Nr of temperature samples taken for this temp report.
                          // Nr of adjustments made since the last report.
  kStatusLaserPublish   , // Command to report status of one of the lasers
                          // Arg: Number of the laser, Laser PowerLevel (0-100),
                          //      T of Power Reg, T of Laser Diode, T of Light-sink.
  kPopReport            , // Command to report the corn popping
                          // Arg: microSeconds since start of pop.
  kConfigInfo           , // Command to report on the setup of the Laser configuration
                          // Arg: Name; value
  kSetLasers            , // Command to set the laser power.
                          // Args: Arguments are from 0 to 100. N times for the number of lasers.
  kOverTemperature        , // Infomational message with over temperature warning
//  kStartCommand         , // Command to request start the corn popping
//  kStopCommand          , // Command to request abort the corn popping
};

// --- CALLBACKS ----------------------------

// Called when a received command has no attached function
void OnUnknownCommand()
{
    cmdMessenger.sendCmd(kError,"Command without attached callback");
}

void OnSetLasers() {
    for(byte l_nr=0; l_nr<NR_OF_LASERS; l_nr++) { // grab the arguments
        byte cmd_value = cmdMessenger.readInt16Arg();
        LaserPowerReq[l_nr] = constrain(cmd_value, 0, 100);
    }
    // Create the response reporting the values.
    cmdMessenger.sendCmdStart(kAcknowledge);
    cmdMessenger.sendCmdArg( (byte) kSetLasers);
    for(byte l_nr=0; l_nr<NR_OF_LASERS; l_nr++) {
        cmdMessenger.sendCmdArg(LaserPowerReq[l_nr]);
    }
    cmdMessenger.sendCmdEnd();
}

void attachCommandCallbacks() {
    // Attach callback methods
    cmdMessenger.attach(OnUnknownCommand);
    cmdMessenger.attach(kSetLasers, OnSetLasers);
}

//void InterruptHandler(void) {
//    InterruptTriggered = true;
//    LaserSetAll(0);
//}

// --- Main code ----------------------------

void setup(void) {
    ProgramState = sInit;
    Serial.begin(115200);
    cmdMessenger.printLfCr(); // Adds newline to every command
    attachCommandCallbacks();
    ResetSampleValues();
    PopTime = 0;
//    attachInterrupt(INT_EVENT_NR, InterruptHandler, RISING);
    ProgramState = sStandBy;
    PublishReady(); // Send the status to the PC that says the Arduino has booted
}

void loop(void) {
    // Process incoming serial data, and perform callbacks
    cmdMessenger.feedinSerialData();

    if(hasExpired(PreviousAdjustUpdate, ADJUST_FREQUENCY)) {
        for(byte l_nr=0; l_nr<NR_OF_LASERS; l_nr++) {
            CalculateTemperatures(l_nr);
            AdjustPower(l_nr);
            AdjustNrs++;
        }
        if(hasExpired(PreviousPublishUpdate, PUBLISH_FREQUENCY)) {
            PublishStateUpdate(ProgramState, PopTime, SampleNrs);
            for(byte l_nr=0; l_nr<NR_OF_LASERS; l_nr++) {
                PublishLaserUpdate(l_nr);
            }
        }
        ResetSampleValues();
    }

    if(hasExpired(PreviousSampleUpdate, SAMPLE_FREQUENCY)) {
        CollectSamples();
    }
}

// --- temperature sampling and adjustment routines.

void CollectSamples() {
    // Sample all of the temperatures by reading analogValues. Add 1 to the number of samples.
    for(byte l_nr=0; l_nr<NR_OF_LASERS; l_nr++) {
       SampleTotals[l_nr][TP] += analogRead(PINS_LASER[l_nr][TP]);
       SampleTotals[l_nr][TD] += analogRead(PINS_LASER[l_nr][TD]);
       SampleTotals[l_nr][TL] += analogRead(PINS_LASER[l_nr][TL]);
    }
    SampleNrs++;
}

void CalculateTemperatures(byte l_nr) {
    Temperatures[l_nr][TP] = Calc_temp_LT3086(SampleNrs, SampleTotals[l_nr][TP]);
    Temperatures[l_nr][TD] = Calc_temp_LT3086(SampleNrs, SampleTotals[l_nr][TD]);
    Temperatures[l_nr][TL] = Calc_temp_LT3086(SampleNrs, SampleTotals[l_nr][TL]);
}

void AdjustPower(byte l_nr) {
//    for (byte i=0; i<3; i++) { // emergency situation. Thermally out of control!
//        if(Temperatures[l_nr][i] > ((unsigned long)TEMP_MAX[i])*1000) {
//            LaserSetAll(0); // Shutdown!
//            PublishLaserTemperatureCriticalError(l_nr, i);
//        }
//    }

    // Are be below or above acceptable temperatures?
//    bool below_backoff = true;
//    for (byte i=0; i<3; i++) {
//        if(Temperatures[l_nr][i] > ((unsigned long) TEMP_BACKOFF[i])*1000) {
//            below_backoff = false;
//            break;
//        }
//    }
//    if(below_backoff == true) { // We're not over temperature.
//        if(LaserPowerReq[l_nr] == LaserPower[l_nr]) { // Power is equal to requested power.
//            return; // Nothing to do.
//        }
        if(LaserPowerReq[l_nr] > LaserPower[l_nr]) { // we want to give more power to the lasers.
            LaserChange(l_nr, 1);
        } else { // we want to give less power to the lasers.
            LaserChange(l_nr, -1);
            // LaserSet(l_nr, 0); // alternative. Turning off lasers is immediate.
        }
//    } else { // we're too warm. Reduce laser power to reduce temperature.
//         PublishLaserOverTemperatureInfo(l_nr);
//         LaserChange(l_nr, -1);
//    }
}

void PublishLaserOverTemperatureInfo(byte l_nr) { // What laser is involved.
    cmdMessenger.sendCmdStart(kOverTemperature);
    cmdMessenger.sendCmdArg(l_nr);
    cmdMessenger.sendCmdArg("Reported Over temperature. Backing down.");
    cmdMessenger.sendCmdEnd();

}

void PublishLaserTemperatureCriticalError(byte l_nr,  // What laser is involved.
                                      byte t_source) { // What temperature was overheating.
    cmdMessenger.sendCmdStart(kError);
    cmdMessenger.sendCmdArg(l_nr);
    cmdMessenger.sendCmdArg(t_source);
    cmdMessenger.sendCmdArg("Reported absolute maximum trespass!");
    cmdMessenger.sendCmdEnd();
}

// Print system overview message.
void PublishStateUpdate(byte prog_state,      // State of the program
                   unsigned long p_time, // Time since start of the poping sequence. 0 for no poping going on.
                   unsigned long nr_of_samples) { // Number of samples received

    cmdMessenger.sendCmdStart(kStatusPublish);
    cmdMessenger.sendCmdArg(prog_state); // The state/program that the arduino is in.
    cmdMessenger.sendCmdArg(p_time); // Time since popping started in microSeconds.
    cmdMessenger.sendCmdArg(SampleNrs); // Number of samples.
    cmdMessenger.sendCmdArg(AdjustNrs); // Number of adjustments since last publication..
    cmdMessenger.sendCmdEnd();
    AdjustNrs=0;
}

void PublishLaserUpdate(byte l_nr) {
    cmdMessenger.sendCmdStart(kStatusLaserPublish);
    cmdMessenger.sendCmdArg(l_nr); // Number of the laser
    cmdMessenger.sendCmdArg(LaserGet(l_nr));
    cmdMessenger.sendCmdArg(Temperatures[l_nr][TP]); // Power Reg temperature
    cmdMessenger.sendCmdArg(Temperatures[l_nr][TD]); // Laser diode temp.
    cmdMessenger.sendCmdArg(Temperatures[l_nr][TL]); // Light-sink temp.
    cmdMessenger.sendCmdEnd();
}

// Callback function that responds that Arduino is ready (has booted up)
void PublishReady()
{
    cmdMessenger.sendCmd(kAcknowledge,"READY: Laser-pop control v1");
    cmdMessenger.sendCmdStart(kConfigInfo);
    cmdMessenger.sendCmdArg("NUMBER_OF_LASERS");
    cmdMessenger.sendCmdArg(NR_OF_LASERS);
    cmdMessenger.sendCmdEnd();
}

unsigned long Calc_temp_LT3086(unsigned long s_nr, unsigned long s_total) {
   // Return miliCelcius with the LT3086 junction temperature.
   // 32mV/⁰C; at 0⁰C = 0V; At 25⁰C output is 800mV; at 125⁰C output is 4V. T = V(TP)/32
   // PIN values (0→1024; 0→5V). Max resolution=0.15⁰C; P(0) = 0⁰C; P(1024) = 156⁰C; T = (P(TP)*153)/1000
   return (s_total*153)/s_nr; // Returns miliCelcius!
}

unsigned long Calc_temp_MCP9701A(unsigned long s_nr, unsigned long s_total) {
   // Return miliCelcius with the MCP9701A temperature.
   // 19.5mV/⁰C; at 0⁰C = 400mV. At 25⁰C output is 888mV; at 125⁰C output is 2.84V. T = V(TD-0.4)/19.5
   // PIN values (0→1024; 0→5V). Max resolution=0.25⁰C; P(0) = -20.5⁰C; P(1024) = 236⁰C; T = (P(TD)*250)/1000
   return (s_total*250)/s_nr; // Returns miliCelcius!
}

void ResetSampleValues() { // Set the values of the sample
    SampleNrs = 0;
    for(byte i=0; i<NR_OF_LASERS; i++) {
        for(byte j=0; j<3; j++) {
            SampleTotals[i][j] = 0;
        }
    }
}


// --- Laser control routines ----------------

void LaserSetAll(byte output_level) {
    for(byte l_nr=0; l_nr<NR_OF_LASERS; l_nr++) {
        LaserSet(l_nr, output_level);
    }
}

byte LaserSet(byte laser_nr, byte output_level) {
    output_level = constrain(output_level, 0, 100);
    byte pwm_value = map(output_level, 0, 100, 0, 255);
    analogWrite(PINS_LASER[laser_nr][LC_PIN], pwm_value);
    LaserPower[laser_nr] = output_level;
    return output_level;
}

byte LaserChange(byte laser_nr, int change_amount) {
    int new_value = LaserPower[laser_nr] + change_amount;
    new_value = constrain(new_value, 0, 100);
    //cmdMessenger.sendCmd(kAcknowledge,LaserPower[laser_nr]);
    //cmdMessenger.sendCmd(kAcknowledge,change_amount);
    //cmdMessenger.sendCmd(kAcknowledge,new_value);
    return LaserSet(laser_nr, (byte) new_value);
}


byte LaserGet(byte laser_nr) {
    return LaserPower[laser_nr];
}

// --- Utility routines ---------------

void setup_pins() {
    for(byte i=0; i<NR_OF_LASERS; i++) {
        pinMode(PINS_LASER[i][TP], INPUT);
        pinMode(PINS_LASER[i][TD], INPUT);
        pinMode(PINS_LASER[i][TL], INPUT);
        pinMode(PINS_LASER[i][LL_PIN], INPUT);
        pinMode(PINS_LASER[i][LC_PIN], OUTPUT);
        LaserSet(i, 0); // Set all lasers off.
    }
}

// Returns true if it has been more than interval (in ms) ago. Used for periodic actions
bool hasExpired(unsigned long &prevTime, unsigned long interval) {
    if (  millis() - prevTime > interval ) {
        prevTime = millis();
        return true;
    } else {
        return false;
    }
}
