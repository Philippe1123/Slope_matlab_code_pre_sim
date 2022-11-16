function [  ] = GenerateMeshes_8(  )
 close all
Path="/home/philippe/Desktop/gmsh-4.4.1-Linux64/bin/gmsh"+" ";
Order=1;
EltOpts.nl='elastoplastic';
 %figure;
foldername="Mesh_Steep_8";
numberoflevels=8;
higherOrder=false;
switch Order
    case 1
        elementPlane='plane3';
    case 2
        elementPlane='plane15';
    case 3
        elementPlane='plane28';
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
NumberOfGaussPoints=[7 7 16 28 37 7 7 7 7];

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
Nodes_Sort=Nodes;
[out,indx]=sort(Nodes_Sort(:,2));

Nodes_Sort(:,2:3)=Nodes_Sort(indx,2:3); %SORT THEM
Nodes=Nodes_Sort;

indx=[[1:length(indx)]', indx];

[out,indx2]=sort(indx(:,2));

for fg=5:size(Elements,2)
Elements(:,fg)=indx2(Elements(:,fg));

end


Elements_interm=Elements;

if(id==1)
    
     figure
 hold on
%  plotelem(Nodes,Elements,Types,'numbering','off','GCS','off','LineWidth',3);
%  plotnodes(Nodes,'numbering','off','*r','GCS','off','LineWidth',3);
 
 plotelem(Nodes,Elements,Types,'GCS','off','LineWidth',3);
 plotnodes(Nodes,'*r','GCS','off','LineWidth',3)

for iddd=1:4:length(Elements_interm)
 
        
      Elements(iddd,5:end)=Elements_interm(iddd+1,5:end);
      Elements(iddd+1,5:end)=Elements_interm(iddd+3,5:end);
      Elements(iddd+2,5:end)=Elements_interm(iddd,5:end);
      Elements(iddd+3,5:end)=Elements_interm(iddd+2,5:end);

    
    
end

 figure
 hold on
%  plotelem(Nodes,Elements,Types,'numbering','off','GCS','off','LineWidth',3);
%  plotnodes(Nodes,'numbering','off','*r','GCS','off','LineWidth',3);
 
 plotelem(Nodes,Elements,Types,'GCS','off','LineWidth',3);
 plotnodes(Nodes,'*r','GCS','off','LineWidth',3)
end


if(id==2)
    
     figure
 hold on
%  plotelem(Nodes,Elements,Types,'numbering','off','GCS','off','LineWidth',3);
%  plotnodes(Nodes,'numbering','off','*r','GCS','off','LineWidth',3);
 
 plotelem(Nodes,Elements,Types,'GCS','off','LineWidth',3);
 plotnodes(Nodes,'*r','GCS','off','LineWidth',3)

for iddd=1:16:length(Elements_interm)
 
        
      Elements(iddd,5:end)=Elements_interm(iddd+5,5:end);
      Elements(iddd+1,5:end)=Elements_interm(iddd+13,5:end);
      Elements(iddd+2,5:end)=Elements_interm(iddd+1,5:end);
      Elements(iddd+3,5:end)=Elements_interm(iddd+9,5:end); 
      Elements(iddd+4,5:end)=Elements_interm(iddd+15,5:end);
      Elements(iddd+5,5:end)=Elements_interm(iddd+12,5:end);
      Elements(iddd+6,5:end)=Elements_interm(iddd+7,5:end);
      Elements(iddd+7,5:end)=Elements_interm(iddd+3,5:end); 
      Elements(iddd+8,5:end)=Elements_interm(iddd,5:end);
      Elements(iddd+9,5:end)=Elements_interm(iddd+2,5:end);
      Elements(iddd+10,5:end)=Elements_interm(iddd+4,5:end);
      Elements(iddd+11,5:end)=Elements_interm(iddd+8,5:end); 
      Elements(iddd+12,5:end)=Elements_interm(iddd+10,5:end);
      Elements(iddd+13,5:end)=Elements_interm(iddd+11,5:end);
      Elements(iddd+14,5:end)=Elements_interm(iddd+6,5:end);
      Elements(iddd+15,5:end)=Elements_interm(iddd+14,5:end); 

    
    
end

 figure
 hold on
%  plotelem(Nodes,Elements,Types,'numbering','off','GCS','off','LineWidth',3);
%  plotnodes(Nodes,'numbering','off','*r','GCS','off','LineWidth',3);
 
 plotelem(Nodes,Elements,Types,'GCS','off','LineWidth',3);
 plotnodes(Nodes,'*r','GCS','off','LineWidth',3)
end


if(id==3)

for iddd=1:64:length(Elements_interm)
 
        
      Elements(iddd,5:end)=Elements_interm(iddd+21,5:end);
      Elements(iddd+1,5:end)=Elements_interm(iddd+53,5:end);
      Elements(iddd+2,5:end)=Elements_interm(iddd+5,5:end);
      Elements(iddd+3,5:end)=Elements_interm(iddd+37,5:end); 
      Elements(iddd+4,5:end)=Elements_interm(iddd+61,5:end);
      Elements(iddd+5,5:end)=Elements_interm(iddd+49,5:end);
      Elements(iddd+6,5:end)=Elements_interm(iddd+29,5:end);
      Elements(iddd+7,5:end)=Elements_interm(iddd+13,5:end); 
      Elements(iddd+8,5:end)=Elements_interm(iddd+1,5:end);
      Elements(iddd+9,5:end)=Elements_interm(iddd+9,5:end);
      Elements(iddd+10,5:end)=Elements_interm(iddd+17,5:end);
      Elements(iddd+11,5:end)=Elements_interm(iddd+33,5:end); 
      Elements(iddd+12,5:end)=Elements_interm(iddd+41,5:end);
      Elements(iddd+13,5:end)=Elements_interm(iddd+45,5:end);
      Elements(iddd+14,5:end)=Elements_interm(iddd+25,5:end);
      Elements(iddd+15,5:end)=Elements_interm(iddd+57,5:end); 
      
      Elements(iddd+16,5:end)=Elements_interm(iddd+63,5:end); 

      
      Elements(iddd+17,5:end)=Elements_interm(iddd+60,5:end);
      Elements(iddd+18,5:end)=Elements_interm(iddd+55,5:end);
      Elements(iddd+19,5:end)=Elements_interm(iddd+51,5:end);
      Elements(iddd+20,5:end)=Elements_interm(iddd+48,5:end); 
      Elements(iddd+21,5:end)=Elements_interm(iddd+31,5:end);
      Elements(iddd+22,5:end)=Elements_interm(iddd+15,5:end);
      Elements(iddd+23,5:end)=Elements_interm(iddd+12,5:end);
      Elements(iddd+24,5:end)=Elements_interm(iddd+7,5:end); 
      Elements(iddd+25,5:end)=Elements_interm(iddd+3,5:end);
      Elements(iddd+26,5:end)=Elements_interm(iddd,5:end);
      Elements(iddd+27,5:end)=Elements_interm(iddd+2,5:end);
      Elements(iddd+28,5:end)=Elements_interm(iddd+4,5:end); 
      Elements(iddd+29,5:end)=Elements_interm(iddd+8,5:end);
      Elements(iddd+30,5:end)=Elements_interm(iddd+10,5:end);
      Elements(iddd+31,5:end)=Elements_interm(iddd+16,5:end);
      Elements(iddd+32,5:end)=Elements_interm(iddd+32,5:end); 
      Elements(iddd+33,5:end)=Elements_interm(iddd+34,5:end);
      Elements(iddd+34,5:end)=Elements_interm(iddd+36,5:end);
      Elements(iddd+35,5:end)=Elements_interm(iddd+40,5:end);
      Elements(iddd+36,5:end)=Elements_interm(iddd+42,5:end); 
      Elements(iddd+37,5:end)=Elements_interm(iddd+43,5:end);
      Elements(iddd+38,5:end)=Elements_interm(iddd+38,5:end);
      Elements(iddd+39,5:end)=Elements_interm(iddd+46,5:end);
      Elements(iddd+40,5:end)=Elements_interm(iddd+47,5:end); 
      Elements(iddd+41,5:end)=Elements_interm(iddd+26,5:end);
      Elements(iddd+42,5:end)=Elements_interm(iddd+58,5:end);
      Elements(iddd+43,5:end)=Elements_interm(iddd+59,5:end);
      Elements(iddd+44,5:end)=Elements_interm(iddd+54,5:end); 
      Elements(iddd+45,5:end)=Elements_interm(iddd+62,5:end);
      Elements(iddd+46,5:end)=Elements_interm(iddd+52,5:end);
      Elements(iddd+47,5:end)=Elements_interm(iddd+50,5:end);
      Elements(iddd+48,5:end)=Elements_interm(iddd+30,5:end); 
      Elements(iddd+49,5:end)=Elements_interm(iddd+28,5:end);
      Elements(iddd+50,5:end)=Elements_interm(iddd+14,5:end);
      Elements(iddd+51,5:end)=Elements_interm(iddd+6,5:end);
      Elements(iddd+52,5:end)=Elements_interm(iddd+11,5:end); 
      Elements(iddd+53,5:end)=Elements_interm(iddd+19,5:end);
      Elements(iddd+54,5:end)=Elements_interm(iddd+18,5:end);
      Elements(iddd+55,5:end)=Elements_interm(iddd+35,5:end);
      Elements(iddd+56,5:end)=Elements_interm(iddd+39,5:end); 
      Elements(iddd+57,5:end)=Elements_interm(iddd+44,5:end);
      Elements(iddd+58,5:end)=Elements_interm(iddd+24,5:end);
      Elements(iddd+59,5:end)=Elements_interm(iddd+27,5:end);
      Elements(iddd+60,5:end)=Elements_interm(iddd+56,5:end); 
      Elements(iddd+61,5:end)=Elements_interm(iddd+22,5:end);
      Elements(iddd+62,5:end)=Elements_interm(iddd+23,5:end);
      Elements(iddd+63,5:end)=Elements_interm(iddd+20,5:end);

    
    
end
end
if(id==4)
    for iddd=1:256:length(Elements_interm)

 Vec= [86;214;22;150;246;198;118;54;6;38;70;134;166;182;102;230;254;242;222;206;194;126;62;50;30;14;2;10;18;34;42;66;130;138;146;162;170;174;154;186;190;106;234;238;218;250;210;202;122;114;58;26;46;78;74;142;158;178;98;110;226;90;94;82;256;253;248;244;241;224;208;205;200;196;193;128;64;61;56;52;49;32;16;13;8;4;1;3;5;9;11;17;33;35;37;41;43;65;129;131;133;137;139;145;161;163;165;169;171;172;167;175;176;155;187;188;183;191;192;107;235;236;231;239;240;219;251;252;247;255;245;243;223;221;207;199;197;195;127;125;63;55;53;51;31;29;15;7;12;20;19;36;40;39;44;68;67;132;136;135;140;148;147;164;168;173;153;156;185;181;184;189;105;108;233;229;232;237;217;220;249;215;216;212;204;201;124;119;120;116;60;57;28;23;24;21;25;45;47;77;72;69;73;141;143;157;152;149;151;159;179;180;99;101;103;111;227;228;211;213;209;203;123;121;117;115;113;59;27;48;80;79;71;76;75;144;160;177;97;100;104;109;112;225;91;92;87;95;96;93;88;84;81;83;85;89];  
 Or=[1:1:256];   
    Elements(iddd+Or-1,5:end)=Elements_interm(iddd+Vec-1,5:end);
    
    end
end




PathNodes_sorted=foldername+"/h_ref/Matlab/"+"Nodes_Sorted_L_"+num2str(id)+".txt";
dlmwrite(PathNodes_sorted,Nodes_Sort,'delimiter',' ','precision',15)
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
PathGaussPoints=foldername+"/p_ref/Matlab/"+"GaussPoints_L_"+num2str(id)+".txt";
dlmwrite(PathGaussPoints,GaussPointsCoord,'delimiter',' ','precision',15)
end
% Check mesh

% figure
%  plotelem(Nodes,Elements,Types,'LineWidth',3);
%  hold on
%   plotnodes(Nodes);


 figure
 hold on
%  plotelem(Nodes,Elements,Types,'numbering','off','GCS','off','LineWidth',3);
%  plotnodes(Nodes,'numbering','off','*r','GCS','off','LineWidth',3);
 
 plotelem(Nodes,Elements,Types,'GCS','off','LineWidth',3);
 plotnodes(Nodes,'*r','GCS','off','LineWidth',3)
 
%  axis equal
% axis([0 5 0 1])
set(gca,'xtick',[])
set(gca,'ytick',[])
 if(higherOrder==true)
plotnodes(GaussPointsCoord,'*r');
 end
end
end

