//
// ktRACK92
//
//

gap1 = 0.001;
gap2 = 0.003;
th = 2;

W = 19.4+1-0.5;

//pad();
//pad_mir();
//fork();
base();
//base_mir();




module base_mir()
{
difference()
{
    mirror([1,0,0]) base();
}
}


module base()
{
difference()
{

    union()
    {
        translate([-5/2+22-8/2, 0-6, 60-8/2]) rotate([-90, 0, 0]) cylinder(h=13, r=8/2, $fn=100);
        translate([-5/2+22/2, 0-6, 60-22/2]) cube([22/2-8/2, 13, 22/2]);
        translate([-5/2+22/2, 0-6, 60-22/2]) cube([22/2, 13, 22/2-8/2]);
        translate([22/2-5/2, 0-6, 60-22/2]) rotate([-90, 0, 0]) cylinder(h=13, r=22/2, $fn=100);
        translate([-5/2, 0-6, 22/2]) cube([22, 13, 60-22/2-22/2]);
        translate([22/2-5/2, 0-6, 22/2]) rotate([-90, 0, 0]) cylinder(h=13, r=22/2, $fn=100);
        translate([-5/2-8/2+22, -11.5, 60-(45+2)/2]) rotate([-90, 180, 0]) pad();
        translate([-5/2, -11, 60-(45+2)/2-6/2]) cube([14, 5, 6]);
    }
    fork();
    translate([-5/2, -11+5-1.5, 60-(45+2)/2-6/2]) rotate([0, 0, 180+45]) cube([5, 18, 6]);
    translate([-5/2+4*2, -11, 60-(45+2)/2-6/2+6]) rotate([0, 0, 180-45]) cube([14, 4, 4]);
    translate([-5/2+4*2, -11, 60-(45+2)/2-6/2-4]) rotate([0, 0, 180-45]) cube([14, 4, 4]);
}
}

module fork()
{
difference()
{

    union()
    {
        translate([0, 0-5, 0]) cube([20, 30+5, 60]);
    }
    translate([0+20, 0-5, 60-25]) rotate([10, 0, 180]) cube([20, 20, 60]);
    translate([0, 0-5, 60-25]) rotate([180+8, 0, 0]) cube([20, 20, 60]);

    translate([0+10, 0-5, 60-25-1]) rotate([5, -90, 180+90-41.5]) cube([50, 20, 60]);
    translate([0+10, 0-5, 60-25+1]) rotate([180+5, 0, 90-37]) cube([50, 20, 60]);
}
}


module pad()
{
difference()
{

    union()
    {
        translate([0, -45/2+8/2-1, 0]) cylinder(h=8-2.5, r=8/2, $fn=100);
        translate([-8/2, -(45-8+2)/2, 0]) cube([8, 45-8+2, 8-2.5]);
        translate([0, 45/2-8/2+1, 0]) cylinder(h=8-2.5, r=8/2, $fn=100);
    }
    translate([-8/2+2, 8.7+17/2, 0-gap1]) cube([5.5, 2.5, 5.2]);
    translate([-8/2-gap1, -17/2, 0-gap1]) cube([8+gap2, 17, 7-1.7]);
    translate([-8/2+2, -8.7-17/2-2.5, 0-gap1]) cube([5.5, 2.5, 5.2]);

    translate([3.5, 8.7+17/4, 0]) cylinder(h=1.3, r=5.5/2, $fn=100);
    translate([3.5, -8.7-17/4, 0]) cylinder(h=1.3, r=5.5/2, $fn=100);
}
}


