// Led Mounting strip for Troublemaker v2


$fn = 32; // accuracy of curves
pad = 0.01; // padding to maintain mainfold
fudge = 0.25; // extra space for push fit

t = 2.5;

led_width = 10.0 + fudge;
mount_width = 25.0;

hole_spacing = 38.0;
hole_dia = 3;

module channel(width) {
    cube([width,led_width, t], center=true);
}

module hole(){
    difference() {
        cylinder(d=hole_dia+t*2, h=t*2, center=true);
        cylinder(d=hole_dia, h=100, center=true);
    }
}

module mount(holes=false, r_cut=true, l_cut=true, width=50) {

    thickness = t*2;
    height = led_width*2+hole_dia+t*4;

    difference() {
        union() {
            translate([0,0,-t/2-pad]) color("blue") cube([width-pad,height,thickness], center=true);

        }
        o = hole_dia/2+t;

        translate([0,led_width/2+o,0]) channel(width);
        translate([0,-led_width/2-o,0]) channel(width);

        cube([width,hole_dia, t], center=true);
        
        if (holes) {
            translate([hole_spacing/2,0,-t/2-pad]) cylinder(d=hole_dia, h=100, center=true);
            translate([-hole_spacing/2,0,-t/2-pad]) cylinder(d=hole_dia, h=100, center=true);
        }
            
        // end cut
        if (r_cut) translate([width/2,0,0]) color("red") cube([3,100,1.25], center=true);
        if (l_cut) translate([-width/2,0,0]) color("red") cube([3,100,1.25], center=true);
    }

}

union() {
    translate([-127,0,0]) mount(width=4, l_cut=false);
    translate([-100,0,0]) mount();
    translate([-50,0,0]) mount();
    mount(holes=true);
    translate([50,0,0]) mount();
    translate([100,0,0]) mount();
    translate([127,0,0]) mount(width=4, r_cut=false);

    // mounting holes
    translate([hole_spacing/2,0,-t/2-pad]) hole();
    translate([-hole_spacing/2,0,-t/2-pad]) hole();
}