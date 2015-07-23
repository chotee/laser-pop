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

module dome(r) {
color("Sienna") translate([0,0, sin(72)*(100*1.11803)-6]) Penta(100, 3);
for(i=[0:4]) {
    rotate([0,0,i*72]) translate([0,-(1.3)*100,0]) rotate([180-Dihedral_angle,0,0]) Penta_segment(100, 3);
}
}

kernel(); // The center of it all.
color("LightGrey") translate([0,0,-20]) base_plate();
//LaserMount();
translate([0,0,-20]) dome();
//Penta_segment(100, 3);