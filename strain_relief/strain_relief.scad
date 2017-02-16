// Troublemaker v2: Hot End Strain Relief
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 128;
fudge = 0.30; // extra space tolerance

t = 3.0; // thickness

length_outer = 25;
length_inner = 8.0;
cable_d = 8.50 + fudge;
cable_tie_w = 4.8;

module pipe(length, inner_d, outer_d) {
    difference() {
        cylinder(d=outer_d, h=length);
        color("red") cylinder(d=inner_d, h=length*100, center=true);
    }
}

module inner() {
    outer_d = cable_d+t*2.5;
    difference() {
        pipe(length_inner, cable_d, outer_d);
        color("blue") translate([0,0,(length_inner-cable_tie_w)/2]) pipe(cable_tie_w, cable_d+t*1.5, outer_d+fudge);
        translate([0,-5,0]) color("pink") cube([0.5,10,100], center=true);
    }
}

module outer() {
    outer_d = cable_d+t*2;
    difference() {
        union() {
            cylinder(d=outer_d, h=length_outer);
            hull() {
                cylinder(d=outer_d, h=15);
                translate([0,5,0]) cylinder(d=15, h=1);
            }
        }
        color("red") cylinder(d=cable_d, h=100, center=true);
        translate([0,-5,0]) color("pink") cube([0.5,5,100], center=true);
        color("blue") translate([0,0,(length_inner-cable_tie_w)/2]) pipe(cable_tie_w, cable_d+t*1.5, cable_d+t*2.5+fudge);


        translate([0,0,13]) color("blue") translate([0,0,(length_inner-cable_tie_w)/2]) pipe(cable_tie_w, cable_d+t*1.5, outer_d+100+fudge);

    }

}


outer();

//inner();

