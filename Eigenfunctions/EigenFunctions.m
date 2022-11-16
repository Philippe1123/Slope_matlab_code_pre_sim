function [  ] = EigenFunctions(  )
%EIGENFUNCTIONS Summary of this function goes here
%   Detailed explanation goes here

close all



 PathNodes="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Points_Fine.txt";
 PathField="/home/philippe/Desktop/GMSH_Matlab_ReadIn/field_Fine.txt";
PathElements="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Elements_Fine.txt"

  Points = dlmread(PathNodes,' ');

 field = dlmread(PathField,' ');
  Elements = dlmread(PathElements,' ');

EigenfunNumber=1

for EigenfunNumber=1:10


PathRes_Fine_EigFun="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Eig_Fine_KL.txt"
  Eigs = dlmread(PathRes_Fine_EigFun);
figure('units','normalized','outerposition',[0 0 1 1])

trisurf(Elements,Points(:,1),Points(:,2), Eigs(:,EigenfunNumber));
string="EigenFunction-"+EigenfunNumber+"-KL";
string_save=char("EigenFunction-"+EigenfunNumber+"-KL.jpeg");
title(string)
view(2)

saveas(figure(1),string_save)


PathRes_Fine_EigFun="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Eig_Fine_Spec.txt"
  Eigs = dlmread(PathRes_Fine_EigFun);
figure('units','normalized','outerposition',[0 0 1 1])

trisurf(Elements,Points(:,1),Points(:,2), Eigs(:,EigenfunNumber));
string="EigenFunction-"+EigenfunNumber+"-Spectral";
string_save=char("EigenFunction-"+EigenfunNumber+"-Spectral.jpeg");

title(string)
view(2)
saveas(figure(2),string_save)
close all
end
end

