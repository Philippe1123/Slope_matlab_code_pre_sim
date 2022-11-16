//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {2, 0, 0, 1.0};
//+
Point(3) = {2, 2, 0, 1.0};
//+
Point(4) = {0, 2, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 1};
//+
Point(5) = {0.5, 0.5, 0, 1.0};
//+
Point(6) = {1.5, 0.5, 0, 1.0};
//+
Point(7) = {1.5, 1.5, 0, 1.0};
//+
Point(8) = {0.5, 1.5, 0, 1.0};
//+
Line(5) = {5, 6};
//+
Line(6) = {6, 7};
//+
Line(7) = {7, 8};
//+
Line(8) = {8, 5};
//+
Curve Loop(1) = {3, 4, 1, 2};
//+
Curve Loop(2) = {7, 8, 5, 6};
//+
Plane Surface(1) = {1, 2};
//+
Plane Surface(2) = {2};
//+
Transfinite Surface {1};
//+
Transfinite Surface {2};
//+
Transfinite Curve {5, 8, 7, 6} = 0 Using Progression 1;
//+
Transfinite Curve {4, 3, 2, 1} = 0 Using Progression 1;
