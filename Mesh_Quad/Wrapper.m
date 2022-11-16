function [ output_args ] = Wrapper( input_args )
%WRAPPER Summary of this function goes here
%   Detailed explanation goes here
clc
clear all
close all
t=[];
res={};
s=tic;
 [res1 ] = Slope_Slover_JULIA_MATLAB_GlobalNested_Quad(1);
t(1)=toc(s); 
res{1}=res1;
save('res')
save('time')
s=tic;
 [res2 ] = Slope_Slover_JULIA_MATLAB_GlobalNested_Quad(2);
 t(2)=toc(s); 
  res{2}=res2;
save('res')
save('time')
 s=tic;
 [res3 ] = Slope_Slover_JULIA_MATLAB_GlobalNested_Quad(3);
  t(3)=toc(s); 
    res{3}=res3;
save('res')
save('time')
 s=tic;
 [res4 ] = Slope_Slover_JULIA_MATLAB_GlobalNested_Quad(4);
  t(4)=toc(s); 
    res{4}=res4;
save('res')
save('time')
s=tic;
 [res5 ] = Slope_Slover_JULIA_MATLAB_GlobalNested_Quad(5);
t(5)=toc(s); 
res{5}=res5;
save('res')
save('time')

end

