function [ output_args ] = ReReadC_Centers( input_args )
%REREADC_CENTERS Summary of this function goes here
%   Detailed explanation goes here

str_folder="/home/philippe/Desktop/Slope_Matlab/Reshuffel_Centers/";

level0=dlmread(strcat(str_folder,"ElementsCenter_L_0.txt"));
level1=dlmread(strcat(str_folder,"ElementsCenter_L_1.txt"));
level2=dlmread(strcat(str_folder,"ElementsCenter_L_2.txt"));
level3=dlmread(strcat(str_folder,"ElementsCenter_L_3.txt"));


figure

t=level0
for i=1:length(t)
plot(t(i,1),t(i,2),'r.','linewidth',5.0)
text(t(i,1),t(i,2),num2str((i)))
i=i+1;
hold on;
end
% axis([-0.01 1.01 -0.01 1.01])
t=level1
hold on
for i=1:length(t)
plot(t(i,1),t(i,2),'r*','linewidth',5.0)
text(t(i,1),t(i,2),num2str((i)))
i=i+1;
hold on;
end




end