module cap()
{
difference()
{
    L=48;
    R=6;
    union()
    {
        translate([0, 0, 0]) cube([L-R/2, 16, 4.9+2]);
        translate([L-R/2, R/2, 0]) cylinder(h=4.9+2, r=R/2, $fn=100);
        translate([L-R/2, 16-R/2, 0]) cylinder(h=4.9+2, r=R/2, $fn=100);
        translate([L-R/2, R/2, 0]) cube([R/2, 16-R, 4.9+2]);
        
        translate([-15, 16/2-19/2, 0]) cube([25, 19, 10]);
    }
    translate([L-11, (16-11)/2, 0]) cylinder(h=4.9, r=2.7/2, $fn=100);
    translate([L-11, (16-11)/2, 4.9-1.5+0.5]) cylinder(h=1.5+2, r=4/2, $fn=100);
    translate([L-11, 16-(16-11)/2, 0]) cylinder(h=4.9, r=2.7/2, $fn=100);
    translate([L-11, 16-(16-11)/2, 4.9-1.5+0.5]) cylinder(h=1.5+2, r=4/2, $fn=100);
    
    #translate([L, 16/2, 0]) usb();
    translate([0, 16/2-7.5/2, 0]) cube([L-11.1, 7.5, 2.3+(5.4-2.3)/2]);
    translate([L-17.5, 16/2, 0]) cylinder(h=2.3+(5.4-2.3)/2, r=(16-th*2)/2, $fn=100);
    translate([0, 16/2-(16-th*2)/2, 0]) cube([L-16.5, (16-th*2), 2.3+(5.4-2.3)/2]);
    
    translate([-15+1, 16/2-19/2+1, -10]) cube([25-1*2, 19-1*2, 20-1]);
    translate([-15+1, 16/2-19/2+1, -10]) cube([25-1*2+1, 19-1*2, 10]);
}
}

module usb()
{
translate([-(11.1+1), 0, 0])
difference()
{
    union()
    {
        translate([0, -7.5/2, 0]) cube([11.1+1+gap2, 7.5, 2.3+(5.4-2.3)/2]);
        //translate([11.1-3.6, -9.2/2, 0]) cube([3.6, 9.2, 5.4]);
        //translate([11.1-3.8, -9.4/2, 0]) cube([3.8, 9.4, 5.4]);
        translate([11.1-4, -9.6/2, 0]) cube([4, 9.6, 5.4]);
    }
    translate([11.1, -7.5/2, 2.3+(5.4-2.3)/2-1]) rotate([45, 0, 0]) cube([1, 2, 2]);
    translate([11.1, 7.5/2, 2.3+(5.4-2.3)/2-1]) rotate([45, 0, 0]) cube([1, 2, 2]);
}
}


