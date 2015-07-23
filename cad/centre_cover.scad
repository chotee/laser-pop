use <basics.scad>
use <laser_elements.scad>
use <penta_elements.scad>

module base_plate() {
    base_plate_thickness = 3;
    base_plate_width = 500;
    base_plate_height = 500;
    cube([base_plate_height, base_plate_width, base_plate_thickness], true);
}

module kernel() {
    scale([8,8,10]) sphere(1, $fn=12);
}

//kernel(); // The center of it all.
//base_plate();
LaserMount();