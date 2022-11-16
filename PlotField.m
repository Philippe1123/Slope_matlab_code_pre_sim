function [ output_args ] = PlotField( )
%PLOTFIELD Summary of this function goes here
%   Detailed explanation goes here
close all
clc
clear all

%% Save nodes and elements


for id=0:3
 
 

%%%%Field Read In
 PathNodes="/home/philippe/Desktop/Slope_Matlab/Mesh_Steep_8/h_ref/Matlab/Nodes_L_"+id+".txt";
 PathElements="/home/philippe/Desktop/Slope_Matlab/Mesh_Steep_8/h_ref/Matlab/Elements_L_"+id+".txt";
Field="/home/philippe/Desktop/Slope_Matlab/Mesh_Steep_8/h_ref/Matlab/Res_L_"+id+".txt";

 Elements=dlmread(PathElements);
 Nodes=dlmread(PathNodes);
Field=dlmread(Field);

 
 figure
 trisurf(Elements(:,5:7),Nodes(:,2),Nodes(:,3), Field);
 view(2)
 Name=char("level"+id);
 Plot2LaTeX(figure(id+1),Name)
end
%figure
%stem3(centers_coord(:,1),centers_coord(:,2),c_centers,'r')

end

