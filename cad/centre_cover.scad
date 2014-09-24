base_rad=50;
height=3;
thickness=1.5;
disks=5;
for(i= [0:floor(base_rad/height)]) {
	echo(i, 
i*3/base_rad, 
asin(i*height/base_rad), 
cos(asin(i*height/base_rad))*base_rad
);
	#translate([0,i%disks*base_rad*2,floor(i/disks)*(height+1)]) {
	//translate([0,0,i*height]) {
        render() difference() {
            cylinder(h=height, r=cos(asin(i*height/base_rad))*(base_rad), $fn=50);
            cylinder(h=height, r=cos(asin((i+1)*height/base_rad))*(base_rad)-thickness, $fn=50); 
    }
	}
}