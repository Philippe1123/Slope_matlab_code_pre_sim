// Gmsh project created on Mon Aug 12 11:39:56 2019
SetFactory("OpenCASCADE");
Mesh.CharacteristicLengthFactor = 5;
//+
Point(1) = {15, 0, 0, 1.0};
//+
Point(2) = {20, 0, 0, 1.0};
//+
Point(3) = {20, 14, 0, 1.0};
//+
Point(4) = {15, 14, 0, 1.0};
//+

//+
Line(1) = {1, 2};
//+
Line(2) = {3, 3};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 1};


//+
Curve Loop(1) = {4, 1, 2, 3};
//+
Plane Surface(1) = {1};
//+
Transfinite Surface {1};
