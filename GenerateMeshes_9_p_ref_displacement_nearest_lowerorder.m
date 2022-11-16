function [  ] = GenerateMeshes_9_p_ref_displacement_nearest_lowerorder(  )

%used for conf proceeding ECCOMASS
close all
Path="/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh"+" ";
Order=1;
EltOpts.nl='elastoplastic';
 %figure;
foldername="Mesh_Steep_9_GP_nearest_lowerorder";
numberoflevels=3;
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
NumberOfGaussPoints=[7 16 28 37];

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
ar=[13,11,12,15,16,14,1,4,2,3,27,28,31,30,29,26,21,22,25,24,23,20,10,8,9,6,7,5,33,34,37,36,35,32,18,19,17];%config for [ 7 16 28 37]
% ar=[4,2,3,15,16,14,1,27,28,31,30,29,26,10,8,9,6,7,5,21,22,25,24,23,20,13,11,12,33,34,37,36,35,32,18,19,17];%config for [ 7 19 28 37]
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

