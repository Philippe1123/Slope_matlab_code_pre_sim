clear all;
close all;
clc;

%% Parameters
E=30e6;         % Young's modulus in N/m^2
nu=0.25;        % Poisson ratio
rho=1000;       % Density [kg?m^3]
c=8e3;          % Cohesion in N/m^2
phi=10;         % Friction angle in degrees
EltOpts.GP_k_dp=1;
% Match Mohr-Coulomb at shear meridian
alpha_dp=sind(phi)/3;
k_dp=c*cosd(phi);

%% Create model 
EltOpts.problem='2dstrain';
EltOpts.nl='elastoplastic';
Types={1 'plane3' EltOpts};
Materials={1 'elastoplastic' {'isotropic' [E nu rho] 'dp' [alpha_dp k_dp] 'multilinear' [1 k_dp]}};
Sections=[1];
%  

%%%%Fine
 [~,~]=system('/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh versionthree_Fine.geo -2 -order 1 -save_topology -format msh2');
% % [~,~]=system('/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh sen.geo -0');
 [~,~]=system('/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh versionthree_Fine.geo -0');

model=gmshread('versionthree_Fine.msh','versionthree_Fine.geo_unrolled');
model.Elements.setSectionID(1); 
model.Elements.setMaterialID(1); 

Nodes=model.getNodeMatrix(model.getNodes('surfaces'));
%Nodes=model.getNodeMatrix(model.getNodes('elements'));

Elements=model.getElementMatrix(model.getElements('surfaces'));
Elements(:,2)=1;
Elements(:,1)=1:1:length(Elements(:,1));
%Elements=Elements(:,[1:5 7 6]);
 % Elements=Elements(:,[1:5 7 6 10 9 8]);
%   Elements=Elements(:,[1:4 6 5 7 8 10 9]);


LeftNodes=selectnode(Nodes,-1e-6,-inf,-inf,1e-6,inf,inf);
RightNodes=selectnode(Nodes,max(Nodes(:,2))-1e-6,-inf,-inf,max(Nodes(:,2))+1e-6,inf,inf);
BottomNodes=selectnode(Nodes,-inf,-1e-6,-inf,inf,1e-6,inf);

% % % % % % % % Check mesh
% % % % % % %  figure;
% % % % % % %  plotelem(Nodes,Elements,Types);
% % % % % % %  plotelem(Nodes,Elements,Types);
% % % % % % %  hold('on');
% % % % % % % % plotnodes(Nodes,'numbering','off');
% % % % % % %  plotnodes(Nodes);

% figure;
% plotelem(Nodes,Elements,Types);
% hold('on');
% plotnodes(Nodes);

% BottomNodes2=model.getNodes('lines',1);
% TopNodes=model.getNodes('lines',3);

% Create list of DOFs
DOF=getdof(Elements,Types);
seldof=[LeftNodes(:,1)+0.01;RightNodes(:,1)+0.01;BottomNodes(:,1)+0.01;BottomNodes(:,1)+0.02];
DOF=removedof(DOF,seldof);


% Load vector
DLoads=accel([0 9.81 0],Elements,Types,Sections,{1 E nu rho});
P=elemloads(DLoads,Nodes,Elements,Types,DOF);

%% Compute equilibrium path
SolverOpts.initalpha=0.2;
SolverOpts.maxstep=50;
SolverOpts.maxiter=30;
CornerNode=selectnode(Nodes,15,7,0);

Pload=(0:0.01:12.6);
U=solver_nr(Nodes,Elements,Types,Sections,Materials,DOF,P,Pload,SolverOpts);
res=-selectdof(DOF,CornerNode(1)+0.02)*[zeros(size(DOF)) U];
res=res(2:end);
figure
plot(abs(res),Pload(1:length(res)),'--b')
clear U
% [U,alpha]=solver_arclen(Nodes,Elements,Types,Sections,Materials,DOF,P,SolverOpts);

hold on
% plot(-selectdof(DOF,CornerNode(1)+0.02)*[zeros(size(DOF)) U],[0 alpha],'--r');
xlabel('Displacement [m]');
ylabel('Load multiplier [-]');
%xlim([0 0.1]);








