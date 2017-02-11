// Troublemaker v2: Vibration Mount
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 128;
fudge = 0.4; // extra space tolerance

w = 23.75;
l = 85.5;
t = 5;

difference() {
    color("red") cube([w,l,t]);

    translate([w/2+0.5,11.25,0])
        color("green") cylinder(d=6,h=100, center=true);

    translate([w/2+0.5,l-11.25,0])
        color("green") cylinder(d=6,h=100, center=true);
        
}