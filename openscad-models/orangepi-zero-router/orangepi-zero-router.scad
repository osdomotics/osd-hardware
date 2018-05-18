
// Startpoint Router ground:

le=100;
br=53;
hr=25;

union(){

     translate ([-le,-br/2+1.5,-2])cube([le, br-3,2.1]);

     translate([0-1,-br/2+1.5,0])rotate([0,-2,0])cube([1,br-3,hr]);
     translate([0-le,-br/2+1.5,0])rotate([0,2,0])cube([1,br-3,hr]);
     translate([0-90,0-8,0])rotate([0,2,0])cube([1,18,17]);

    $fn=100;
    translate([-4.5,21,0])cylinder(4, 3, 3, center=true);
    translate([-4.5,-21,0])cylinder(4, 3, 3, center=true);
    translate([-4.5-40,21,0])cylinder(4, 3, 3, center=true);
    translate([-4.5-40,-21,0])cylinder(4, 3, 3, center=true);

    translate([-4.5,21,2])cylinder(8, 1.25, 1.25, center=true);
    translate([-4.5,-21,2])cylinder(8, 1.25, 1.25, center=true);
    translate([-4.5-40,21,2])cylinder(8, 1.25, 1.25, center=true);
    translate([-4.5-40,-21,2])cylinder(8, 1.25, 1.25, center=true);

 }
