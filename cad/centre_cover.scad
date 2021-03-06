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

module dome_connector(size, height, thickness) {
    angle = 72;
    size2 = cos(angle)*size+size;
    offset_x = cos(Dihedral_angle)*height;
    offset_y =cos(Dihedral_angle)*height;

    polyhedron(
        points=[
            [0,0,0],
            [size, 0,0],
            [size-cos(angle)*thickness, sin(angle)*thickness,0],
            [thickness-cos(angle)*thickness, sin(angle)*thickness,0],
            [thickness-cos(angle)*size, size,0],
            [-cos(angle)*size, size,0],
            [offset_x+0, offset_y+0,-height],
            [offset_x+size2, offset_y+0, -height],
            [offset_x+size2-cos(angle)*thickness, offset_y+sin(angle)*thickness, -height],
            [offset_x+thickness-cos(angle)*thickness, offset_y+sin(angle)*thickness, -height],
            [offset_x+thickness-cos(angle)*size2, offset_y+size2, -height],
            [offset_x+-cos(angle)*size2, offset_y+size2, -height]
        ],
        faces=[
            [0,1,2], [2,3,0], [3,0,4], [0,4,5], // top
            [0,6,1], [6,1,7], // side down-down
            [1,7,2], [2,7,8], // side right-right
            [2,3,8], [8,9,3], // side down-up
            [3,9,10], [3,4,10], // side right-left
            [4,10,11], [11,4,5], // side up-up
            [11,5,0], [11,6,0], // side left-left
            [6,7,8], [8,9,6], [9,6,10], [6,10,11], // bottom
        ]
    );
    //translate([0,cos(72)*-70,sin(72)*70]) rotate([-Dihedral_angle+180,0,0])
    //translate([0,20,0]) rotate([72,0,0]) dome_connector_side();
    //translate([0,0,0]) drill_hole(3);
}

module dome(size) {
    side_offset_angle = 0; // 1.5;
    material_thickness = 3;
    connector_bottom_offset = size/5*4;
    for(i=[0:1]) {
        rotate([0,0,i*72]) translate([0,-(1.285)*size,0]) {
            translate([-size/2, cos(180-Dihedral_angle)*connector_bottom_offset, 15+connector_bottom_offset]) rotate([0,0,0]) dome_connector(20, 15, 2);
            rotate([180-Dihedral_angle,0,side_offset_angle]) {
                color("Crimson", 0.7) Penta_segment(size, material_thickness);
            }
        }
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

module laser_beam() {
    color("Blue") rotate([90,0,0]) {
        //translate([0,0,10]) cylinder(d=2, h=340, center=true);
        translate([0,0,0]) cylinder(d=2, h=180, center=false);
    }

}

module laser_setup() {
    tube_external_diameter = 15.88;
    color("LightCyan") translate([-50, -300, -12]) cube([100,150,3]);
    translate([0, -110, 0]) light_guide(tube_external_diameter, 1, 60);
    translate([0, -175, ]) rotate([0,0,180]) LaserMount();
    translate([0, -250, 5]) LaserCurrentControl();
    translate([0,  70+100, 0]) light_guide(tube_external_diameter, 1, 50);
    translate([0,  70+100, 0]) light_sink();
    translate([]) laser_beam();
}

//kernel(); // The center of it all.
//color("LightGrey") translate([0,0,-20]) base_plate();
//translate([0,0,-20]) top_plate(100);
translate([0,0,0]) dome(100);
//translate([0,0,0]) anti_dome(100);
//for(i=[0:4]) {
//    rotate([-8*i,0,72*i]) laser_setup();
//}