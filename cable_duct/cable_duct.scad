// Troublemaker v2: Cable Duct
// https://github.com/macropin/troublemaker

pad = 0.001;
$fn = 128;
fudge = 0.25; // extra space tolerance

length = 20;
cable_d = 1.60;
thickness = 0.8;
m3 = 3.0;


// calcs
hole_outer = m3 +thickness*2;

inner_w = cable_d * 6 + fudge + hole_outer;
inner_t = cable_d + fudge;


module cable_control() {

    difference() {
        union() {
            difference() {
                    translate([pad,-thickness,-thickness]) color("red") cube([length-pad, inner_w+thickness*2, inner_t+thickness]);
                    cube([length+pad, inner_w+pad, inner_t+pad]);
            }
            translate([length/2,inner_w/2,0]) color("blue") screw_hole();
        }
        translate([length/2,inner_w/2,-50]) color("brown") cylinder(d=m3, h=100); 
    }
}


module screw_hole() {
    cylinder(d=3+thickness*2, h=inner_t);
}


for (n =[0:7]){
    translate([length*n,0,0]) cable_control();    
} 
