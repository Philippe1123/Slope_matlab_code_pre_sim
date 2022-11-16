// Gmsh project created on Mon Aug 12 11:39:56 2019
SetFactory("OpenCASCADE");
Mesh.CharacteristicLengthFactor = 5;
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {20, 0, 0, 1.0};
//+
Point(6) = {0, 2, 0, 1.0};
//+
Point(7) = {20, 14, 0, 1.0};
//+
Point(8) = {15, 14, 0, 1.0};
//+
Point(9) = {5, 2, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 7};
//+
Line(6) = {9, 6};
//+
Line(7) = {6, 1};
//+
Line(9) = {7, 8};
//+
Line(10) = {8, 9};

//+
Curve Loop(1) = {10, 6, 7, 1, 2, 9};
//+
Plane Surface(1) = {1};
//+
Transfinite Surface {1};
//+
Transfinite Curve {10} = 14 Using Progression 1;
//+
Transfinite Curve {9} = 9 Using Progression 1;
//+
Transfinite Curve {2} = 16 Using Progression 1;
