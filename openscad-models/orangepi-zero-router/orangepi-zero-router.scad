
// Startpoint Router ground:

le=90;
br=55;
hr=25;

module usb_eth(){
    difference() {
        translate([0-le,-br/2,0])cube([le,1.5,hr]);
        translate([0-16,-br/2-0.5,8])cube([6,3,13]);        
        translate([0-15-19,-br/2-0.5,8])cube([14.5,3,13]);        
    }
 }

module usb_sdcard(){
    difference() {
        translate([0-le,br/2-1.5,0])cube([le,1.5,hr]);
        translate([0-8-9,br/2-2,7])cube([8,3,3]);        
        translate([0-12-25,br/2-2,3])cube([12,3,2]);        
    }
}

module merkur_snap() {
        cube([1.5,6,6]);
    hull(){
        translate([0,0,2])cube([2,6,4]);
        translate([1,1,4])cube([2.45,4,1]);
    }
}

module orange_snap() {
    hull(){
        translate([0,0,2])cube([2,6,4]);
        translate([1,1,4])cube([2.45,4,1]);
    }
}

module holders(){
   translate([0-1.5,-br/2+10,hr-4])sphere (d=3);
   translate([0-1.5,+br/2-10,hr-4])sphere (d=3);
   translate([0-le+1.5,-br/2+10,hr-4])sphere (d=3);
   translate([0-le+1.5,+br/2-10,hr-4])sphere (d=3);
}
union(){
     translate ([-le,-br/2,0])cube([le, br,2.1]);
     translate([0-1.5,-br/2,0])rotate([0,-0,0])cube([1.5,br,hr]);
     translate([0-le,-br/2,0])rotate([0,0,0])cube([1.5,br,hr]);

     usb_sdcard();
     usb_eth();
    
    $fn=100;
    translate([-5.5,22.5,3])cylinder(5, 3, 3, center=true);
    // translate([-5.5,22.5,4])cylinder(8, 1.25, 1.25, center=true);

    translate([-5.5,-20,3])cylinder(5, 3, 3, center=true);
    //translate([-5.5,-20,4])cylinder(8, 1.25, 1.25, center=true);

    translate([-5-41,22.5,3])cylinder(5, 3, 3, center=true);
    translate([-5-41,22.5,4])cylinder(8, 1.25, 1.25, center=true);

    translate([-5-41,-20,3])cylinder(5, 3, 3, center=true);
    translate([-5-41,-20,4])cylinder(8, 1.25, 1.25, center=true);

   translate([-81.5,-12,0])rotate([0,0,0])cube([1,5,6]);
   translate([-81+25,-12,0])rotate([0,0,0])cube([1,5,6]);
   translate([-65,-25,2])rotate([0,0,90])merkur_snap();
   translate([-78-6,15,2])rotate([0,0,-90])merkur_snap();
   translate([-52-6,15,2])rotate([0,0,-90])merkur_snap();
 
   translate([0,-17,5])rotate([0,0,180])orange_snap();
   translate([0,25,5])rotate([0,0,180])orange_snap();
   translate([-50,22,0])rotate([0,0,0])cube([1,5,8]);
   translate([-50,-25,0])rotate([0,0,0])cube([1,5,8]);

   holders();
 }
