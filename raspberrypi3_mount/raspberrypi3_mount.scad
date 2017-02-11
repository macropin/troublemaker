// Troublemaker v2: Raspberry PI 3 Mount
// https://github.com/macropin/troublemaker

fudge = 0.25;
pad = 0.001;
$fn = 32;

module screw_hole(d=2.5) {
    color("red") cylinder(d=d, h=100, center=true);
}

module stand_off(h=8.0, d=2.5, do=6.5) {
    color("blue") difference() {
        cylinder(d=do, h=h);
        cylinder(d=d, h=100);
    }
}

module raspberrypi_mount(t=1.0) {
    screw_offset=3.5;
    screw_d = 2.5;
    difference() {
        union() {
            hull() {
                translate([screw_offset,screw_offset,0]) cylinder(d=8,h=1);
                translate([screw_offset+58,screw_offset,0]) cylinder(d=8,h=1);
                translate([screw_offset,screw_offset+48+screw_d/2,0]) cylinder(d=8,h=1);
                translate([screw_offset+58,screw_offset+48+screw_d/2,0]) cylinder(d=8,h=1);
            }
            translate([screw_offset,screw_offset,0]) stand_off();
            translate([screw_offset+58,screw_offset,0]) stand_off();
            translate([screw_offset,screw_offset+48+screw_d/2,0]) stand_off();
            translate([screw_offset+58,screw_offset+48+screw_d/2,0]) stand_off();
            
            // main mount
        translate([(85-47.5)/2-10,56/2,0]) cylinder(d=7, h=8-3);
        translate([(85+47.5)/2-10,56/2,0]) cylinder(d=7, h=8-3);
        }
        // main mount
        translate([(85-47.5)/2-10,56/2,0]) screw_hole(d=3);
        translate([(85+47.5)/2-10,56/2,0]) screw_hole(d=3);
    }
}

module converter_mount() {

    w = 20.10+fudge;
    h = 52.45+fudge;
    t = 1.65;
    extra = 5.0;

    difference() {
        union() {
            cube([w+extra, h+extra, 1.0]);
            color("blue") cube([extra/2+2,h+extra,6-fudge]);
            color("blue") translate([(w+extra)-(extra/2+2),0,0]) cube([extra/2+2,h+extra,6-fudge]);
        }
        translate([extra/2,extra/2,5]) color("red") cube([w, h, 1.0]);
        translate([extra/2,extra/2,3]) color("green") cube([w, 5, 5.0]);
        translate([extra/2,h-extra/2,3]) color("green") cube([w, 5, 5.0]);
        translate([0,10,1]) cube([100,5,2]);
        translate([0,h/2,1]) cube([100,5,2]);
        translate([0,h-10,1]) cube([100,5,2]);
    }
}

union() {
    translate([0,-56/2,0]) raspberrypi_mount();
    translate([-32,-(52.45+fudge+5)/2,0]) converter_mount();
    translate([-10,-56/2,0]) cube([15,56,1]);
}

//raspberrypi_mount(t=1.0);