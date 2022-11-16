function [ output_args ] = Patch( input_args )

%  close all


Nodes=dlmread("p_ref/Matlab/Nodes_L_0.txt");

Elements=dlmread("p_ref/Matlab/Elements_L_0.txt");
     EltOpts.bendingmodes=0;     
Types = {1 'plane9' EltOpts};
Materials=[1 210e6 1/3 7500];
Sections=[1 1 1];

figure
plotelem(Nodes,Elements,Types)
hold on
plotnodes(Nodes)


DOF=getdof(Elements,Types);


DOF=removedof(DOF,find(Nodes(:,2)==0)+0.01);
DOF=removedof(DOF,find(Nodes(:,3)==0)+0.02);

N=find(Nodes(:,2)==2);
P=nodalvalues(DOF,N+0.01,ones(length(N),1));

[K] = asmkm(Nodes,Elements,Types,Sections,Materials,DOF);          

U=K\P;

figure
plotdisp(Nodes,Elements,Types,DOF,U)

end

