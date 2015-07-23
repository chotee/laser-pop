use <basics.scad>

module PSU() {
	PsuX=150;
	PsuY=150;
	PsuZ=100;
	translate([-PsuX/2, 0,-PsuZ]) cube([PsuX, PsuY, PsuZ]);
}

module LaserCurrentControl() {
	color("Green") cube([50,50,30], center=true);
}
module LaserMount() { // The mount and lens housing and fixing the laser diode.
    laser_mount_width = 35;
    laser_mount_length = 35;
    laser_mount_height = 18;
    laser_mount_side_width = 7;
    laser_mount_side_thickness = 3;
    laser_mount_drill_hole_size = 4;

    color("DimGray") translate([0, 6, 0]) difference() {
        translate([-laser_mount_width/2, 0, -10]) difference() {
            union() {
                translate([]) cube([laser_mount_side_width, laser_mount_length, laser_mount_side_thickness]);
                translate([laser_mount_width - laser_mount_side_width, 0, 0]) cube([laser_mount_side_width, laser_mount_length, laser_mount_side_thickness]);
                translate([laser_mount_side_width, 0, 0]) cube([laser_mount_width-2*laser_mount_side_width, laser_mount_length, laser_mount_height]);
            }
            translate([laser_mount_side_width/2, laser_mount_length/3]) drill_hole(laser_mount_drill_hole_size);
            translate([laser_mount_side_width/2, laser_mount_length/3*2]) drill_hole(laser_mount_drill_hole_size);
            translate([laser_mount_width - laser_mount_side_width/2, laser_mount_length/3]) drill_hole(laser_mount_drill_hole_size);
            translate([laser_mount_width - laser_mount_side_width/2, laser_mount_length/3*2]) drill_hole(laser_mount_drill_hole_size);
        }
        translate([0,-1,0]) rotate([-90, 0,0]) cylinder(h=50, d=10);
    }
    color("SlateGray") translate([0,5,0]) rotate([90, 0, 0]) cylinder(d=10, h=5);
}
module LaserSink() {
	color("Blue") cube([25,35,30], center=true);
}