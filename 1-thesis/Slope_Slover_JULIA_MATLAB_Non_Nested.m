function [ ] = Slope_Slover_JULIA_MATLAB_Non_Nested(ProcID)

NumberOfGaussPoints=[7 13  19 25 28 33 37 61 73]; %Paper
%NumberOfGaussPoints=[1 7 16 28];
%%%%%%%%%SELECT CORRECT SYSTEM
str_folder="/home/philippe/Desktop/Slope_Matlab/1-thesis/";
%str_folder="/home/philippeb/.julia/packages/MultilevelEstimators/l8j9n/applications/SPDE/data/";
%str_folder="/home/philippe/.julia/dev/Applications/applications/SPDE/data/";
%%%%%%%%%%%%%



str_interm=str_folder+"mesh/";



dores=0


level=0

for level=5:5

level_num=level;

HigherOrder=1
if(length(level)==1)
    
    str=strcat('_',num2str(level(1)));
    level=str;
    
    
    if(HigherOrder==0) %Pure h refinement
        Order=1;
        
        str_elements=str_folder+"Mesh/Slope/h_refinement/";
        
        
        files_elements=strcat(str_elements,"Elements_L",level,".txt");
        Elements=dlmread(files_elements);
        
        nElem=size(Elements,1);
    elseif(HigherOrder==1) %Pure p refinement
        Order=level_num+1;
        str_elements=str_folder+"Mesh/Slope/p_refinement/";
        
        
        files_elements=strcat(str_elements,"Elements_L",level,".txt");
        Elements=dlmread(files_elements);
        
        nElem=size(Elements,1);
        EltOpts.GP_k_dp=1;
        %nelem TODO
    end
else
    
    if(HigherOrder==3) %MultiIndex hp refinement
        Order=level(2)+1;
        str_elements=str_folder+"Mesh/hp_refinement/Slope/";
        str='_';
        for len=1:length(level)
            str=strcat(str,num2str(level(len)));
            
        end
        
        files_elements=strcat(str_elements,"Elements_L",str,".txt");
        Elements=dlmread(files_elements);
        
        nElem=size(Elements,1);
        EltOpts.GP_k_dp=1;
        level=str;
        
    end
end


% dores=0;
% if(dores==0)
file_nodes=strcat(str_elements,"Nodes_L",level,".txt");
% else
%     fileC=strcat(str_interm,strcat(strcat("Cohesion_",strcat(num2str(level+1),"_")),num2str(ProcID)));
%     file_nodes=strcat(str_elements,strcat(strcat("Nodes_L_",num2str(level+1)),".txt"));
%     files_elements=strcat(str_elements,strcat(strcat("Elements_L_",num2str(level+1)),".txt"));

% end


c=ones(NumberOfGaussPoints(Order)*nElem,1)*8000;

if(HigherOrder==0)
%    Nodes=dlmread(file_nodes);
%    file_nodes_centers=strcat(str_elements,"ElementsCenter_L",level,".txt");
%    nodes_centers=dlmread(file_nodes_centers);
%    c=griddata(Nodes(:,2),Nodes(:,3),c,nodes_centers(:,1),nodes_centers(:,2),'cubic');  % Cohesion in N/m^2


else
    
    %c=c(1:NumberOfGaussPoints(Order)*nElem);
    %  c=reshape(c,nElem,NumberOfGaussPoints(Order));
    c=transpose(reshape(c,NumberOfGaussPoints(Order),nElem));
end




file_nodes=strcat(str_elements,"Nodes_L",level,".txt");
files_elements=strcat(str_elements,"Elements_L",level,".txt");
Elements=dlmread(files_elements);
Nodes=dlmread(file_nodes);






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
phi=20;         % Friction angle in degrees

% Match Mohr-Coulomb at shear meridian
alpha_dp=sind(phi)/3;
k_dp=c.*cosd(phi);

