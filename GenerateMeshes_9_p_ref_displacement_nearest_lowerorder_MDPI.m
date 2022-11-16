function [  ] = GenerateMeshes_9_p_ref_displacement_nearest_lowerorder_MDPI(  )

%used for extra cases MDPI
close all
Path="/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh"+" ";
Order=1;
EltOpts.nl='elastoplastic';
 %figure;
foldername="Mesh_Steep_9_GP_nearest_lowerorder_MDPI";
numberoflevels=6;
higherOrder=true;
switch Order
    case 1
        elementPlane='plane3';
    case 2
        elementPlane='plane10';
    case 3
        elementPlane='plane21';
    case 4
        elementPlane='plane36t';
end


MeshName=foldername+"/versionfive_steeper";
% MeshName="Mesh_Steep_6/versionfive_steeper";

 Input=strcat(Path,MeshName);

 Input=char(strcat(Input,'.geo -0'));
% 
 [~,~]=system(Input);
 
  Input=char(Path+" "+foldername+"/Generate_p -2 -save_topology");
 [~,~]=system(Input);
 

if(higherOrder==true)
    %NumberOfGaussPoints=[6 7 13 16 19 28 37 61 73];

 %NumberOfGaussPoints=[7 13  19 25 28 33 37 61 73];
 NumberOfGaussPoints=[16 19 28 37 61 73 126];
end


if(higherOrder==false)
 if(exist(foldername+"/h_ref/")==7)
  rmdir(char(foldername+"/h_ref/"),'s')  
 end
 mkdir(char(foldername+"/h_ref/Julia/"))   
 mkdir(char(foldername+"/h_ref/Matlab/")) 
 
else
    
  if(exist(foldername+"/p_ref/")==7)
  rmdir(char(foldername+"/p_ref/"),'s')  
 end
 mkdir(char(foldername+"/p_ref/Julia/"))   
 mkdir(char(foldername+"/p_ref/Matlab/"))
end


for id=0:numberoflevels
model=gmshread(char(foldername+"/level_"+num2str(id)+".msh"),char(strcat(MeshName,'.geo_unrolled')));
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


if(higherOrder==false)
 

PathNodes=foldername+"/h_ref/Julia/"+"Nodes_L_"+num2str(id)+".txt";
PathElements=foldername+"/h_ref/Julia/"+"Elements_L_"+num2str(id)+".txt";
 
dlmwrite(PathNodes,Point,'delimiter',' ','precision',15)
dlmwrite(PathElements,El,'delimiter',' ','precision',15)

PathNodes=foldername+"/h_ref/Matlab/"+"Nodes_L_"+num2str(id)+".txt";
PathElements=foldername+"/h_ref/Matlab/"+"Elements_L_"+num2str(id)+".txt";
 
dlmwrite(PathNodes,Nodes,'delimiter',' ','precision',15)
dlmwrite(PathElements,Elements,'delimiter',' ','precision',15)

else
    

    
 PathNodes=foldername+"/p_ref/Julia/"+"Nodes_L_"+num2str(id)+".txt";
PathElements=foldername+"/p_ref/Julia/"+"Elements_L_"+num2str(id)+".txt";
 
dlmwrite(PathNodes,Point,'delimiter',' ','precision',15)
dlmwrite(PathElements,El,'delimiter',' ','precision',15)

PathNodes=foldername+"/p_ref/Matlab/"+"Nodes_L_"+num2str(id)+".txt";
PathElements=foldername+"/p_ref/Matlab/"+"Elements_L_"+num2str(id)+".txt";

Nodes_Sort=Nodes;
[out,indx]=sort(Nodes_Sort(:,2));

Nodes_Sort(:,2:3)=Nodes_Sort(indx,2:3); %SORT THEM
Nodes=Nodes_Sort;

