<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.1.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="6" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="switch">
<description>&lt;b&gt;Switches&lt;/b&gt;&lt;p&gt;
Marquardt, Siemens, C&amp;K, ITT, and others&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="320-938">
<description>&lt;b&gt;TOGGLE SWITCH&lt;/b&gt;&lt;p&gt;
distributor RS Components</description>
<wire x1="-5.4102" y1="6.6802" x2="-6.0452" y2="6.0452" width="0.1524" layer="21"/>
<wire x1="-5.4102" y1="6.6802" x2="5.4102" y2="6.6802" width="0.1524" layer="21"/>
<wire x1="6.0452" y1="6.0452" x2="5.4102" y2="6.6802" width="0.1524" layer="21"/>
<wire x1="5.4102" y1="-6.6802" x2="6.0452" y2="-6.0452" width="0.1524" layer="21"/>
<wire x1="5.4102" y1="-6.6802" x2="-5.4102" y2="-6.6802" width="0.1524" layer="21"/>
<wire x1="-6.0452" y1="-6.0452" x2="-5.4102" y2="-6.6802" width="0.1524" layer="21"/>
<wire x1="6.0452" y1="6.0452" x2="6.0452" y2="-6.0452" width="0.1524" layer="21"/>
<wire x1="-6.0452" y1="-6.0452" x2="-6.0452" y2="6.0452" width="0.1524" layer="21"/>
<wire x1="4.318" y1="2.286" x2="4.318" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="-4.318" y1="2.286" x2="-4.318" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="4.318" y1="2.286" x2="0" y2="5.08" width="0.1524" layer="51"/>
<wire x1="0" y1="5.08" x2="-4.318" y2="2.286" width="0.1524" layer="51"/>
<wire x1="-4.318" y1="-2.286" x2="0" y2="-5.08" width="0.1524" layer="51"/>
<wire x1="0" y1="-5.08" x2="4.318" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-1.27" x2="2.54" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-3.175" x2="2.54" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-3.175" x2="-1.905" y2="-3.175" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-2.54" x2="-1.905" y2="-3.175" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-1.905" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.6002" y1="1.27" x2="2.54" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-1.6002" y1="1.27" x2="-2.54" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-2.54" x2="2.54" y2="-2.54" width="0.1524" layer="51" curve="-270"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.1524" layer="51" curve="-233.130102"/>
<wire x1="-1.6002" y1="1.27" x2="1.6002" y2="1.27" width="0.1524" layer="51"/>
<pad name="3" x="-2.3876" y="-4.0132" drill="2.0066" shape="octagon"/>
<pad name="2" x="-2.3876" y="0" drill="2.0066" shape="octagon"/>
<pad name="1" x="-2.3876" y="4.0132" drill="2.0066" shape="octagon"/>
<pad name="4" x="2.3876" y="4.0132" drill="2.0066" shape="octagon"/>
<pad name="5" x="2.3876" y="0" drill="2.0066" shape="octagon"/>
<pad name="6" x="2.3876" y="-4.0132" drill="2.0066" shape="octagon"/>
<text x="-5.08" y="7.62" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-9.525" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="U2">
<wire x1="0" y1="-3.175" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-1.905" x2="-1.905" y2="3.175" width="0.254" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="3.175" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="3.175" width="0.254" layer="94"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-3.175" y1="0" x2="-3.81" y2="0" width="0.1524" layer="94"/>
<text x="5.08" y="-1.905" size="1.778" layer="95" rot="R90">&gt;PART</text>
<pin name="P" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="S" x="2.54" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<pin name="O" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
<symbol name="KS-U-">
<wire x1="-3.81" y1="1.905" x2="-2.54" y2="1.905" width="0.254" layer="94"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="0" width="0.254" layer="94"/>
<wire x1="-3.81" y1="0" x2="-1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="-3.81" y1="0" x2="-3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0" x2="-0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="1.905" x2="-3.81" y2="1.905" width="0.254" layer="94"/>
<wire x1="0.254" y1="0" x2="0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-3.175" x2="2.54" y2="-1.905" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.905" x2="0.635" y2="3.175" width="0.254" layer="94"/>
<wire x1="3.81" y1="2.54" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="3.175" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="3.175" width="0.254" layer="94"/>
<wire x1="-0.762" y1="0" x2="-0.254" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="-0.254" y1="-0.762" x2="0.254" y2="0" width="0.1524" layer="94"/>
<wire x1="1.905" y1="0" x2="2.413" y2="0" width="0.1524" layer="94"/>
<wire x1="3.175" y1="0" x2="3.683" y2="0" width="0.1524" layer="94"/>
<wire x1="4.445" y1="0" x2="4.953" y2="0" width="0.1524" layer="94"/>
<text x="-3.81" y="2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<text x="-6.35" y="-1.905" size="1.778" layer="95" rot="R90">&gt;PART</text>
<pin name="P" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="S" x="5.08" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<pin name="O" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="320-938" prefix="S" uservalue="yes">
<description>&lt;b&gt;TOGGLE SWITCH&lt;/b&gt;&lt;p&gt;
distributor RS Components</description>
<gates>
<gate name="B" symbol="U2" x="12.7" y="0" addlevel="always"/>
<gate name="1" symbol="KS-U-" x="0" y="0" addlevel="must"/>
</gates>
<devices>
<device name="" package="320-938">
<connects>
<connect gate="1" pin="O" pad="1"/>
<connect gate="1" pin="P" pad="2"/>
<connect gate="1" pin="S" pad="3"/>
<connect gate="B" pin="O" pad="4"/>
<connect gate="B" pin="P" pad="5"/>
<connect gate="B" pin="S" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="5566-20">
<description>&lt;b&gt;Mini FIT connector 20 pol&lt;/b&gt;&lt;p&gt;
ATX PC-Motherboard Power connector&lt;br&gt;
Source: http://www.molex.com</description>
<wire x1="-21.5" y1="4.5" x2="21.5" y2="4.5" width="0.254" layer="21"/>
<wire x1="21.5" y1="4.5" x2="21.5" y2="-2.2" width="0.254" layer="21"/>
<wire x1="21.5" y1="-3.3" x2="21.5" y2="-4.9" width="0.254" layer="21"/>
<wire x1="21.5" y1="-4.9" x2="-21.5" y2="-4.9" width="0.254" layer="21"/>
<wire x1="-21.5" y1="-4.9" x2="-21.5" y2="4.5" width="0.254" layer="21"/>
<wire x1="-25" y1="3.2" x2="-22.2" y2="3.2" width="0.254" layer="21" curve="-114.529547"/>
<wire x1="-25" y1="1.4" x2="-22.2" y2="1.4" width="0.254" layer="21" curve="114.529547"/>
<wire x1="-25" y1="3.2" x2="-25" y2="1.4" width="0.254" layer="21"/>
<wire x1="-22.3" y1="3.3" x2="-21.6" y2="3.3" width="0.254" layer="21"/>
<wire x1="-22.3" y1="1.3" x2="-21.6" y2="1.3" width="0.254" layer="21"/>
<wire x1="22.2" y1="1.4" x2="25" y2="1.4" width="0.254" layer="21" curve="114.529547"/>
<wire x1="22.2" y1="3.2" x2="25" y2="3.2" width="0.254" layer="21" curve="-114.529547"/>
<wire x1="25" y1="1.4" x2="25" y2="3.2" width="0.254" layer="21"/>
<wire x1="22.3" y1="1.3" x2="21.6" y2="1.3" width="0.254" layer="21"/>
<wire x1="22.3" y1="3.3" x2="21.6" y2="3.3" width="0.254" layer="21"/>
<wire x1="21.5" y1="-2.2" x2="21.5" y2="-3.3" width="0.254" layer="21" curve="-180"/>
<wire x1="-2.1" y1="6.3" x2="2.1" y2="6.3" width="0.254" layer="27"/>
<wire x1="-2.1" y1="6.3" x2="-2.1" y2="4.6" width="0.254" layer="27"/>
<wire x1="2.1" y1="6.3" x2="2.1" y2="4.6" width="0.254" layer="27"/>
<pad name="1" x="18.9" y="-2.75" drill="1.4" shape="square"/>
<pad name="2" x="14.7" y="-2.75" drill="1.4" shape="square"/>
<pad name="3" x="10.5" y="-2.75" drill="1.4" shape="square"/>
<pad name="4" x="6.3" y="-2.75" drill="1.4" shape="square"/>
<pad name="5" x="2.1" y="-2.75" drill="1.4" shape="square"/>
<pad name="6" x="-2.1" y="-2.75" drill="1.4" shape="square"/>
<pad name="7" x="-6.3" y="-2.75" drill="1.4" shape="square"/>
<pad name="8" x="-10.5" y="-2.75" drill="1.4" shape="square"/>
<pad name="9" x="-14.7" y="-2.75" drill="1.4" shape="square"/>
<pad name="10" x="-18.9" y="-2.75" drill="1.4" shape="square"/>
<pad name="11" x="18.9" y="2.75" drill="1.4" shape="square"/>
<pad name="12" x="14.7" y="2.75" drill="1.4" shape="square"/>
<pad name="13" x="10.5" y="2.75" drill="1.4" shape="square"/>
<pad name="14" x="6.3" y="2.75" drill="1.4" shape="square"/>
<pad name="15" x="2.1" y="2.75" drill="1.4" shape="square"/>
<pad name="16" x="-2.1" y="2.75" drill="1.4" shape="square"/>
<pad name="17" x="-6.3" y="2.75" drill="1.4" shape="square"/>
<pad name="18" x="-10.5" y="2.75" drill="1.4" shape="square"/>
<pad name="19" x="-14.7" y="2.75" drill="1.4" shape="square"/>
<pad name="20" x="-18.9" y="2.75" drill="1.4" shape="square"/>
<text x="16.51" y="-6.985" size="1.27" layer="25">&gt;NAME</text>
<text x="-20.32" y="-6.985" size="1.27" layer="27">&gt;VALUE</text>
<hole x="23.6" y="2.29" drill="3"/>
<hole x="-23.6" y="2.29" drill="3"/>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="5566-20" prefix="X">
<description>&lt;b&gt;Mini FIT connector 20 pol&lt;/b&gt;&lt;p&gt;
ATX PC-Motherboard Power connector&lt;br&gt;
Source: http://www.molex.com</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="22.86" addlevel="always"/>
<gate name="-2" symbol="M" x="0" y="20.32" addlevel="always"/>
<gate name="-3" symbol="M" x="0" y="17.78" addlevel="always"/>
<gate name="-4" symbol="M" x="0" y="15.24" addlevel="always"/>
<gate name="-5" symbol="M" x="0" y="12.7" addlevel="always"/>
<gate name="-6" symbol="M" x="0" y="10.16" addlevel="always"/>
<gate name="-7" symbol="M" x="0" y="7.62" addlevel="always"/>
<gate name="-8" symbol="M" x="0" y="5.08" addlevel="always"/>
<gate name="-9" symbol="M" x="0" y="2.54" addlevel="always"/>
<gate name="-10" symbol="M" x="0" y="0" addlevel="always"/>
<gate name="-11" symbol="M" x="0" y="-2.54" addlevel="always"/>
<gate name="-12" symbol="M" x="0" y="-5.08" addlevel="always"/>
<gate name="-13" symbol="M" x="0" y="-7.62" addlevel="always"/>
<gate name="-14" symbol="M" x="0" y="-10.16" addlevel="always"/>
<gate name="-15" symbol="M" x="0" y="-12.7" addlevel="always"/>
<gate name="-16" symbol="M" x="0" y="-15.24" addlevel="always"/>
<gate name="-17" symbol="M" x="0" y="-17.78" addlevel="always"/>
<gate name="-18" symbol="M" x="0" y="-20.32" addlevel="always"/>
<gate name="-19" symbol="M" x="0" y="-22.86" addlevel="always"/>
<gate name="-20" symbol="M" x="0" y="-25.4" addlevel="always"/>
</gates>
<devices>
<device name="" package="5566-20">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-17" pin="S" pad="17"/>
<connect gate="-18" pin="S" pad="18"/>
<connect gate="-19" pin="S" pad="19"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-20" pin="S" pad="20"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-wago-500">
<description>&lt;b&gt;Wago Screw Clamps&lt;/b&gt;&lt;p&gt;
Grid 5.00 mm&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="W237-102">
<description>&lt;b&gt;WAGO SCREW CLAMP&lt;/b&gt;</description>
<wire x1="-3.491" y1="-2.286" x2="-1.484" y2="-0.279" width="0.254" layer="51"/>
<wire x1="1.488" y1="-2.261" x2="3.469" y2="-0.254" width="0.254" layer="51"/>
<wire x1="-4.989" y1="-5.461" x2="4.993" y2="-5.461" width="0.1524" layer="21"/>
<wire x1="4.993" y1="3.734" x2="4.993" y2="3.531" width="0.1524" layer="21"/>
<wire x1="4.993" y1="3.734" x2="-4.989" y2="3.734" width="0.1524" layer="21"/>
<wire x1="-4.989" y1="-5.461" x2="-4.989" y2="-3.073" width="0.1524" layer="21"/>
<wire x1="-4.989" y1="-3.073" x2="-3.389" y2="-3.073" width="0.1524" layer="21"/>
<wire x1="-3.389" y1="-3.073" x2="-1.611" y2="-3.073" width="0.1524" layer="51"/>
<wire x1="-1.611" y1="-3.073" x2="1.615" y2="-3.073" width="0.1524" layer="21"/>
<wire x1="3.393" y1="-3.073" x2="4.993" y2="-3.073" width="0.1524" layer="21"/>
<wire x1="-4.989" y1="-3.073" x2="-4.989" y2="3.531" width="0.1524" layer="21"/>
<wire x1="4.993" y1="-3.073" x2="4.993" y2="-5.461" width="0.1524" layer="21"/>
<wire x1="-4.989" y1="3.531" x2="4.993" y2="3.531" width="0.1524" layer="21"/>
<wire x1="-4.989" y1="3.531" x2="-4.989" y2="3.734" width="0.1524" layer="21"/>
<wire x1="4.993" y1="3.531" x2="4.993" y2="-3.073" width="0.1524" layer="21"/>
<wire x1="1.615" y1="-3.073" x2="3.393" y2="-3.073" width="0.1524" layer="51"/>
<circle x="-2.5" y="-1.27" radius="1.4986" width="0.1524" layer="51"/>
<circle x="-2.5" y="2.2098" radius="0.508" width="0.1524" layer="21"/>
<circle x="2.5038" y="-1.27" radius="1.4986" width="0.1524" layer="51"/>
<circle x="2.5038" y="2.2098" radius="0.508" width="0.1524" layer="21"/>
<pad name="1" x="-2.5" y="-1.27" drill="1.1938" shape="long" rot="R90"/>
<pad name="2" x="2.5" y="-1.27" drill="1.1938" shape="long" rot="R90"/>
<text x="-5.04" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.8462" y="-5.0038" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.532" y="0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="0.421" y="0.635" size="1.27" layer="21" ratio="10">2</text>
</package>
</packages>
<symbols>
<symbol name="KL">
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<text x="0" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="KL+V">
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<text x="-2.54" y="-3.683" size="1.778" layer="96">&gt;VALUE</text>
<text x="0" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="W237-102" prefix="X" uservalue="yes">
<description>&lt;b&gt;WAGO SCREW CLAMP&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="KL" x="0" y="5.08" addlevel="always"/>
<gate name="-2" symbol="KL+V" x="0" y="0" addlevel="always"/>
</gates>
<devices>
<device name="" package="W237-102">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-2" pin="KL" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="237-102" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="70K9898" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="S1" library="switch" deviceset="320-938" device=""/>
<part name="X1" library="con-molex" deviceset="5566-20" device=""/>
<part name="X2" library="con-wago-500" deviceset="W237-102" device=""/>
<part name="X3" library="con-wago-500" deviceset="W237-102" device=""/>
<part name="X4" library="con-wago-500" deviceset="W237-102" device=""/>
<part name="X5" library="con-wago-500" deviceset="W237-102" device=""/>
<part name="X6" library="con-wago-500" deviceset="W237-102" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="S1" gate="B" x="2.54" y="45.72" rot="R270"/>
<instance part="S1" gate="1" x="2.54" y="58.42" rot="R270"/>
<instance part="X1" gate="-1" x="116.84" y="73.66"/>
<instance part="X1" gate="-2" x="116.84" y="71.12"/>
<instance part="X1" gate="-3" x="116.84" y="68.58"/>
<instance part="X1" gate="-4" x="116.84" y="66.04"/>
<instance part="X1" gate="-5" x="116.84" y="63.5"/>
<instance part="X1" gate="-6" x="116.84" y="60.96"/>
<instance part="X1" gate="-7" x="116.84" y="58.42"/>
<instance part="X1" gate="-8" x="116.84" y="55.88"/>
<instance part="X1" gate="-9" x="116.84" y="53.34"/>
<instance part="X1" gate="-10" x="116.84" y="50.8"/>
<instance part="X1" gate="-11" x="116.84" y="48.26"/>
<instance part="X1" gate="-12" x="116.84" y="45.72"/>
<instance part="X1" gate="-13" x="116.84" y="43.18"/>
<instance part="X1" gate="-14" x="116.84" y="40.64"/>
<instance part="X1" gate="-15" x="116.84" y="38.1"/>
<instance part="X1" gate="-16" x="116.84" y="35.56"/>
<instance part="X1" gate="-17" x="116.84" y="33.02"/>
<instance part="X1" gate="-18" x="116.84" y="30.48"/>
<instance part="X1" gate="-19" x="116.84" y="27.94"/>
<instance part="X1" gate="-20" x="116.84" y="25.4"/>
<instance part="X2" gate="-1" x="73.66" y="73.66"/>
<instance part="X2" gate="-2" x="73.66" y="68.58"/>
<instance part="X3" gate="-1" x="73.66" y="60.96"/>
<instance part="X3" gate="-2" x="73.66" y="55.88"/>
<instance part="X4" gate="-1" x="73.66" y="48.26"/>
<instance part="X4" gate="-2" x="73.66" y="43.18"/>
<instance part="X5" gate="-1" x="73.66" y="35.56"/>
<instance part="X5" gate="-2" x="73.66" y="30.48"/>
<instance part="X6" gate="-1" x="73.66" y="22.86"/>
<instance part="X6" gate="-2" x="73.66" y="17.78"/>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
