golden_ratio = (1+sqrt(5))/2;

BaseWidth = 200;
ChamberWidth=BaseWidth/2.62;
BasePlateThickness=3;
WallWidth=3;
WallHeight=20;
Dihedral_angle=116.56505;

module Penta_part(r,h) {
polyhedron(
	points=[
		[0,0,0],
		[sin(72*0)*r, cos(72*0)*r, 0],
		[sin(72*1)*r, cos(72*1)*r, 0],
		[0,0,h],
		[sin(72*0)*r, cos(72*0)*r, h],
		[sin(72*1)*r, cos(72*1)*r, h]
	],
	faces=[
		[0,1,2],
		[0,1,4,3],
		[1,2,5,4],
		[2,0,3,5],
		[3,4,5]
	]
);
}

module Penta_segment(r, h) {
polyhedron(
	points=[
		[sin(72*1)*r, cos(72*1)*r, 0],
		[sin(72*2)*r, cos(72*2)*r, 0],
		[sin(72*3)*r, cos(72*3)*r, 0],
		[sin(72*4)*r, cos(72*4)*r, 0],
		[sin(72*1)*r, cos(72*1)*r, h],
		[sin(72*2)*r, cos(72*2)*r, h],
		[sin(72*3)*r, cos(72*3)*r, h],
		[sin(72*4)*r, cos(72*4)*r, h]
	], 
	faces=[
		[0,1,2,3],
		[0,1,5,4],
		[1,2,6,5],
		[2,3,7,6],
		[3,0,4,7],
		[4,5,6,7],
	]
);
}

module Penta(r,h) { 
// r = (outer) Radius of the penta
// h = height of the penta. 
	for (i=[0:4]) {
		rotate(i*72, 0,0) Penta_part(r,h);
	}
}

module Tablet() {
	Twidth=190;
	Theight=240;
	Tdepth=15;
	translate([-Twidth, 0,0]) cube([Twidth, Theight, Tdepth]);
}

module Base() {
	rotate([0,0,72/2]) union() {
		BasePlate();
		BaseWalls();
	}
}

module BasePlate() {
	//difference() {
		Penta(BaseWidth,BasePlateThickness);
	//	cube([10,10,10], center=true);
		color("Purple") translate([0,0,-0.1]) rotate([0,0,72/2]) Penta(ChamberWidth+ChamberWidth*1.18*cos(180-Dihedral_angle),BasePlateThickness+0.2);
	//}
}

module BaseWalls() {
	render() difference() {
		Penta(BaseWidth,WallHeight);
		Penta(BaseWidth-WallWidth,WallHeight);
	}
}

module PSU() {
	PsuX=150;
	PsuY=150;
	PsuZ=100;
	translate([-PsuX/2,ChamberWidth,-PsuZ]) cube([PsuX, PsuY, PsuZ]);
}

module LaserPCB() {
	color("Green") cube([50,50,30], center=true);
}
module LaserDiode() {
	color("Red") cube([35,35,30], center=true);
}
module LaserSink() {
	color("Blue") cube([25,35,30], center=true);
}

module Integration() {
	Base();
	color("Blue") PSU();
	translate([-ChamberWidth,0,WallHeight]) rotate([80,0,0]) Tablet();
}


module Chamber() {
	//translate([0,0,5]) 
	rotate([0,0,72/2]) color("Pink") Penta(ChamberWidth, 3);
	for(i=[0:4]) {
		rotate([0,0,i*72]) translate([0,ChamberWidth*0.81,0]) rotate([180-116.56, 0, 0]) translate([0,ChamberWidth*0.81,0]) Penta_segment(ChamberWidth,3);
	}
}

BasePlate();
//rotate([0,0,0]) translate([BaseWidth,0,0]) LaserPCB();

for(i=[0,72,144,216,288]) {
	rotate([0,0,72*i]) translate([BaseWidth*0.70,0,0]) LaserDiode();
	rotate([0,0,72*i+180]) translate([BaseWidth*0.70,0,0]) LaserSink();
}
//Penta(BaseWidth,BasePlateThickness);

translate([0,0,-ChamberWidth*1.18*sin(116.56)]) Chamber();

//translate([]) LaserPCB();

//Integration();