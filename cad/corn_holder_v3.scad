axle_inner_diam = 2.8;
axle_outer_diam = 5;
axle_outer_top_diam = 5.5;
axle_length = 17;

top_diam = 15;
top_thickness = 1.5;
top_washer_diam = 12;
top_washer_thickness = 0.5;

module corn_holder() {
	render() difference() {
		cylinder(d1=axle_outer_diam, d2=axle_outer_top_diam, h=axle_length+0.1, $fn=20);
		cylinder(d=axle_inner_diam, h=7, $fn=20); 
	}
	translate([0 , 0, axle_length]) { 
		render() difference() {
			cylinder(d=top_diam, h=top_thickness,$fn=40);
			//translate([0,0,top_thickness-top_washer_thickness]) cylinder(d=top_washer_diam, h=top_washer_thickness,$fn=40);
		}
	}
}

rotate([180,0,0]) translate([0,0,-axle_length-top_thickness]) corn_holder();