module base_old()
{
difference()
{
    union()
    {
        translate([-(15+53), -th-(W/2), 0]) dock();
        translate([-12, -((4*4)/2), 10]) clip();
    }
}
}
module base_yoko()
{
difference()
{
    union()
    {
        translate([-(15+53), -th-(W/2), 0]) dock_yoko();
        translate([-10, -((4*4)/2), 10]) clip();
        translate([-12, -((4*4)/2), 10]) translate([12, 0, 0-10]) cube([52-1, W+th-1.95+1, th+7]);
    }
    //kado
    translate([-(15+53), -th-(W/2)+th+1.95+1, 0]) rotate([0, 0, -90-45]) cube([5, 5, 30]);
    translate([-(15+53), -th-(W/2)+th+1.95+1+W-1, 0]) rotate([0, 0, 45]) cube([5, 5, 30]);
    translate([-(15+53), -th-(W/2)+th+1.95, th+18+(3.7+0.5)+th-1]) rotate([0, -45, 0]) cube([5, 30, 5]);
    translate([-(15+53), -th-(W/2)+th+1.95, th+18+(3.7+0.5)+th-1]) rotate([45, 0, 0]) cube([80, 5, 5]);
    translate([-(15+53), -th-(W/2)+th+1.95+1, 0]) rotate([90+45, 0, 0]) cube([120, 5, 5]);
    translate([-(15+53), -th-(W/2)+th+1.95+1+W-1, 0]) rotate([-45, 0, 0]) cube([120, 5, 5]);
    translate([-(15+53), -th-(W/2)+th+1.95+1+W-1, th+18+(3.7+0.5)+th]) rotate([-45, 0, 0]) cube([120, 5, 5]);
    translate([-(15+53)+1, -th-(W/2)+th+1.95, 0]) rotate([0, -90-45, 0]) cube([5, 30, 5]);
    translate([50+1-1, -th-(W/2)+th+1.95, 0]) rotate([0, 45, 0]) cube([5, 30, 5]);
    translate([50+2-1, -th-(W/2)+th+1.95+1, 0]) rotate([0, 0, -90-45]) cube([5, 5, 30]);
    translate([50+2-1, -th-(W/2)+th+1.95+1+W-1, 0]) rotate([0, 0, 45]) cube([5, 5, 30]);
}
}
module dock()
{
difference()
{
    union()
    {
        translate([15+10, 0, 0]) cube([53-10, W+th*2+1.5, th+18+(3.7+0.5)+th]);
    }
    translate([5, th, th]) unit_mae();
    translate([68, 0-gap1, th+7]) rotate([0, -45, 0])cube([30, 30, 30]);
}
}
module dock_yoko()
{
difference()
{
    union()
    {
        translate([0, th+1.95, 0]) cube([68, W+th-1.95+1, th+18+(3.7+0.5)+th]);
    }
    translate([5, th-gap1, th]) unit_yoko();
    translate([68, 0-gap1, th+7]) rotate([0, -45, 0])cube([30, 30, 30]);
}
}
module clip()
{
difference()
{
    union()
    {
        translate([12, 0, th]) cube([14, 4*4, 10]);

        translate([12, 0, 0-10]) cube([50-1, 4*4, th+10]);
        translate([29, 0, 10]) rotate([-90, 0, 0]) cylinder(h=3.8, r=8/2, $fn=100);
        translate([29, 4*2, 10]) rotate([-90, 0, 0]) cylinder(h=3.8, r=8/2, $fn=100);

        translate([29-sqrt(1/2)*19.5, 0, 0]) rotate([0, 45, 0]) cube([19.5, 3.8, 19.5]);
        translate([29-sqrt(1/2)*19.5, 4*2, 0]) rotate([0, 45, 0]) cube([19.5, 3.8, 19.5]);
    }
    translate([0, -gap1, -100-10]) cube([68, W+th+gap2, 100]);
    translate([29, -gap1, 10]) rotate([-90, 0, 0]) cylinder(h=W+th+gap2, r=2.2/2, $fn=100);
    translate([29, -gap1, 10]) rotate([-90, 0, 0]) cylinder(h=1.5, r=4/2, $fn=100);

    translate([56, 4*2, th-1]) cylinder(h=th, r=7.65/2, $fn=100);

    translate([29-sqrt(1/2)*19.5, 4*1-0.2, th]) cube([20, 4+0.2, 15]);
    translate([29-sqrt(1/2)*19.5, 4*3-0.2, th]) cube([20, 4+0.2, 15]);

}
    translate([56, 4*2, th-1]) cylinder(h=4, r=5/2, $fn=100);
}

module unit()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([49.3+1, W, 18]);
        translate([49.3+1, W/2, 0]) cylinder(h=18, r=W/2, $fn=100);
        translate([-18, (9.5+1)/2, 0]) cube([18, 9.5+1, 18]);
        translate([49.3+1-15+1, W, 0]) cube([15, 1.5, 18]);
    }
}
}

module unit_yoko()
{
difference()
{
    union()
    {
        translate([0, 0, 18]) cube([20, W, 0.5]);
        translate([20, 0, 18]) cube([14.6, W, 3.7+0.5]);
        translate([0, 0, 0]) cube([49.3+1, W, 18]);
        translate([49.3+1, W/2, 0]) cylinder(h=18, r=W/2, $fn=100);
        translate([49.3+1, 0, 0]) cube([(19.4+1)/2, W/2, 18]);
        translate([-18, (9.5+1)/2-10, 0]) cube([18, 9.5+1+10, 4.5]);
        translate([49.3+1-15+1, W, 0]) cube([15, 1.5, 18]);
    }
    translate([0, 0, th+10]) rotate([0, -45+10, 0])cube([30, 30, 30]);
    translate([49.3+1, 0, -1]) rotate([0, 45+15, 0])cube([30, 30, 30]);
}
}

