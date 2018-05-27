$fn=40;

use <flexbatter_mod.scad>;

eng_size = sqrt (1.23*1.23*PI);
wd = 5;

module batth () {
    difference () {
        rotate ([0,0,-90])
        translate ([-66.5,18.4/2+1,0])
        flexbatter18650(n=1);
        translate ([-1,65.5,-1])cube([30,30,3]);
    }
}

//batth();

module probe () {
    w=18;
    l=77;
    t=1.8;
    hd=2.5;
    hy=4;
    hx=7;
    union () {
        difference () {
            cube ([w,l,t]);
            translate ([w/2+hx/2,hy,-1])cylinder (d=hd,h=t+2);
            translate ([w/2-hx/2,hy,-1])cylinder (d=hd,h=t+2);
        }
        translate ([3.2,20.3,t-0.01])cube([14,25,4]);
    }
}

module mb () {
    t=1.9;
    w=24.1;
    h=35.5;
    union () {
        cube ([w,h,t]);
        translate([5.2,9.5,t-0.01])cube([13.3,19,3.5]);
        translate ([w/2-8-0.01,-9,0])cube ([16,12,4]);
    }
}

module case () {
    d=wd;
    w=38 + 2 * d;
    h=80 + 2 * d;
    t=25 + 2 * d;
    difference () {
        translate ([w/2,h/2,t/2])
        minkowski () {
            cube ([w-d,h-d,t-d],center=true);
            sphere (d=d,center=true);
        }
        translate([d,d,d])cube ([w-2*d,h-2*d,t-2*d-1]);
        translate ([w/2,h/2,29-eng_size/2])
            difference () {
                w = w - 2 * (d-eng_size)/2-1.6;
                h = h - 2 * (d-eng_size)/2-1.6;
                cube ([w,h,eng_size],center=true);
                cube ([w-2*eng_size,h-2*eng_size,eng_size+0.01],center=true);
            }
    }
}
//case ();

module holders () {
    translate ([48/2-10,90-(wd-eng_size)/2-2.2,29.99+2])sphere (d=4);
    translate ([48/2+10,90-(wd-eng_size)/2-2.2,29.99+2])sphere (d=4);
    translate ([48/2-10,   (wd-eng_size)/2+2.2,29.99+2])sphere (d=4);
    translate ([48/2+10,   (wd-eng_size)/2+2.2,29.99+2])sphere (d=4);
}

module case_top() {
    union () {
        difference () {
            case ();
            translate ([-1,-1,-1])cube ([80,100,30]);
            translate ([-1,0-0.1,28])cube ([50,(wd-eng_size)/2+1,8]);
            translate ([-1,90-(wd-eng_size)/2-1+0.1,28])cube ([50,10,8]);
        }
        holders();
    }
}

module case_btm() {
    difference () {
        case ();
        translate ([-1,(wd-eng_size)/2+0.8,28.99])
            cube ([50,90-(wd-eng_size)/2-(wd-eng_size)/2-1.6,10]);
        holders();
    }
}

//translate ([0,0,-5])case_btm();

module probe_full () {
    color("green")
    translate ([1,1,wd-eng_size+0.8])union () {
        translate ([31,60,18+(32-18)/2])rotate ([180,90,0])probe();
        translate ([31-1.8-eng_size,(wd-eng_size)/2,(32-18)/2-eng_size])
            cube ([1.8+2*eng_size,eng_size,23+eng_size]);
        translate ([31-1.8,-1,18+(32-18)/2-1])cube ([1.8,7,4]);
    }
}
        
module btm () {
    difference () {
        union () {
            case_btm ();
            color ("red")translate ([5.5,8,4.99])batth();
            translate ([4.99,4.99,3])cube ([7,2.5,16.8]);
            translate ([4.99+7+6.4,4.99,3])cube ([7,2.5,16.8]);
            translate ([25.5,3.99,3])cube([19,17,16.8]);
            translate ([30.3,4+50.5,3])
            difference () {
                cube([14,31,23]);
                translate ([8,0,60])rotate([0,90,0])cylinder ($fn=0,d=100,h=10,$fa=1);
            }
        }
        translate ([0,0-0.2,-eng_size])probe_full();
        color("blue")translate ([35,19.8,24+4.5])rotate ([0,90,0])mb();
        translate ([45,65,28.0])cube ([5,12,2]);
        translate ([-3,65,28.0])cube ([5,12,2]);
    }
}


translate([0,0,5])case_top();
btm();
