function [  ] = GenerateField(  )

close all





 PathNodes="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Points_Fine.txt";
 PathField="/home/philippe/Desktop/GMSH_Matlab_ReadIn/field_Fine.txt";
PathElements="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Elements_Fine.txt"

  Points = dlmread(PathNodes,' ');

 field = dlmread(PathField,' ');
  Elements = dlmread(PathElements,' ');




 

figure(1)
hold on

trisurf(Elements,Points(:,1),Points(:,2), exp(field));
% hold on
% stem3(Points(:,1),Points(:,2),field,'r')





 PathNodes="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Points_Coarse.txt";
 PathField="/home/philippe/Desktop/GMSH_Matlab_ReadIn/field_Coarse.txt";
PathElements="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Elements_Coarse.txt"

  Points = dlmread(PathNodes,' ');

 field = dlmread(PathField,' ');
  Elements = dlmread(PathElements,' ');
  
  
  figure(2)
hold on

trisurf(Elements,Points(:,1),Points(:,2), exp(field));
% hold on
% stem3(Points(:,1),Points(:,2),field,'r')



 PathNodes="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Points.txt";
 PathField="/home/philippe/Desktop/GMSH_Matlab_ReadIn/field.txt";
PathElements="/home/philippe/Desktop/GMSH_Matlab_ReadIn/Elements.txt"

  Points = dlmread(PathNodes,' ');

 field = dlmread(PathField,' ');
  Elements = dlmread(PathElements,' ');




 

figure(3)
hold on

trisurf(Elements,Points(:,1),Points(:,2), abs(field)*1000);
end

