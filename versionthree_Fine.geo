// Gmsh project created on Wed Jul  3 14:34:01 2019
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {5, 0, 0, 1.0};
//+
Point(3) = {17.5, 0, 0, 1.0};
//+
Point(4) = {20, 0, 0, 1.0};
//+
Point(5) = {20, 2, 0, 1.0};
//+
Point(6) = {17.5, 2, 0, 1.0};
//+
Point(7) = {5, 2, 0, 1.0};
//+

//+
Point(8) = {0, 2, 0, 1.0};
//+
Point(9) = {20, 7, 0, 1.0};
//+
Point(10) = {17.5, 7, 0, 1.0};
//+
Point(11) = {15, 7, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 5};
//+
Line(5) = {5, 6};
//+
Line(6) = {6, 3};
//+
Line(7) = {6, 7};
//+
Line(8) = {7, 2};
//+
Line(9) = {7, 8};
//+
Line(10) = {8, 1};
//+
Line(11) = {5, 9};
//+
Line(12) = {9, 10};
//+
Line(13) = {10, 6};
//+
Line(14) = {10, 11};
//+
Line(15) = {11, 7};
//+
Curve Loop(1) = {10, 1, -8, 9};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {8, 2, -6, 7};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {6, 3, 4, 5};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {13, -5, 11, 12};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {15, -7, -13, 14};
//+
Plane Surface(5) = {5};
//+
Characteristic Length {1, 2, 7, 8} = 0.5;
//+
Characteristic Length {2, 3, 6, 7} = 0.5;
//+
Characteristic Length {3, 4, 5, 6} = 0.5;
//+
Characteristic Length {6, 5, 9, 10} = 0.5;
//+
Characteristic Length {7, 6, 10, 11} = 0.3;
