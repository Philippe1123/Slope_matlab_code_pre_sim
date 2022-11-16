// Gmsh project created on Mon Aug 12 11:39:56 2019
SetFactory("OpenCASCADE");
Mesh.CharacteristicLengthFactor = 5;
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {20, 0, 0, 1.0};
//+
Point(3) = {20, 3, 0, 1.0};
//+
Point(4) = {16, 3, 0, 1.0};
//+
Point(5) = {14, 2, 0, 1.0};
//+s
Point(6) = {0, 2, 0, 1.0};
//+
Point(7) = {20, 7, 0, 1.0};
//+
Point(8) = {15, 7, 0, 1.0};
//+
Point(9) = {5, 2, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 5};
//+
Line(5) = {5, 9};
//+
Line(6) = {9, 6};
//+
Line(7) = {6, 1};
//+
Line(8) = {3, 7};
//+
Line(9) = {7, 8};
//+
Line(10) = {8, 9};
//+
Curve Loop(1) = {9, 10, -5, -4, -3, 8};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {3, 4, 5, 6, 7, 1, 2};
//+
Plane Surface(2) = {2};
//+
Transfinite Curve {1} = 3 Using Progression 1;
//+

