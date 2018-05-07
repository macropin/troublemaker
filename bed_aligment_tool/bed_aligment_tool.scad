// Bed alignment tool

$fn = 32; // accuracy of curves
pad = 0.01; // padding to maintain mainfold
fudge = 0.25; // extra space for push fit

t = 2.0;
w = 50.0;
bed_w = 20.5;
bed_h = 10.5;


rotate([90,0,0]) 
difference() {
    
    union() {
        translate([0,0,bed_h+t]) cube([t,w,t]);
        cube([bed_w+t,w,bed_h+t]);
        translate([bed_w-t,0,-t]) cube([t*2,w,t]);
    }
    cube([bed_w,w,bed_h]);

}