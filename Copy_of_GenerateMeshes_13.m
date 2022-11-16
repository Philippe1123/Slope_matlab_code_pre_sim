function [  ] = GenerateMeshes_13(  )
%sclose all
Path="/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh"+" ";
Order=1;
EltOpts.nl='elastoplastic';
 %figure;
foldername="Mesh_Steep_13";
numberoflevels=5;
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
% 
 Input=strcat(Input,'.geo -2 -order');
 Input=Input+' ';
 Input=Input+num2str(Order);
 Input=char(Input+" -save_topology -format msh22 -o "+foldername+"/level_0");
% 
 [~,~]=system(Input);
for id=1:numberoflevels

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

if(higherOrder==true)
NumberOfGaussPoints=[7 7 16 28 37 61];

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

x_full=gaussqtri(NumberOfGaussPoints(end));
x_b=[];
for id=1:numberoflevels
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
 
dlmwrite(PathNodes,Nodes,'delimiter',' ','precision',15)
dlmwrite(PathElements,Elements,'delimiter',' ','precision',15)   
    
end



Types={1 elementPlane EltOpts};

if(higherOrder==true)
% % % x_red=gaussqtri(37);
% % % positions=[];
% % % 
% % % for op=1+length(x_b):min(NumberOfGaussPoints(id+1),length(x_red))
% % %     
% % %  dist=sqrt((x_full(:,1)-x_red(op,1)).^2+(x_full(:,2)-x_red(op,2)).^2);   
% % %  [val,pos]=min(dist);
% % %  x_b=[x_b;x_full(pos,:)]; 
% % %  x_full(pos,:)=[];
% % % %positions=[positions;pos];
% % %  end

x=[35 61 8 9 28 38 39 44 30 29 15 58 16 1 46 45 10 43 42 19 41 40 22 23 53 18 60 6 7 17 57 4 27 52 56 5 26 ];
x_2=[2,3,11,12,13,14,20,21,24,25,31,32,33,34,36,37,47,48,49,50,51,54,55,59];
x=[x x_2];
pt=gaussqtri(61);
x=pt(x,:);
% % % if( NumberOfGaussPoints(id+1)>length(x_red))
% % %     
% % % x_b=[x_b;    x_full];
% % % end

x=x(1:NumberOfGaussPoints(id+1),:);

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
PathGaussPoints=foldername+"/p_ref/Matlab/"+"GaussPoints_L_"+num2str(id)+".txt";
dlmwrite(PathGaussPoints,GaussPointsCoord,'delimiter',' ','precision',15)
end
% Check mesh
figure
 hold on
 plotelem(Nodes,Elements,Types,'numbering','off');
 plotnodes(Nodes,'numbering','off','k*');

% plotnodes(Nodes);
 if(higherOrder==true)
plotnodes(GaussPointsCoord,'numbering','off','*r');
 end
end
end

