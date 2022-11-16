function [  ] = GenerateMeshes_6(  )
close all
Path="/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh"+" ";
Order=1;
EltOpts.nl='elastoplastic';
 %figure;
foldername="Mesh_Smooth_7";
numberoflevels=5;
higherOrder=true;
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


MeshName=foldername+"/versionfive_smooth";
% MeshName="Mesh_Steep_6/versionfive_steeper";

 Input=strcat(Path,MeshName);
% 
 Input=strcat(Input,'.geo -2 -order');
 Input=Input+' ';
 Input=Input+num2str(Order);
 Input=char(Input+" -save_topology -format msh22 -o "+foldername+"/level_0");
% 
 [~,~]=system(Input);
for id=1:numberoflevels-numberoflevels

 if(higherOrder==false)   
 [~,~]=system(char("/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh  -refine "+foldername+"/level_"+num2str(id-1)+" -save_topology -format msh22 -o "+foldername+"/level_"+num2str(id)));
 else
 [~,~]=system(char("/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh    "+foldername+"/level_"+num2str(id-1)+" -save_topology -format msh22 -order "+num2str(id)+" -o "+foldername+"/level_"+num2str(id)))
 %%%  Semi working code for higher order
 end
 Input=strcat(Path,MeshName);
 Input=char(strcat(Input,'.geo -0'));
% 
 [~,~]=system(Input);
end


NumberOfGaussPoints=[36 7 12 16 16 16];

for id=0:numberoflevels
model=gmshread(char(foldername+"/level_"+num2str(id)),char(strcat(MeshName,'.geo_unrolled')));
model.Elements.setSectionID(1);
model.Elements.setMaterialID(1);

Nodes=model.getNodeMatrix(model.getNodes('surfaces'));
%Nodes=model.getNodeMatrix(model.getNodes('elements'));
if(id==0)
 interm=model.getElements('surfaces');
end
Elements=model.getElementMatrix(model.getElements('surfaces'));

Elements(:,2)=1;
Elements(:,1)=1:1:length(Elements(:,1));
nElem=size(Elements,1);


El=Elements(:,5:end);
Point=Nodes(:,2:3);

PathNodes=foldername+"/Julia/"+"Nodes_L_"+num2str(id)+".txt";
PathElements=foldername+"/Julia/"+"Elements_L_"+num2str(id)+".txt";
 
dlmwrite(PathNodes,Point,'delimiter',' ','precision',15)
dlmwrite(PathElements,El,'delimiter',' ','precision',15)

PathNodes=foldername+"/Matlab/"+"Nodes_L_"+num2str(id)+".txt";
PathElements=foldername+"/Matlab/"+"Elements_L_"+num2str(id)+".txt";
 
dlmwrite(PathNodes,Nodes,'delimiter',' ','precision',15)
dlmwrite(PathElements,Elements,'delimiter',' ','precision',15)



Types={1 elementPlane EltOpts};


x=gaussqtri(NumberOfGaussPoints(id+1));
x=x';
GaussPoints_Local=[x;ones(1,length(x))];
TriangleCoordLocal=[[0;0;1],[1;0;1],[0;1;1]];
GaussPointsCoord=[];

for idx=1:nElem
    
  TriangleVertices=Nodes(Elements(idx,5:7),2:3);
  TriangleVertices=TriangleVertices';
  TriangleVertices=[TriangleVertices;[1 1 1]];  
  TransformationMatrix=TriangleVertices*inv(TriangleCoordLocal);
  
  GaussPoints_Global=TransformationMatrix*GaussPoints_Local;
  GaussPoints_Global=GaussPoints_Global(1:2,:)';
  GaussPointsCoord=[GaussPointsCoord ;GaussPoints_Global];
  
  
    
end

GaussPointsCoord=[[1:1:length(GaussPointsCoord)]',GaussPointsCoord,zeros(length(GaussPointsCoord),1)];
PathGaussPoints=foldername+"/Matlab/"+"GaussPoints_L_"+num2str(id)+".txt";
dlmwrite(PathGaussPoints,GaussPointsCoord,'delimiter',' ','precision',15)

% Check mesh
figure
 hold on
 plotelem(Nodes,Elements,Types,'numbering','off');
% plotnodes(Nodes,'numbering','off');

 %plotnodes(Nodes);
 plotnodes(GaussPointsCoord,'*r');
end
end