switch Order
    case 1
        elementPlane='plane3';
        EltOpts.nXi=NumberOfGaussPoints(1);
        EltOpts.Sort_nXi=[5,3,1,4,7,2,6];
    case 2
        elementPlane='plane6';
         EltOpts.nXi=NumberOfGaussPoints(2);
         EltOpts.Sort_nXi=[6,8,11,1,7,10,12,13,3,4,2,9,5];

    case 3
        elementPlane='plane10';
        EltOpts.nXi=NumberOfGaussPoints(3);
        EltOpts.Sort_nXi=[13,17,19,10,16,1,9,12,18,8,14,15,11,2,5,3,6,7,4];

    case 4
        elementPlane='plane15';
        EltOpts.nXi=NumberOfGaussPoints(4);
        EltOpts.Sort_nXi=[2,3,13,5,14,4,11,18,16,9,6,15,12,19,20,17,22,21,24,7,8,10,1,23,25];
        
    case 5
        elementPlane='plane21';
        EltOpts.nXi=NumberOfGaussPoints(5);
        EltOpts.Sort_nXi=[4,28,7,20,8,22,13,19,9,15,1,12,6,3,27,21,16,11,17,10,18,5,23,24,2,26,14,25];
        
    case 6
        elementPlane='plane28';
        EltOpts.nXi=NumberOfGaussPoints(6);
        EltOpts.Sort_nXi=[14,28,31,22,11,16,1,25,4,27,8,21,33,3,6,12,15,29,23,5,24,2,20,10,26,30,32,13,19,9,17,7,18];
        
    case 7
        elementPlane='plane36t';
        EltOpts.nXi=NumberOfGaussPoints(7);
        EltOpts.Sort_nXi=[4,21,24,27,13,33,14,30,36,10,26,5,32,20,15,6,9,12,3,25,37,7,31,8,34,28,16,35,11,29,22,23,2,17,1,18,19];
        
    case 8
        elementPlane='plane45';
        EltOpts.nXi=NumberOfGaussPoints(8);
        EltOpts.Sort_nXi=[9,7,18,2,25,12,1,10,3,37,34,11,29,28,6,46,43,38,35,30,8,17,24,39,44,33,50,52,36,42,45,49,55,51,59,60,61,4,16,13,27,22,20,19,31,5,21,14,23,15,40,32,26,47,41,48,53,57,54,58,56];
        
    case 9
        elementPlane='plane55';
        EltOpts.nXi=NumberOfGaussPoints(9);
        EltOpts.Sort_nXi=[8,6,19,1,17,30,20,3,14,35,11,31,26,4,22,15,41,44,37,46,33,25,2,21,5,52,50,47,42,36,32,16,7,18,34,29,40,48,59,51,57,54,43,49,45,55,64,60,53,62,56,58,61,69,63,66,70,68,71,72,73,12,9,28,23,39,10,13,24,27,38,65,67];
end



StepSize=0.1/10;


%% Create model
EltOpts.problem='2dstrain';
EltOpts.nl='elastoplastic';
Types={1 elementPlane EltOpts};
Materials = cell(nElem,3);



nElem=size(Elements,1);



 for k =1:nElem, Materials(k,:)={k 'elastoplastic' {'isotropic' [E nu rho] 'dp' [alpha_dp k_dp(k,:)] 'multilinear' [1 k_dp(k,:)+E/300]}};end

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



CornerNode=selectnode(Nodes,15,14,0); % QOI



Options=struct;

Options.verbose=true;
Div=1;
% while (Div==1)
    Pload=(0:StepSize:1.0); %load
%      [U,~,~,~,Div]=solver_nr(Nodes,Elements,Types,Sections,Materials,DOF,P,Pload,Options);
         [U,~,~,~,Div]=solver_nr(Nodes,Elements,Types,Sections,Materials,DOF,P,Pload,Options,[],[],[],[],[]);

%     res=-selectdof(DOF,8+0.02)*[zeros(size(DOF)) U];
%     res=res(end);
%     count=1;
%     if(Div==1||res>1||res<0)
%         StepSize=StepSize/2;
%         Div=1;
%         count=count+1;
%         if(count>10)
%             
%             Div=0;
%             U=zeros(length(Nodes),1);
%         end
%     end
%     
%     
% end
res1=-selectdof(DOF,CornerNode(1)+0.02)*[zeros(size(DOF)) U];
%res2=-selectdof(DOF,9+0.02)*[zeros(size(DOF)) U];
%res=[res1 res2];
clc

dispx=zeros(length(Nodes),3);
dispy=zeros(length(Nodes),3);

for id=1:length(Nodes)
  dispx(id,1)=Nodes(id,2);
  dispx(id,2)=Nodes(id,3);
  
  outx=-selectdof(DOF,Nodes(id,1)+0.01)*[zeros(size(DOF)) U];
  
  dispx(id,3)=outx(end);

  dispy(id,1)=Nodes(id,2);
  dispy(id,2)=Nodes(id,3);
  
  outy=-selectdof(DOF,Nodes(id,1)+0.02)*[zeros(size(DOF)) U];
  
  dispy(id,3)=outy(end);
    
    
end
figure()
scatter3(dispy(:,1),dispy(:,2),sqrt(dispy(:,3).^2+dispx(:,3).^2),100,sqrt(dispy(:,3).^2+dispx(:,3).^2),'filled')

dlmwrite(("qoi"+char(level)+".txt"),[res1(2:end)', Pload'],'precision',10)

figure
plotdisp(Nodes,Elements,Types,DOF,U(:,end),'DispScal',20)
DisplacedNodes=Nodes;
DisperNode = zeros(length(Nodes),4);

for i=1:length(Nodes)
    
xdis=selectdof(DOF,Nodes(i,1)+0.01)*[zeros(size(DOF)) U(:,end)];    
xdis=xdis(end);

ydis=selectdof(DOF,Nodes(i,1)+0.02)*[zeros(size(DOF)) U(:,end)];    
ydis=ydis(end);

DisplacedNodes(i,2)=DisplacedNodes(i,2)+xdis*20;
DisplacedNodes(i,3)=DisplacedNodes(i,3)+ydis*20;

DisperNode(i,1) = Nodes(i,2);
DisperNode(i,2) = Nodes(i,3);
DisperNode(i,3) = xdis;
DisperNode(i,4) = ydis;



end

dlmwrite(("full"+char(level)+".txt"),DisperNode,'precision',10)

% 
% hold on
% plotnodes(DisplacedNodes,'numbering','off','*r','GCS','off','LineWidth',3)
% matlab2tikz('floatFormat','%.20f',char(level))

end


end

