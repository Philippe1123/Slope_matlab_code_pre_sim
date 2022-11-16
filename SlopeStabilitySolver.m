function [ ] = SlopeStabilitySolver(Order,MeshName)
%SLOPESTABILITYSOLVER Summary of this function goes here
%   Detailed explanation goes here
%clear all;
%close all;
%clc;




%%%%Mesh Generation and Read in

%Path="/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh"+" ";
%Input=strcat(Path,MeshName);
%Input=strcat(Input,'.geo -2 -order');
%Input=Input+' ';
%Input=Input+num2str(Order);
%Input=char(strcat(Input,' -save_topology -format msh2'));

% [~,~]=system('/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh versionthree_Fine.geo -2 -order 1 -save_topology -format msh2');
%[~,~]=system(Input);

% % [~,~]=system('/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh sen.geo -0');
Input=strcat(Path,MeshName);
Input=char(strcat(Input,'.geo -0'));

[~,~]=system(Input);

%[~,~]=system('/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh versionthree_Fine.geo -0');

model=gmshread(char(strcat(MeshName,'.msh')),char(strcat(MeshName,'.geo_unrolled')));
model.Elements.setSectionID(1);
model.Elements.setMaterialID(1);

Nodes=model.getNodeMatrix(model.getNodes('surfaces'));
%Nodes=model.getNodeMatrix(model.getNodes('elements'));

Elements=model.getElementMatrix(model.getElements('surfaces'));
Elements(:,2)=1;
Elements(:,1)=1:1:length(Elements(:,1));
nElem=length(Elements);




% % % %% Save nodes and elements
% % % 
% % % El=Elements(:,5:7);
% % % Point=Nodes(:,2:3);
% % % 
% % %  PathNodes="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Points.txt";
% % %  PathElements="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Elements.txt";
% % %  
% % %  dlmwrite(PathNodes,Point,'delimiter',' ','precision',15)
% % %  dlmwrite(PathElements,El,'delimiter',' ','precision',15)
% % % 
% % %  
% % % 
% % % 
% % % 
% % % %%%%Field Read In
% % %  PathField_nodes="/home/philippe/Desktop/GMSH_Matlab_ReadIn/field.txt";
% % %  PathField_centers="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Centers.txt";
% % %  PathField_centers_eval="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Centers_eval.txt";
% % % 
% % % 
% % %  c_nodes = dlmread(PathField_nodes,' ');  % Cohesion in N/m^2
% % %  centers_coord = dlmread(PathField_centers);
% % %  c_centers = 5000*abs(dlmread(PathField_centers_eval));
 
%  
%  figure
%  trisurf(Elements(:,5:7),Nodes(:,2),Nodes(:,3), c_nodes);
% figure
% stem3(centers_coord(:,1),centers_coord(:,2),c_centers,'r')
%%%%%%%%%%


%% Parameters
E=30e6;         % Young's modulus in N/m^2
nu=0.25;        % Poisson ratio
rho=1330;       % Density [kg?m^3]
c=6e3;          % Cohesion in N/m^2
%c=c_centers;
phi=20;         % Friction angle in degrees

% Match Mohr-Coulomb at shear meridian
alpha_dp=sind(phi)/3;
k_dp=c*cosd(phi);

switch Order
    case 1
        elementPlane='plane3';
    case 2
        elementPlane='plane6';
    case 3
        elementPlane='plane10';
    case 4
        elementPlane='plane15';
end



%% Create model
EltOpts.problem='2dstrain';
EltOpts.nl='elastoplastic';
Types={1 elementPlane EltOpts};
Materials = cell(nElem,3);





% Check mesh
 figure;
 plotelem(Nodes,Elements,Types,'numbering','off');
% plotnodes(Nodes,'numbering','off');
figure
 plotnodes(Nodes);
%return
% figure;
% plotelem(Nodes,Elements,Types);
% hold('on');
% plotnodes(Nodes);









for k =1:nElem, Materials(k,:)={k 'elastoplastic' {'isotropic' [E nu rho] 'dp' [alpha_dp k_dp] 'multilinear' [1 k_dp+E/300]}};end
% Materials={1 'elastoplastic' {'isotropic' [E nu rho] 'dp' [alpha_dp k_dp] 'multilinear' [1 0]}};

Sections=[1];
%


 

LeftNodes=selectnode(Nodes,-1e-6,-inf,-inf,1e-6,inf,inf);
RightNodes=selectnode(Nodes,max(Nodes(:,2))-1e-6,-inf,-inf,max(Nodes(:,2))+1e-6,inf,inf);
BottomNodes=selectnode(Nodes,-inf,-1e-6,-inf,inf,1e-6,inf);



% BottomNodes2=model.getNodes('lines',1);
% TopNodes=model.getNodes('lines',3);

% Create list of DOFs
DOF=getdof(Elements,Types);
seldof=[LeftNodes(:,1)+0.01;RightNodes(:,1)+0.01;BottomNodes(:,1)+0.01;BottomNodes(:,1)+0.02];
InitalDof=DOF;
DOF=removedof(DOF,seldof);


% Load vector
DLoads=accel([0 9.81 0],Elements,Types,Sections,{1 E nu rho});
P=elemloads(DLoads,Nodes,Elements,Types,DOF);

%% Compute equilibrium path
SolverOpts.initalpha=0.2;
SolverOpts.maxstep=25;
SolverOpts.maxiter=25;
CornerNode=selectnode(Nodes,15,14,0);
Pload=(0:0.1:1);

% Pload=(0:0.01:0.8);
% P=zeros(length(P0),1);
% [n,m]=selectdof(DOF,[85:88]+0.02);
% P(m)=-30000;%kn?

% Pload=([[0:0.01:0.45],[0.44:-0.01:0]]);
U=solver_nr(Nodes,Elements,Types,Sections,Materials,DOF,P,Pload,SolverOpts,[],[],[],[],[]);
res=-selectdof(DOF,CornerNode(1)+0.02)*[zeros(size(DOF)) U];
res=res(2:end);
figure
plot(abs(res),Pload(1:length(res)),'--b')
% [U,alpha]=solver_arclen(Nodes,Elements,Types,Sections,Materials,DOF,P,SolverOpts);

%hold on
% plot(-selectdof(DOF,CornerNode(1)+0.02)*[zeros(size(DOF)) U],[0 alpha],'--r');
xlabel('Displacement [m]');
ylabel('Load multiplier [-]');
%xlim([0 0.1]);


figure
plotdisp(Nodes,Elements,Types,DOF,U(:,end))

U_New=zeros(length(Nodes),1);

for nodeNum=1:length(Nodes(:,1))
    
  [n,m]=selectdof(DOF,nodeNum) ;
  
  if m==0
   
     U_New(nodeNum)=0; 
      
  elseif(length(m)==1)
      
      U_New(nodeNum)=abs(U(m,end)); 

      
  else
  
  for id=1:length(m)
      U_New(nodeNum)=U(m(id),end)^2+U_New(nodeNum); 

      
  end
   U_New(nodeNum)=sqrt(U_New(nodeNum));
  end
    
end

figure
trisurf(Elements(:,5:7),Nodes(:,2),Nodes(:,3), U_New);


end

