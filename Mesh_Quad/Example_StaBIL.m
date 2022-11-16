close all; clearvars; clc;

%% Parameters
Lx = 3000;                      % Beam width
Ly = 150;                       % Beam height
he = 50;                        % Element size 
m = Ly/he;                      % number of elements in y-direction
n = Lx/he;                      % number of elements in x-direction

E = 200e3;                      % E-modulus
nu = 0.25;                      % Poisson-coeff.
fy = 240;                       % Yield strength 
t = 1;                          % Beam thickness
EltOpts.nl='elastoplastic';
EltOpts.problem='2dstrain';
EltOpts.returnmap='radial';   % or 'radial'
Types = {1 'plane4' EltOpts};   % {EltTypID EltName EltOpts} 
Sections = [1 t];               % [SecID t] 

%% Mesh
Line1 = [0 0 0; Lx 0 0];
Line2 = [Lx 0 0; Lx Ly 0];
Line3 = [Lx Ly 0; 0 Ly 0];
Line4 = [0 Ly 0; 0 0 0];

[Nodes,Elements,Edge1,Edge2,Edge3,Edge4,Normals] = makemesh(Line1,Line2,Line3,Line4,m,n,Types(1,:),1,1);
Nodes(:,4) = 0;
nElem=size(Elements,1);
Elements(:,4) = 1:nElem;

Ek = E*ones(nElem,1);
Materials = cell(nElem,3);
for k = 1:nElem, Materials(k,:) = {k 'elastoplastic' {'isotropic' [Ek(k) nu] 'vm' [fy] 'multilinear' [1 fy+E/20]}}; end

figure;
plotnodes(Nodes);

figure;
plotelem(Nodes,Elements,Types);

%% DOFs
DOF = getdof(Elements,Types);
sdof = [0.03;0.04;0.05;0.06;[Edge2;Edge4]+0.01;[Edge2;Edge4]+0.02]; 
DOF = removedof(DOF,sdof);

%% Load
seldof = find(Nodes(:,2)==Lx/2 & Nodes(:,3)==Ly & round(Nodes(:,4)*1000)/1000==0)+0.02;
PLoad = 6000*(0:0.01:1);
P = nodalvalues(DOF,seldof,-1);

%% Compute displacements
tic
U=solver_nr(Nodes,Elements,Types,Sections,Materials,DOF,P,PLoad,[],[],[],[],[],[]);
toc

%% Plot displacements
figure
plotdisp(Nodes,Elements,Types,DOF,U(:,end))

figure;
animdisp(Nodes,Elements,Types,DOF,U)

figure;
seldof = find(Nodes(:,2)==Lx/2 & Nodes(:,3)==0 & round(Nodes(:,4)*1000)/1000==0)+0.02;
plot(selectdof(DOF,seldof)*U,PLoad)
xlabel('Displacement [mm]')
ylabel('Force [N]')