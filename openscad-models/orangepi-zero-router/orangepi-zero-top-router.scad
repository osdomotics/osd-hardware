// Startpoint Router ground:

le=90;
br=55;
hr=25;
$fn=20;

union(){
     translate ([0,0,0])cube([le, br,2]);
    difference() {
         translate ([2.1,2.1,0])cube([2, br-4.2,8]);
         translate ([2.1,10,6])sphere (d=3.1);
         translate ([2.1,br-10,6])sphere (d=3.1);
    }
    difference() {
         translate ([le-2-2.1,2.1,0])cube([2, br-4.2,8]);
         translate ([le-2.1,10,6])sphere (d=3.1);
         translate ([le-2.1,br-10,6])sphere (d=3.1);
    }
}