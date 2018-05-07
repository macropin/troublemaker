// Troublemaker v2: Print Head Fan - Double
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 128;

module mount() {
    include <print_head_fan.scad>;
}

rotate([180,0,0]) {
    mount();
    mirror([0,1,]) translate([0,53,0]) mount();
}

