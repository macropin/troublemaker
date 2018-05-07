// Troublemaker v2: Hot End Strain Relief (Redux)
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 64;
fudge = 0.30; // extra space tolerance
t = 3.0; // thickness


module pipe(length, inner_d, outer_d) {
    difference() {
        cylinder(d=outer_d, h=length);
        color("red") cylinder(d=inner_d, h=length*100, center=true);
    }
}


module mount() {

    color("blue") 
    difference() {
        union() {
            translate([-3-pad,18,-85])
                rotate([90,0,0])
                    import("print_head.stl");
            
            translate([-50,9,0])
                rotate([0,90,0]) 
                    cylinder(d=12, h=100);
            
            translate([12.29,9,-50]) 
                cylinder(d=4.1, h=100);
            
            translate([7,0,7]) 
                cube([8,12,3]);

        }
        translate([0,0,-50-pad])
            cube([100,100,100], center=true);
        
    }
}

module block() {
    difference() {
        translate([-3,-2,0]) color("grey") cube([27-pad+3,22,22]);
        translate([8,-2,17]) color("red") cube([19,22,8]);
        translate([-50,8,22]) rotate([0,90,0]) cylinder(d=8.5,h=100);

        // cutout for ziptie
        d = 11.5;
        t = 3.5;

        translate([1.5,8,22]) rotate([0,90,0]) pipe(5.1, d, d+t);

    }
    
}


rotate([0,-90,0])
difference() {
    block();
    mount();
}