indx=[[1:length(indx)]', indx];

[out,indx2]=sort(indx(:,2));

for fg=5:size(Elements,2)
Elements(:,fg)=indx2(Elements(:,fg));

end

 
dlmwrite(PathNodes,Nodes,'delimiter',' ','precision',15)
dlmwrite(PathElements,Elements,'delimiter',' ','precision',15)   
    
end



Types={1 elementPlane EltOpts};

if(higherOrder==true)
x=gaussqtri(NumberOfGaussPoints(end));
% ar=[4,2,3,15,16,14,1,20,17,21,22,18,19,13,11,12,9,10,8,26,23,27,28,24,25,7,5,6];
%ar=[13,11,12,15,16,14,1,4,2,3,27,28,31,30,29,26,21,22,25,24,23,20,10,8,9,6,7,5,33,34,37,36,35,32,18,19,17];%config for [ 7 16 28 37]
% ar=[4,2,3,15,16,14,1,27,28,31,30,29,26,10,8,9,6,7,5,21,22,25,24,23,20,13,11,12,33,34,37,36,35,32,18,19,17];%config for [ 7 19 28 37]
% ar=[4,14,16,30,1,2,27,28,31,29,26,10,8,3,15,9,6,7,24,23,13,11,12,21,22,25,20,5,33,34,37,17,18,19,36,35,32];
% ar=[1,64,22,37,36,50,20,35,21,51,8,73,7,11,52,53,49,69,29,30,42,24,41,25,68,2,44,62,34,61,26,33,47,48,6,71,18,19,72,5,17,70,16,3,59,45,14,57,43,31,60,32,54,40,55,56,15,46,58,4,12,67,27,9,38,28,66,13,23,65,39,63,10]; %mdpi paper
% ar=[1,37,21,50,36,29,64,20,35,34,51,63,73,8,11,52,7,49,53,30,41,2,43,69,66,22,44,68,26,25,40,62,61,33,47,42,48,6,19,17,3,14,31,4,15,46,5,32,16,18,59,57,54,45,55,60,56,58,70,71,72,12,9,28,23,39,10,13,24,27,38,65,67];
%ar=[1,22,50,29,49,64,42,20,35,21,34,63,73,8,7,53,11,52,51,30,44,37,2,36,43,69,66,68,26,41,33,25,47,40,48,62,61,6,19,17,3,14,31,4,15,46,5,32,16,18,59,57,54,45,55,60,56,58,70,71,72,12,9,28,23,39,10,13,24,27,38,65,67]; 
%ar=[1,37,21,50,36,29,64,20,35,34,51,63,73,8,11,52,7,49,53,30,41,2,43,69,66,22,44,68,26,25,40,62,61,33,47,42,48,6,19,17,3,14,31,4,15,46,5,32,16,18,59,57,54,45,55,60,56,58,70,71,72,12,9,28,23,39,10,13,24,27,38,65,67];
% ar=[113,155,21,8,11,157,115,10,153,9,100,102,112,140,22,20,2,4,3,59,68,134,145,57,69,156,72,60,38,137,15,16,14,136,135,154,138,50,71,53,158,43,139,163,161,41,55,73,13,12,51,40,160,159,39,162,96,42,52,70,54,89,98,24,152,101,103,25,87,99,23,88,58,36,56,110,74,27,62,143,92,146,77,164,65,97,149,167,18,67,170,79,151,95,173,175,169,61,19,28,37,111,141,165,171,172,94,147,75,174,63,17,166,148,93,64,168,76,150,142,66,144,26,78,114,35,44,33,86,47,30,104,128,107,80,116,131,122,127,5,119,85,83,121,133,109,49,125,91,1,7,31,34,124,45,105,129,117,82,81,118,6,123,126,130,120,84,106,132,108,29,46,90,32,48];
ar=[29,61,17,70,4,66,6,18,30,10,68,5,69,16,71,28,1,3,2,64,73,78,14,15,62,13,63,65,109,102,112,114,40,110,111,113,41,49,52,82,103,106,76,7,108,54,9,80,50,104,39,8,75,74,38,105,77,107,81,51,53,85,67,20,88,97,72,90,21,86,87,19,89,55,58,26,79,31,23,43,91,37,34,115,42,118,94,46,48,121,36,96,124,126,100,11,120,84,60,12,24,27,56,116,99,122,123,92,32,125,44,98,45,93,117,101,119,33,95,47,22,35,83,25,57,59];

x=x(ar,:);

x=x(1:NumberOfGaussPoints(id+1),:);
x=x';
GaussPoints_Local=[x;ones(1,size(x,2))];
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
PathGaussPoints=foldername+"/p_ref/Matlab/"+"GaussPoints_L_"+num2str(id)+".txt";
% 
% [out,id]=sort(GaussPointsCoord(:,2));
% GaussPointsCoord(:,2:3)=GaussPointsCoord(id,2:3); %SORT THEM

dlmwrite(PathGaussPoints,GaussPointsCoord,'delimiter',' ','precision',15)
end
% Check mesh
% figure
%  hold on
%  plotelem(Nodes,Elements,Types,'numbering','off');
%  plotnodes(Nodes,'numbering','off','k*');
 
 figure
 hold on
 plotelem(Nodes,Elements,Types,'numbering','off','GCS','off','LineWidth',3);
 plotnodes(Nodes,'numbering','off','*r','GCS','off','LineWidth',3);
%  axis equal
% axis([0 5 0 1])
set(gca,'xtick',[])
set(gca,'ytick',[])

% plotnodes(Nodes);
 if(higherOrder==true)
% plotnodes(GaussPointsCoord,'numbering','off','*r');
 end
end
end

