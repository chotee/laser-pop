use <basics.scad>
use <laser_elements.scad>
use <penta_elements.scad>

Dihedral_angle=116.56505;

module base_plate() {
    base_plate_thickness = 3;
    base_plate_width = 500;
    base_plate_height = 500;
    cube([base_plate_height, base_plate_width, base_plate_thickness], true);
}

module kernel() {
    scale([8,8,10]) sphere(1, $fn=12);
}

module top_plate(size) {
    material_thickness = 3;
    color("Sienna") translate([0,0, sin(72)*(size*1.11803)-6]) Penta(size, material_thickness);
}

module dome(size) {
    material_thickness = 3;
    for(i=[0:4]) {
        color("Crimson", 0.7) rotate([0,0,i*72]) translate([0,-(1.3)*size,0]) rotate([180-Dihedral_angle,0,0]) Penta_segment(size, material_thickness);
    }
}

module anti_dome(size) {
    material_thickness = 3;
    for(i=[0:4]) {
        color("FireBrick", 0.7) rotate([0,0,i*72]) translate([0,-(1.3)*size-material_thickness,0]) rotate([-180+Dihedral_angle,0,0]) Penta_segment(size, material_thickness);
    }
}

module light_guide(diam, thickness, length) {
    rotate([90, 0, 0]) difference() {
        cylinder(d=diam, h=length);
        //translate([0,0,-1]) cylinder(d=diam-thickness, h=length+2);
    }
}

module light_sink() {
    sink_diam = 30;
    color("MidnightBlue") rotate([-90, 0, 0]) cylinder(d=sink_diam, h=1);
}

module laser_setup() {
    tube_external_diameter = 15.88;
    color("LightCyan") translate([-50, -300, -12]) cube([100,150,3]);
    translate([0, -70, 0]) light_guide(tube_external_diameter, 1, 100);
    translate([0, -175, ]) rotate([0,0,180]) LaserMount();
    translate([0, -250, 5]) LaserCurrentControl();
    translate([0,  70+100, 0]) light_guide(tube_external_diameter, 1, 100);
    translate([0,  70+100, 0]) light_sink();
}

kernel(); // The center of it all.
//color("LightGrey") translate([0,0,-20]) base_plate();
//translate([0,0,-20]) top_plate(100);
translate([0,0,0]) dome(100);
translate([0,0,0]) anti_dome(100);
for(i=[0:4]) {
    rotate([-8*i,0,72*i]) laser_setup();
}