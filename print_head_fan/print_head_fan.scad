// Troublemaker v2: Print Head Fan
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 128;

magnet_t=2.05;

module original() {
    rotate([90]) difference() {
        import ("print_head_fan_original.stl");
    }
}

module magnet_hole() {
    union() {
        translate([0,0,0.2]) cylinder(d1=6.45, d2=6.5, h=magnet_t);
        translate([0,0,-1]) cylinder(d=6.0, h=2);
        translate([0,0,magnet_t]) cylinder(d1=6.0, d2=8, h=3);
    }
}


module cutin() {
    color("blue") cylinder(d=7.5, h=5.0, center=false);
}

rotate([0,180,0])
difference() {
    union() {
        original();
        translate([4.75,-17.65,0]) cutin();
        translate([4.75,-35.65,0]) cutin();
    }
    translate([4.75,-17.65,5]) rotate([0,180,0]) magnet_hole();
    translate([4.75,-35.65,5]) rotate([0,180,0]) magnet_hole();
}