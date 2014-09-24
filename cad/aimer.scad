// Aimer design for the laser holder 

// Extra spacing to print internal sizes more correctly. 
internal_size_fudge = 0.5;

// Sizes of holder
holder_width = 32+internal_size_fudge;
holder_length = 30+internal_size_fudge;
holder_hole_diam = 3 ;
holder_hole_distance = 4; // (3/2+1.8)
holder_corner_diam = 3 ;

// Sizes of the aimer
aimer_border_thickness = 5;
aimer_border_height = 2;
aimer_bottom_thickness = 0.5;

aimer_set_screw_diam = 3.5;
aimer_set_screw_height = 6;
aimer_set_width = 10;
aimer_set_length = 6;
aimer_set_height = 10;
aimer_stud_length = aimer_set_length + 3;

aimer_width = holder_width+aimer_border_thickness*2+aimer_set_width;
aimer_length = holder_length+aimer_border_thickness*2;

stud_width = 30;
stud_screw_diam = 3*1.3;

module holder_point() {
    cylinder(h=50, r=holder_hole_diam/2, $fn=25);
}

module fixed_point() {
    cylinder(h=50, r=stud_screw_diam/2, $fn=25);
}

module holder() {
	render() difference() {
		union() { 
			cube([holder_width, holder_length, 30]);

			translate([1, 1, 0]) cylinder(h=30, r=holder_corner_diam/2, $fn=10);
			translate([holder_width-1, 1, 0]) cylinder(h=30, r=holder_corner_diam/2, $fn=10);
			translate([holder_width-1, holder_length-1, 0]) cylinder(h=30, r=holder_corner_diam/2, $fn=10);
			translate([1, holder_length-1, 0]) cylinder(h=30, r=holder_corner_diam/2, $fn=10);
			translate([holder_hole_distance,
					   holder_length/2,
					   -10]) scale(1.35) holder_point();
		} 
		translate([holder_width-holder_hole_distance,
				   holder_length/2,
				   -10]) scale(1/1.2) holder_point();
	}
}

module aimer_setter() {
	render() difference() {
		cube([aimer_set_width, 
			  aimer_set_length, 
			  aimer_set_height]); 
		translate([aimer_set_width/2,
				   aimer_set_length*1.5,
				   aimer_set_screw_height]) rotate([90,0,0]) 
				scale([1.2,1,1]) cylinder(h=aimer_set_length*2,
					       r=aimer_set_screw_diam/2, $fn=25);
	}
}

module aimer_baseplate() {
	cube([aimer_width, 
		  aimer_length,
  		  aimer_border_height+aimer_bottom_thickness ]);
	translate([aimer_width-aimer_set_width,
			   aimer_set_length,
                 aimer_border_height+aimer_bottom_thickness]) cube([aimer_set_width, 2.5, 1]); // ledge to stop setting nut from turning.
}

module aimer() {
	render() difference() {
		union() { 
			aimer_baseplate();
			translate([aimer_width-aimer_set_width,0,0]) aimer_setter();
		}
		translate([aimer_border_thickness,
				   aimer_border_thickness,
				   aimer_bottom_thickness]) holder();
	}
}


module aimer_stud() {
  render() difference() {
        union() {
            translate([(stud_width-aimer_set_width)/2,0,0]) aimer_setter();
            cube([stud_width,
                  aimer_stud_length,
                  aimer_bottom_thickness+aimer_border_height]);
        }
        translate([stud_width/2,-0.1,aimer_set_screw_height]) rotate([-90,0,0]) taper();
        translate([5,
                   aimer_stud_length/2,
                   0]) fixed_point();
        translate([stud_width-5,
                   aimer_stud_length/2,
                   0]) fixed_point();
    }
}

module taper() {
    cylinder(r1=5/2, r2=3/2, h=2, $fn=25);
}

aimer();

translate([aimer_width-20,
           -20,
           0]) aimer_stud();