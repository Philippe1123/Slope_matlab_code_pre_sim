function [  ] = GenerateMeshes_3(  )
close all
Path="/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh"+" ";
Order=1;
EltOpts.nl='elastoplastic';
 %figure;


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


for id=0:4
MeshName="Mesh_Steep_6/versionfive_steeper_L_"+num2str(id);
% MeshName="Mesh_Steep_6/versionfive_steeper";

% Input=strcat(Path,MeshName);
% %Input=strcat(Input,'.geo -2  ');
% 
% Input=strcat(Input,'.geo -2 -order');
% Input=Input+' ';
% Input=Input+num2str(Order);
% Input=char(strcat(Input,' -save_topology -format msh22'));
% 
% % [~,~]=system('/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh versionthree_Fine.geo -2 -order 1 -save_topology -format msh2');
% [~,~]=system(Input);
% 
% % % [~,~]=system('/home/philippe/Desktop/gmsh-4.4.0-Linux64/bin/gmsh sen.geo -0');
% Input=strcat(Path,MeshName);
% Input=char(strcat(Input,'.geo -0'));
% 
% [~,~]=system(Input);

model=gmshread(char(strcat(MeshName,'.msh')),char(strcat(MeshName,'.geo_unrolled')));
model.Elements.setSectionID(1);
model.Elements.setMaterialID(1);

Nodes=model.getNodeMatrix(model.getNodes('surfaces'));
%Nodes=model.getNodeMatrix(model.getNodes('elements'));

Elements=model.getElementMatrix(model.getElements('surfaces'));
Elements(:,2)=1;
Elements(:,1)=1:1:length(Elements(:,1));
nElem=length(Elements);


El=Elements(:,5:7);
Point=Nodes(:,2:3);

PathNodes="Mesh_Steep_6/Julia/"+"Nodes_L_"+num2str(id)+".txt";
PathElements="Mesh_Steep_6/Julia/"+"Elements_L_"+num2str(id)+".txt";
 
dlmwrite(PathNodes,Point,'delimiter',' ','precision',15)
dlmwrite(PathElements,El,'delimiter',' ','precision',15)

PathNodes="Mesh_Steep_6/Matlab/"+"Nodes_L_"+num2str(id)+".txt";
PathElements="Mesh_Steep_6/Matlab/"+"Elements_L_"+num2str(id)+".txt";
 
dlmwrite(PathNodes,Nodes,'delimiter',' ','precision',15)
dlmwrite(PathElements,Elements,'delimiter',' ','precision',15)



Types={1 elementPlane EltOpts};





% Check mesh
figure
 hold on
 plotelem(Nodes,Elements,Types,'numbering','off');
% plotnodes(Nodes,'numbering','off');
figure
 plotnodes(Nodes);

end
end