module unit_mae()
{
difference()
{
    union()
    {
        translate([0, 0, 18]) cube([34.6, W, 3.5]);
        translate([0, 0, 0]) cube([49.3+1, W, 18]);
        translate([49.3+1, W/2, 0]) cylinder(h=18, r=W/2, $fn=100);
        translate([-18, (9.5+1)/2, 0]) cube([18, 9.5+1, 4.5]);
        translate([0, W, 4-1/2]) cube([49.3+1, 1.5, 7.8]);
    }
    translate([49.3+2.5, 0, -1]) rotate([0, 45+10, 0])cube([30, 30, 30]);
}
}

module tube()
{
difference()
{
    union()
    {
        BR = 2;
        $fn=100;
        minkowski()
        {
            translate([BR, BR, 0]) cube([(32+1*2)-BR*2, (21+1*2)-BR*2, 110-1]);
            cylinder(r=BR, h=1);
        }
    }
    
    BR = 2;
    $fn=100;
    translate([1, 1, 1])
    minkowski()
    {
        translate([BR, BR, 0]) cube([(32)-BR*2, (21)-BR*2, 110-1]);
        cylinder(r=BR, h=1);
    }
    
    translate([(32+1*2)/2, 0, 110]) resize([20.75, (21+1*2), 30]) rotate([0, 90, 90]) cylinder(h=1, r=1, $fn=100);
    
    #translate([(32+1*2)/2-5-9, 0, 110-4]) kado();
    #translate([(32+1*2)/2+4, 0, 110-4]) kado();
}
}
module kado()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([10, 50, 10]);
    }
    translate([0, 0, 0]) rotate([0, 90, 90]) cylinder(h=50, r=4, $fn=100);
    translate([10, 0, 0]) rotate([0, 90, 90]) cylinder(h=50, r=4, $fn=100);
}
}

module case2()
{
difference()
{
    union()
    {
        BR = 2;
        $fn=100;
        minkowski()
        {
            translate([BR, BR, 0]) cube([(60+1*2)-BR*2, (15+1*2)-BR*2, 105-1]);
            cylinder(r=BR, h=1);
        }
    }
    
    BR = 2;
    $fn=100;
    translate([1, 1, 1])
    minkowski()
    {
        translate([BR, BR, 0]) cube([(60)-BR*2, (15)-BR*2, 105-1]);
        cylinder(r=BR, h=1);
    }
    
    translate([(60+1*2)/2, 0, 105]) resize([20.75, (22+1*2), 30]) rotate([0, 90, 90]) cylinder(h=1, r=1, $fn=100);
    
    #translate([(60+1*2)/2-5-9, 0, 105-4]) kado();
    #translate([(60+1*2)/2+4, 0, 105-4]) kado();
}
}
module case()
{
difference()
{
    union()
    {
        BR = 5;
        $fn=100;
        minkowski()
        {
            translate([BR, BR, 0]) cube([(110+4*2)-BR*2, (63+5+6.5+1*2)-BR*2, 10-1]);
            cylinder(r=BR, h=1);
        }
    }
    translate([4, 5, 2]) cube([110, 63, 20]);
    
    translate([0, 2.5, 10/2+5/2]) rotate([0, 90, 0]) cylinder(h=130, r=3.5/2, $fn=100);
    translate([(110+4*2)/2-(25+2)/2, 0-gap1, 10/2]) cube([(25+2), 5+gap2, 20/2+gap1]);

    translate([(110+4*2)/2-6.5/2, (63+5+6.5+1*2)-20-2, 10-3.5-1]) cube([6.5, 20, 3.5]);
}
    #translate([40, 2.5, 10/2+5/2]) wa();
}
module huta()
{
difference()
{
    union()
    {
        BR = 5;
        $fn=100;
        translate([0, 0, 10+0.5])
        minkowski()
        {
            translate([BR, BR, 0]) cube([(110+4*2)-BR*2, (63+5+6.5+1*2)-BR*2, 10-1]);
            cylinder(r=BR, h=1);
        }
        translate([(110+4*2)/2-25/2, 0-gap1, 10/2+5/2]) cube([25, 5+gap2, 10/2+gap1]);
        translate([(110+4*2)/2-25/2, 5/2, 10/2+5/2]) rotate([0, 90, 0]) cylinder(h=25, r=5/2, $fn=100);
    }
    translate([4, 5, 10]) cube([110, 63, 10-2]);
    
    translate([0, 2.5, 10/2+5/2]) rotate([0, 90, 0]) cylinder(h=130, r=3.5/2, $fn=100);
    #translate([(110+4*2)/2-6.5/2, (63+5+6.5+1*2)-20-2, 10+1]) cube([6.5, 20, 3.5]);
}
}
module wa()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) rotate([0, 90, 0]) cylinder(h=1, r=5/2, $fn=100);
    }
    translate([0-gap1, 0, 0]) rotate([0, 90, 0]) cylinder(h=1+gap2, r=2/2, $fn=100);
}
}

