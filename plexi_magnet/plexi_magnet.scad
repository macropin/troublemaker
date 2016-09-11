// Troublemaker v2: Plexi Magnet
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 128;

body_dia=12.2;
body_height=3.8;

difference() {
    hull() {
        cylinder(d=body_dia, h=body_height);
        translate([10,0,0]) cylinder(d=body_dia, h=body_height);
    }

    magnet_t=2.05;
    translate([0,0,0.2]) cylinder(d1=6.45, d2=6.5, h=magnet_t);
    translate([0,0,-1]) cylinder(d=6.0, h=2);
    translate([0,0,magnet_t]) cylinder(d1=6.0, d2=8, h=3);

    translate([10,0,body_height-2.2]) cylinder(d=8.25, h=100, $fn=4);
    translate([10,0,-50]) cylinder(d=3.6, h=100);

}
