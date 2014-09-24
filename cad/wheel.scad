x_disp = 0;
nr_of_kernels = 7;

module wheel_body() { 
			difference() {	
		translate([0,0,-5.5]) cylinder(h=11, r=40/2, $fn=200);

	union() {
		rotate_extrude() translate([27-2, 0, 0]) circle(r = 7);
		for (j = [0:72]) {
			translate([sin(j*360/72)*25, 
						cos(j*360/72)*25, 0])
				rotate([0,0,-j*360/72])
				 scale([0.2,1,1]) sphere(r=8);
			
		}

}
	}
}

module main_axle() {
	translate([0,0,-20/2]) { 
		cylinder(h=20, r=3/2, $fn=20);
	}
}

module kernel_space() {
	sphere(r=12/2, $fn=30);
	rotate([0,90,0]) {
		cylinder(h=8, r=12/2);
	}
}


module wheel() {
	difference() {
		wheel_body();
		for (i = [0:8]) {
			translate([sin(i*360/nr_of_kernels)*30/2,
						  cos(i*360/nr_of_kernels)*30/2, 0]) { 
				rotate([0,0,-i*360/nr_of_kernels+90]) {
					kernel_space();
      			}
 			}
		}
		main_axle();
	};
}

wheel();