module hasami()
{
difference()
{
    union()
    {
        translate([-10/2, 0, 0]) cube([10, 67, 67]);
    }
    #translate([6/2, 0, 2]) rotate([45, 0, 180]) cube([6, 15, 95+30]);

}
}


module bottle()
{
difference()
{
    union()
    {
        BR = 5;
        $fn=100;
        translate([-50/2, -70/2+15, -1])
        minkowski()
        {
            translate([BR, BR, 0]) cube([50-BR*2, 70-BR*2, 30+1]);
            cylinder(r=BR, h=1);
        }
    }
    #translate([0, 0, 9]) rotate([-25, 0, 0]) rotate([0, 0, 90]) cylinder(h=100, r1=41/2, r2=41/2, $fn=100);

}
}


module hook()
{
difference()
{
    union()
    {
        translate([0, 0, 9.5+3]) scale([1, 0.6, 1]) rotate([0, 0, 90]) cylinder(h=0.5, r1=60/2, r2=60/2, $fn=100);
        translate([0, 0, 9.5]) scale([1, 0.6, 1]) rotate([0, 0, 90]) cylinder(h=3, r1=40/2, r2=60/2, $fn=100);
        translate([0, 0, 0]) scale([1, 0.6, 1]) rotate([0, 180, 90]) cylinder(h=3, r1=40/2, r2=60/2, $fn=100);
        translate([0, 0, 0-3]) scale([1, 0.6, 1]) rotate([0, 180, 90]) cylinder(h=0.5, r1=60/2, r2=60/2, $fn=100);
    }
    translate([-500/2, 0, -500/2]) cube([500, 500, 500]);
}
difference()
{
    union()
    {
        translate([0, 0, -3]) scale([1, 0.6, 1]) rotate([0, 0, 90]) cylinder(h=3+9.5+3, r1=60/2, r2=60/2, $fn=100);
    }
    translate([-500/2, 0, -500/2]) cube([500, 500, 500]);
    translate([-500/2, -500-5, -500/2]) cube([500, 500, 500]);
}
}

module stand()
{
difference()
{
    union()
    {
        BR = 5;
        $fn=100;
        translate([-50/2, -60/2+10, -1])
        minkowski()
        {
            translate([BR, BR, 0]) cube([50-BR*2, 60-BR*2, 30+1]);
            cylinder(r=BR, h=1);
        }
        translate([-30/2, -60/2+10+100-10/2, 65]) rotate([0, 90, 0]) cylinder(h=30, r=10/2, $fn=100);
        translate([-30/2, -60/2+10+100-10/2+2.4, 65+4.4]) rotate([-90-75, 0, 0]) cube([30, 100, 100]);
    }
    translate([0, 0, 9]) rotate([-25, 0, 0]) rotate([0, 0, 90]) cylinder(h=100, r1=41/2, r2=41/2, $fn=100);

    translate([-500/2, -500/2, -500]) cube([500, 5000, 500]);
    translate([100/2, 40, 6]) rotate([26.5, 0, 180]) cube([100, 100, 100]);

    
    translate([100/2, 40-5+0.5, 6]) rotate([26.5, 0, 180]) cube([100, 100, 60]);
    translate([-100/2, 40-5+0.5, 6]) cube([100, 4.5, 60]);

    translate([-100/2, -25, 31]) cube([100, 20, 4.5]);
}
}


module stand2()
{
    translate([0, 0, 0]) stand();
    translate([0, 107.5, 0]) stand();
}
