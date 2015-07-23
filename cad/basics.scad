module drill_hole(drill_hole_size) {
//    echo(drill_hole_size);
    cylinder(d=drill_hole_size, h=100, center=true, $fn=drill_hole_size*4);
}