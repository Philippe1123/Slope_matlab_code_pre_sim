// Gmsh project created on Wed Aug  7 07:52:42 2019
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {20, 0, 0, 1.0};
//+
Point(3) = {20, 14, 0, 1.0};
//+
Point(4) = {15, 14, 0, 1.0};
//+
Point(5) = {5, 2, 0, 1.0};
//+
Point(6) = {0, 2, 0, 1.0};
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
Line(6) = {6, 1};
//+
Curve Loop(1) = {6, 1, 2, 3, 4, 5};
//+
Plane Surface(1) = {1};
//+
Characteristic Length {1, 2, 3, 4,5,6} = 3.0;
