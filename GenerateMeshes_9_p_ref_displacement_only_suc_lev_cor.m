function [  ] = GenerateMeshes_9_p_ref_displacement_only_suc_lev_cor(  )

%used for conf proceeding ECCOMASS
close all
Path="/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh"+" ";
Order=1;
EltOpts.nl='elastoplastic';
 %figure;
foldername="Mesh_Steep_9_GP_nearest_suc_levl_Cor";
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

Master={};

Slave={};
Slave{1}=[7,16,10,15,2,11,3,1,9,6,13,4,12,8,14,5];
Master{1}=Slave;

Slave={};
Slave{1}=[7,16,15,10,2,11,3,1,9,6,13,4,8,12,14,5];
Slave{2}=[13,17,19,10,5,16,6,1,9,12,18,7,8,14,15,11,2,3,4];
Master{2}=Slave;

Slave={};
Slave{2}=[13,17,2,19,10,5,16,3,6,1,9,12,18,7,8,14,4,15,11];
Slave{3}=[4,20,8,22,13,14,19,9,15,1,12,3,21,16,11,17,10,18,2,26,28,7,25,6,27,5,23,24];
Master{3}=Slave;

Slave={};
Slave{3}=[4,26,28,20,7,8,22,13,19,14,25,9,15,1,12,6,3,27,16,21,11,17,10,5,18,23,24,2];
Slave{4}=[4,21,24,27,13,14,30,10,26,5,20,15,6,1,9,12,3,25,7,31,8,28,16,11,29,22,23,2,33,17,36,32,18,37,34,19,35];
Master{4}=Slave;

Slave={};
Slave{4}=[4,21,24,27,13,33,14,17,26,30,36,32,10,5,20,15,18,6,1,9,3,25,12,7,8,37,34,28,31,19,16,35,11,29,22,23,2];
Slave{5}=[9,7,18,2,25,12,1,10,3,37,34,11,29,28,6,46,43,38,35,30,8,17,24,39,44,33,50,52,36,42,45,49,55,51,59,60,61,4,16,13,27,22,20,19,31,5,21,14,23,15,40,32,26,47,41,48,53,57,54,58,56];
Master{5}=Slave;

Slave={};
Slave{5}=[9,7,18,4,16,27,13,2,12,25,10,22,20,3,19,11,31,34,29,37,28,21,5,14,6,43,40,38,35,30,23,15,8,17,24,26,32,39,52,44,50,47,33,41,36,48,46,53,42,55,49,45,51,57,1,54,58,56,59,60,61];
Slave{6}=[8,6,19,1,17,30,20,3,14,35,11,31,26,4,22,15,41,44,37,46,33,25,2,21,5,52,50,47,42,36,32,16,7,18,34,29,40,48,59,51,57,54,43,49,45,55,64,60,53,62,56,58,61,69,63,66,70,68,71,72,73,12,9,28,23,39,10,13,24,27,38,65,67];
Master{6}=Slave;

Slave={};
Slave{6}=[8,6,1,19,17,12,9,30,23,28,20,14,31,35,39,11,3,26,4,15,22,37,44,41,10,25,33,2,46,21,13,5,52,50,47,36,32,24,7,16,18,27,42,34,59,29,48,40,38,54,57,51,49,43,45,55,53,64,62,60,58,56,61,67,65,69,63,66,70,71,68,72,73]; %L6_M7_S6 5done
Slave{7}=[29,49,61,52,82,85,67,64,20,88,103,73,17,106,70,1,97,109,102,78,4,14,76,112,72,114,7,66,40,108,90,54,3,6,9,15,18,21,30,80,50,86,10,104,39,62,8,110,68,111,75,13,5,74,38,113,2,69,105,16,41,77,107,87,19,63,71,89,81,51,65,53,28,55,58,26,79,31,23,43,91,37,34,115,42,118,94,46,48,121,36,96,124,126,100,11,120,84,60,12,24,27,56,116,99,122,123,92,32,125,44,98,45,93,117,101,119,33,95,47,22,35,83,25,57,59]; %L7_M7_S7
Master{7}=Slave;





if(higherOrder==true)
    if(id+1~=1)
        endPoint=id;
    else
        endPoint=id+1;
    end
for countr= (id+1):-1:endPoint
    
    
    
    
x=gaussqtri(NumberOfGaussPoints(id+1));

ar=Master{id+1}{id+1};

 x=x(ar,:);

x=x(1:NumberOfGaussPoints(countr),:);
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
PathGaussPoints=foldername+"/p_ref/Matlab/"+"GaussPoints_L_"+num2str(countr-1)+"M"+num2str(id)+"_S"+num2str(countr-1)+".txt";
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

