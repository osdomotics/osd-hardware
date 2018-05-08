
// Startpoint Fensteralarm top:

le=85;
br=26;

union(){

     translate ([-le,-br/2+1,-2])cube([le, br-2,2.1]);

     translate([0-1,-br/2+1,0])cube([1,br-2,19]);
     translate([0-le,-br/2+1,0])cube([1,br-2,19]);

    translate([0-1.5,0,17])rotate([90,0,0])cylinder(br-8, 1.5, 1.5, center=true);
    translate([0-le+1.5,0,17])rotate([90,0,0])cylinder(br-8, 1.5, 1.5, center=true);

 }
