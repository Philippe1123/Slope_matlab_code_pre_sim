function [ res] = Slope_Slover_JULIA_MATLAB_develop()
Vecres=[];
levels=[0,2,4,6];
tic
for level=levels

    
    Order=level+1;

 
    
    
    

        str_elements="/home/philippe/Desktop/GMSH_Matlab_ReadIn/TestHigherOrders/p_ref/Matlab/";
        files_elements=strcat(str_elements,strcat(strcat("Elements_L_",num2str(level)),".txt"));
        Elements=dlmread(files_elements);
        

    
    
    
    
    
    
    
    
    
    
    file_nodes=strcat(str_elements,strcat(strcat("Nodes_L_",num2str(level)),".txt"));
    files_elements=strcat(str_elements,strcat(strcat("Elements_L_",num2str(level)),".txt"));
    Elements=dlmread(files_elements);
    Nodes=dlmread(file_nodes);
    
        nElem=length(Elements);

    
    
    
    
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
    c=6000;
    % Match Mohr-Coulomb at shear meridian
    alpha_dp=sind(phi)/3;
    k_dp=c.*cosd(phi);
    
    switch Order
        case 1
            elementPlane='plane3';
        case 2
            elementPlane='plane6';
        case 3
            elementPlane='plane10';
        case 4
            elementPlane='plane15';
        case 5
            elementPlane='plane21';
        case 6
            elementPlane='plane28';
        case 7
            elementPlane='plane36t';
        case 8
            elementPlane='plane45';
        case 9
            elementPlane='plane55';
        case 10
            elementPlane='plane66';
    end
    
    
    
    StepSize=0.1/10;
    
    
    %% Create model
    EltOpts.problem='2dstrain';
    EltOpts.nl='elastoplastic';
    Types={1 elementPlane EltOpts};
    Materials = cell(nElem,3);
    
    
    
    
    
    
    for k =1:nElem, Materials(k,:)={k 'elastoplastic' {'isotropic' [E nu rho] 'dp' [alpha_dp k_dp] 'multilinear' [1 k_dp+E/300]}};end
    
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
    % SolverOpts.initalpha=0.2;
    % SolverOpts.maxstep=25;
    % SolverOpts.maxiter=25;
    CornerNode=selectnode(Nodes,15,14,0); % QOI
    
    
    
    Options=struct;
    
    Options.verbose=false;
    Div=1;
    while (Div==1)
        Pload=(0:StepSize:1); %load
        [U,~,~,~,Div]=solver_nr(Nodes,Elements,Types,Sections,Materials,DOF,P,Pload,Options);
        
        res=-selectdof(DOF,8+0.02)*[zeros(size(DOF)) U];
        res=res(end);
        count=1;
        if(Div==1||res>1||res<0)
            StepSize=StepSize/2;
            Div=1;
            count=count+1;
            if(count>10)
                
                Div=0;
                U=zeros(length(Nodes),1);
            end
        end
        
        
    end
    res1=-selectdof(DOF,CornerNode(1)+0.02)*[zeros(size(DOF)) U];
    res2=-selectdof(DOF,9+0.02)*[zeros(size(DOF)) U];
    res=[res1 res2];
    res=res1(end);
    % figure
    % plot(abs(res),Pload(1:length(res)),'--b')
    %
    %
    %
    % figure
    % plotdisp(Nodes,Elements,Types,DOF,U(:,end))
    %
    % U_New=zeros(length(Nodes),1);
    %
    % for nodeNum=1:length(Nodes(:,1))
    %
    %     [n,m]=selectdof(DOF,nodeNum) ;
    %
    %     if m==0
    %
    %         U_New(nodeNum)=0;
    %
    %     elseif(length(m)==1)
    %
    %         U_New(nodeNum)=abs(U(m,end));
    %
    %
    %     else
    %
    %         for id=1:length(m)
    %             U_New(nodeNum)=U(m(id),end)^2+U_New(nodeNum);
    %
    %
    %         end
    %         U_New(nodeNum)=sqrt(U_New(nodeNum));
    %     end
    %
    % end
    %
    % figure
    % trisurf(Elements(:,5:7),Nodes(:,2),Nodes(:,3), U_New);
    %dlmwrite(fileRES,res,'delimiter',' ','precision',15);
    Vecres(Order)=res;
    %clc
end
toc
figure
plot(Vecres(levels))
end

