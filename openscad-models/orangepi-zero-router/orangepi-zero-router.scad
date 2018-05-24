
// Startpoint Router ground:

le=90;
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

module merkur_snap() {
        cube([2,6,5]);
    hull(){
        translate([0,0,2])cube([2,6,3]);
        translate([1,1,3])cube([2.45,4,1]);
    }
}

union(){

     translate ([-le,-br/2+1.5,0])cube([le, br-3,2.1]);

     translate([0-1,-br/2+1.5,0])rotate([0,-0,0])cube([1,br-3,hr]);
     translate([0-le,-br/2+1.5,0])rotate([0,0,0])cube([1,br-3,hr]);
     

     usb_sdcard();
     usb_eth();
    
    $fn=100;
    translate([-4.5,21,2])cylinder(4, 3, 3, center=true);
    translate([-4.5,-21,2])cylinder(4, 3, 3, center=true);
    translate([-4.5-40,21,2])cylinder(4, 3, 3, center=true);
    translate([-4.5-40,-21,2])cylinder(4, 3, 3, center=true);

    translate([-4.5,21,4])cylinder(8, 1.25, 1.25, center=true);
    translate([-4.5,-21,4])cylinder(8, 1.25, 1.25, center=true);
    translate([-4.5-40,21,4])cylinder(8, 1.25, 1.25, center=true);
    translate([-4.5-40,-21,4])cylinder(8, 1.25, 1.25, center=true);

   translate([-76,-12,0])rotate([0,0,0])cube([1,5,5]);
   translate([-76+24.5,-12,0])rotate([0,0,0])cube([1,5,5]);
   translate([-60,-23,2])rotate([0,0,90])merkur_snap();
   translate([-70-6,12,2])rotate([0,0,-90])merkur_snap();
   translate([-50-6,12,2])rotate([0,0,-90])merkur_snap();
   
 }
