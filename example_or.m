clear all;
close all;
clc;

E=210e3;            % Young's modulus in N/mm^2
nu=0.3;             % Poisson ratio
Gc=2.7;             % Fracture toughness in N/mm
l=0.01;             % Length scale in mm

[~,~]=system('gmsh sen.geo -2 -order 1 -save_topology');
[~,~]=system('gmsh sen.geo -0');
model=gmshread('sen.msh','sen.geo_unrolled');
model.Elements.setSectionID(1); 
model.Elements.setMaterialID(1); 

Nodes=model.getNodeMatrix(model.getNodes('surfaces'));
Elements=model.getElementMatrix(model.getElements('surfaces'));
Elements(:,2)=1;

EltOpts.problem='2dstrain';
Types={1 'plane3' EltOpts};
Materials={1 'elastodam' {'isotropic' [E nu] 'AT-2' Gc/(2*l) 'eta_d' sqrt(Gc*l) 'specsplit'}};
Sections=[1 1];

% Check mesh
figure;
plotelem(Nodes,Elements,Types,'numbering','off');
hold('on');
plotnodes(Nodes,'numbering','off');

BottomNodes=model.getNodes('lines',1);
TopNodes=model.getNodes('lines',3);
