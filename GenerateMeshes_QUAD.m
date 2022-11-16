function [  ] = GenerateMeshes_QUAD(  )

%used for conf proceeding ECCOMASS
%  close all
%  clc
Path="/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh"+" ";
Order=1;
EltOpts.nl='elastoplastic';
 %figure;
foldername="Mesh_Quad";
numberoflevels=5;
higherOrder=true;
switch Order
    case 1
        elementPlane='plane4';
    case 2
        elementPlane='plane10';
    case 3
        elementPlane='plane21';
    case 4
        elementPlane='plane36t';
end


MeshName=foldername+"/versionfive_steeper_test_2";
% MeshName="Mesh_Steep_6/versionfive_steeper";

 Input=strcat(Path,MeshName);

 Input=char(strcat(Input,'.geo -0'));
% 
 [~,~]=system(Input);
%  
%   Input=char(Path+" "+foldername+"/Generate_p -2 -save_topology");
%   [~,~]=system(Input);
 

if(higherOrder==true)
NumberOfGaussPoints=[3 3 5 9 17 17];

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




if(size(Elements,2)==29)
    corrvec=[1:17, 21 18 22 19 23 20 24 25];
    El=Elements(:,5:end);
   Elements(:,5:end)=El(:,corrvec);
   
elseif(size(Elements,2)==40)  
 corrvec=[1:21, 25 26 22 27 28 23 29 30 24 31 32 33 34 35 36];
    El=Elements(:,5:end);
   Elements(:,5:end)=El(:,corrvec);  
   
   
   elseif(size(Elements,2)==53)  
 corrvec=[1:25, 29:31,26,32:34,27,35:37,28,38:41, 45, 42,46,43,47,44,48,49];
    El=Elements(:,5:end);
   Elements(:,5:end)=El(:,corrvec); 
   
      elseif(size(Elements,2)==68)  
 corrvec=[1:29,33:36,30,37:40,31,41:44,32,45:49,53:54,50,55:56,51,57:58,52,59:64];
    El=Elements(:,5:end);
   Elements(:,5:end)=El(:,corrvec); 
   
         elseif(size(Elements,2)==85)  
 corrvec=[1:33, 37:41,34,42:46,35,47:51,36,52:56,57,61:63,58,64:66,59,67:69,60,70:73,77,74,78,75,79,76,80,81];
    El=Elements(:,5:end);
   Elements(:,5:end)=El(:,corrvec); 
   
            elseif(size(Elements,2)==104)  
 corrvec=[1:37,41:46,38,47:52,39,53:58,40,59:65,69:72,66,73:76,67,77:80,68,81:85,89:90,86,91:92,87,93:94,88,95:100];
    El=Elements(:,5:end);
   Elements(:,5:end)=El(:,corrvec); 
   
      
            elseif(size(Elements,2)==125)  
 corrvec=[1:41,45:51,42,52:58,43,59:65,44,66:73,77:81,74,82:86,75,87:91,76,92:97,101:103,98,104:106,99,107:109,100,110:113,117,114,118,115,119,116,120,121];
    El=Elements(:,5:end);
   Elements(:,5:end)=El(:,corrvec); 
   
end








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
x=clenshaw_curtis_2d(NumberOfGaussPoints(id+1));
x=x';
% ar=[[7,16,10,15,2,11,3,1,9,6,13,4,12,8,14,5]];
%  x=x(ar,:);

% x=x(1:NumberOfGaussPoints(id+1),:);
% x=x';
% GaussPoints_Local=[x;ones(1,length(x));ones(1,length(x))];
% TriangleCoordLocal=[[-1;-1;1;2],[1;-1;1;2],[1;1;1;1],[-1;1;1;2]];
 GaussPointsCoord=[];

for idx=1:nElem
    
    V=Nodes(Elements(idx,5:8),2:3);
%   TriangleVertices=TriangleVertices';
%   TriangleVertices=[TriangleVertices;[1 1 1 1];[2 2 2 2]];  
%   TransformationMatrix=TriangleVertices*inv(TriangleCoordLocal);
  
Mat=[-1 -1 1 0 0 0 V(1,1) V(1,1);0 0 0 -1 -1 1 V(1,2) V(1,2);1 -1 1 0 0 0 -V(2,1) V(2,1); 0 0 0 1 -1 1 -V(2,2) V(2,2);1 1 1 0 0 0 -V(3,1) -V(3,1); 0 0 0 1 1 1 -V(3,2) -V(3,2); -1 1 1 0 0 0 V(4,1) -V(4,1);0 0 0 -1 1 1 V(4,2) -V(4,2)];
res=[V(1,1);V(1,2);V(2,1);V(2,2);V(3,1);V(3,2);V(4,1);V(4,2)];  
sol=Mat\res;
sol(9,1)=1;
T=reshape(sol,[3,3]);
T=T';
Pt=T*[x;ones(1,length(x))];
GaussPoints_Global=Pt(1:2,:)./Pt(3,:);  
  GaussPoints_Global=GaussPoints_Global';
  GaussPointsCoord=[GaussPointsCoord ;GaussPoints_Global];
  
  
    
end

GaussPointsCoord=[[1:1:length(GaussPointsCoord)]',GaussPointsCoord,zeros(length(GaussPointsCoord),1)];
PathGaussPoints=foldername+"/p_ref/Matlab/"+"GaussPoints_L_"+num2str(id)+".txt";



dlmwrite(PathGaussPoints,GaussPointsCoord,'delimiter',' ','precision',15)
end
% Check mesh
% figure
%  hold on
%  plotelem(Nodes,Elements,Types,'numbering','off');
%  plotnodes(Nodes,'numbering','off','k*');
 
 figure
 hold on
%  plotelem(Nodes,Elements,Types,'numbering','off','GCS','off','LineWidth',3);
  plotelem(Nodes,Elements,Types,'GCS','off','LineWidth',3);

 plotnodes(Nodes,'numbering','off','*r','GCS','off','LineWidth',3);
%  axis equal
% axis([0 5 0 1])
set(gca,'xtick',[])
set(gca,'ytick',[])

% plotnodes(Nodes);
 if(higherOrder==true)
     figure
      plotelem(Nodes,Elements,Types,'numbering','off','GCS','off','LineWidth',3);
hold on
plotnodes(GaussPointsCoord,'numbering','off','*r');
 end
end
end

