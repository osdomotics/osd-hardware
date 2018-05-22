
// Startpoint Router ground:

le=100;
br=53;
hr=25;

module usb_eth(){
    difference() {
        translate([0-le,-br/2+1.5,0])cube([le,1,hr]);
        translate([0-5-10,-br/2+1,6])cube([5,2,13]);        
        translate([0-13-20,-br/2+1,6])cube([13,2,13]);        
    }
 }

module usb_sdcard(){
    difference() {
        translate([0-le,br/2-1-1.5,0])cube([le,1,hr]);
        translate([0-8-9,br/2-3,5.5])cube([8,2,3]);        
        translate([0-12-25,br/2-3,2])cube([12,2,1.6]);        
    }
}
union(){

     translate ([-le,-br/2+1.5,-2])cube([le, br-3,2.1]);

     translate([0-1,-br/2+1.5,0])rotate([0,-0,0])cube([1,br-3,hr]);
     translate([0-le,-br/2+1.5,0])rotate([0,0,0])cube([1,br-3,hr]);
     translate([0-90,0-8,0])rotate([0,0,0])cube([1,18,17]);

    usb_sdcard();
     usb_eth();
    
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
