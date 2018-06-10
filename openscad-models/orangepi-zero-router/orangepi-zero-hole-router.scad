// Startpoint Router ground:

le=90;
br=55;
hr=25;
$fn=20;

union(){
    difference() {
      translate ([0,0,0])cube([le, br,2]);
      translate ([5,5,-0.5])cube([35, 3,3]);
      translate ([5,20,-0.5])cube([35, 3,3]);
      translate ([5,35,-0.5])cube([35, 3,3]);
    }
    translate ([2.1,2.1,0])cube([le-4.2, 2,4]);
    translate ([2.1,br-4.2,0])cube([le-4.2, 2,4]);

    difference() {
         translate ([2.1,2.1,0])cube([2, br-4.2,10]);
         translate ([2.1,10,6])sphere (d=3.8);
         translate ([2.1,br-10,6])sphere (d=3.8);
    }
    difference() {
         translate ([le-2-2.1,2.1,0])cube([2, br-4.2,10]);
         translate ([le-2.1,10,6])sphere (d=3.8);
         translate ([le-2.1,br-10,6])sphere (d=3.8);
    }
}