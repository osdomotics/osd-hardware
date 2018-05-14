
// Startpoint Fensteralarm top:

le=87.4;
br=26;

union(){

     translate ([-le,-br/2+1.5,-2])cube([le, br-3,2.1]);

     translate([0-1,-br/2+1.5,0])rotate([0,-2,0])cube([1,br-3,18]);
     translate([0-le,-br/2+1.5,0])rotate([0,2,0])cube([1,br-3,18]);

    $fn=100;
    translate([0-1.6,0,17])rotate([90,0,0])cylinder(br-8, 1, 1, center=true);
    translate([0-le+1.6,0,17])rotate([90,0,0])cylinder(br-8, 1, 1, center=true);

 }
