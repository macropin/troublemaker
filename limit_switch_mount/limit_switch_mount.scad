// Troublemaker v2: Limit Switch Mount
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 128;
fudge = 0.4; // extra space tolerance

arm_t = 1;

thickness = 6.3;

hole_spacing = 9.5;
hole_dia = 3.5;
hole_offset = 2.1; // offset from centre of block

switch_width = 19.8 + fudge;
switch_thickness = 6.4 + fudge;
switch_height = 9.5 + fudge;


color("blue") difference() {
    cube([switch_width,thickness,switch_height], center=true);
    translate([-hole_spacing/2,0,-hole_offset]) rotate([90,0,0]) cylinder(d=hole_dia, h=100, center=true);
    translate([hole_spacing/2,0,-hole_offset]) rotate([90,0,0]) cylinder(d=hole_dia, h=100, center=true);
}

translate([(switch_width+arm_t)/2,(switch_thickness+arm_t)/2,0]) rotate([0,180,0]) arm();
translate([-(switch_width+arm_t)/2,(switch_thickness+arm_t)/2,0]) arm();


// switch body
//color("grey") translate([0,switch_thickness,0]) cube([switch_width,switch_thickness,switch_height], center=true);


module arm() {
    length = thickness+switch_thickness+arm_t;
    
    cube([arm_t,length, switch_height], center=true);
    translate([arm_t,(length-arm_t)/2,0]) cube([arm_t,arm_t, switch_height], center=true);
}


