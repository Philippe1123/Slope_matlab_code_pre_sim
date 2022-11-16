function [ output_args ] = Demo_Stefan( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

x=[35 61 8 9 28 38 39 44 30 29 15 58 16 1 46 45 10 43 42 19 41 40 22 23 53 18 60 6 7 17 57 4 27 52 56 5 26 ];
x_2=[2,3,11,12,13,14,20,21,24,25,31,32,33,34,36,37,47,48,49,50,51,54,55,59];
x=[x x_2];
pt=gaussqtri(61);
x_pt=pt(x,:);
NumberOfGaussPoints=[0 7 16 28 37 61];

numberoflevels=5;
figure

plot([0 1],[1 0],'b-')
hold on
plot([0 1],[0 0],'b-')
plot([0 0],[0 1],'b-')
plot(x_pt([3 15],1),x_pt([3 15],2),'r-')
plot(x_pt([2 14],1),x_pt([2 14],2),'r-')
plot(x_pt([4 16],1),x_pt([4 16],2),'r-')
plot([0.5 0],[0 1],'r-')

for id=1:numberoflevels


x=x_pt(NumberOfGaussPoints(id)+1:NumberOfGaussPoints(id+1),:);

x=x';
plot(x(1,:),x(2,:),'*');
hold on

end

end

