// Troublemaker v2: Print Bed Level Bolts
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 128;

rotate([180]) difference() {
import ("print_bed_level_bolts_holder_original.stl");

    translate([2.7,5.15,-1]) color("red") cylinder(d=3, h=100);
    translate([22.7,5.15,-1]) color("red") cylinder(d=3, h=100);

}
