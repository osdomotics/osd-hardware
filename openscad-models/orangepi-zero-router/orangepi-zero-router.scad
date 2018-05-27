
// Startpoint Router ground:

le=90;
br=55;
hr=25;

module usb_eth(){
    difference() {
        translate([0-le,-br/2,0])cube([le,1.5,hr]);
        translate([0-16,-br/2-0.5,6])cube([6,3,13]);        
        translate([0-16-20,-br/2-0.5,6])cube([16,3,13]);        
    }
 }

module usb_sdcard(){
    difference() {
        translate([0-le,br/2-1.5,0])cube([le,1.5,hr]);
        translate([0-8-9,br/2-2,5.5])cube([8,3,4]);        
        translate([0-12-25,br/2-2,2])cube([12,3,2]);        
    }
}

module merkur_snap() {
        cube([1.5,6,5]);
    hull(){
        translate([0,0,2])cube([2,6,3]);
        translate([1,1,3])cube([2.45,4,1]);
    }
}

union(){
     translate ([-le,-br/2,0])cube([le, br,2.1]);
     translate([0-1.5,-br/2,0])rotate([0,-0,0])cube([1.5,br,hr]);
     translate([0-le,-br/2,0])rotate([0,0,0])cube([1.5,br,hr]);

     usb_sdcard();
     usb_eth();
    
    $fn=100;
    translate([-5,23,2])cylinder(4, 3, 3, center=true);
    translate([-5,23,4])cylinder(8, 1.25, 1.25, center=true);

    translate([-5,-20,2])cylinder(4, 3, 3, center=true);
    translate([-5,-20,4])cylinder(8, 1.25, 1.25, center=true);

    translate([-5-41,23,2])cylinder(4, 3, 3, center=true);
    translate([-5-41,23,4])cylinder(8, 1.25, 1.25, center=true);

    translate([-5-41,-20,2])cylinder(4, 3, 3, center=true);
    translate([-5-41,-20,4])cylinder(8, 1.25, 1.25, center=true);

   translate([-81.5,-12,0])rotate([0,0,0])cube([1,5,5]);
   translate([-81+25,-12,0])rotate([0,0,0])cube([1,5,5]);
   translate([-65,-25,2])rotate([0,0,90])merkur_snap();
   translate([-78-6,15,2])rotate([0,0,-90])merkur_snap();
   translate([-52-6,15,2])rotate([0,0,-90])merkur_snap();
 }
