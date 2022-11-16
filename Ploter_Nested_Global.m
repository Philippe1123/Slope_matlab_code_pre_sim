function [ output_args ] = Ploter( input_args )
%PLOTER Summary of this function goes here
%   Detailed explanation goes here



ar=[29,61,17,70,4,66,6,18,30,10,68,5,69,16,71,28,1,3,2,64,73,78,14,15,62,13,63,65,109,102,112,114,40,110,111,113,41,49,52,82,103,106,76,7,108,54,9,80,50,104,39,8,75,74,38,105,77,107,81,51,53,85,67,20,88,97,72,90,21,86,87,19,89,55,58,26,79,31,23,43,91,37,34,115,42,118,94,46,48,121,36,96,124,126,100,11,120,84,60,12,24,27,56,116,99,122,123,92,32,125,44,98,45,93,117,101,119,33,95,47,22,35,83,25,57,59];
x=gaussqtri(126)
x=x(ar,:);
t=x;

% x=gaussqtri(13);
% 
% 
% 
% 
% figure
% plot(t(1:13,1),t(1:13,2),'*b')
% hold on
% plot(x(:,1),x(:,2),'vr')
% x=[ 0 1]
% y=[ 0 0]
% plot(x,y,'--k','linewidth',2.0)
%  x=[ 0 0]
% y=[ 0 1]
% plot(x,y,'--k','linewidth',2.0)
%  x=[ 0 1]
% y=[ 1 0]
% plot(x,y,'--k','linewidth',2.0)
% axis equal
% 
% axis([-0.001 1.001 -0.001 1.001])
% xticks([0:0.1:1])
% matlab2tikz('floatFormat','%.20f','Triag_0_Glob.tex')


x=gaussqtri(16);


figure
plot(t(1:16,1),t(1:16,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
x=[ 0 1]
y=[ 0 0]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 0]
y=[ 0 1]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 1]
y=[ 1 0]
plot(x,y,'--k','linewidth',2.0)
axis equal

axis([-0.001 1.001 -0.001 1.001])
xticks([0:0.1:1])
matlab2tikz('floatFormat','%.20f','Triag_1_Glob.tex')












x=gaussqtri(19);


figure
plot(t(1:19,1),t(1:19,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
x=[ 0 1]
y=[ 0 0]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 0]
y=[ 0 1]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 1]
y=[ 1 0]
plot(x,y,'--k','linewidth',2.0)
axis equal

axis([-0.001 1.001 -0.001 1.001])
xticks([0:0.1:1])
matlab2tikz('floatFormat','%.20f','Triag_2_Glob.tex')















x=gaussqtri(28);

figure
plot(t(1:28,1),t(1:28,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
x=[ 0 1]
y=[ 0 0]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 0]
y=[ 0 1]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 1]
y=[ 1 0]
plot(x,y,'--k','linewidth',2.0)
axis equal

axis([-0.001 1.001 -0.001 1.001])
xticks([0:0.1:1])
matlab2tikz('floatFormat','%.20f','Triag_3_Glob.tex')


x=gaussqtri(37);

figure
plot(t(1:37,1),t(1:37,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
x=[ 0 1]
y=[ 0 0]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 0]
y=[ 0 1]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 1]
y=[ 1 0]
plot(x,y,'--k','linewidth',2.0)
axis equal

axis([-0.001 1.001 -0.001 1.001])
xticks([0:0.1:1])
matlab2tikz('floatFormat','%.20f','Triag_4_Glob.tex')


x=gaussqtri(61);

figure
plot(t(1:61,1),t(1:61,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
x=[ 0 1]
y=[ 0 0]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 0]
y=[ 0 1]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 1]
y=[ 1 0]
plot(x,y,'--k','linewidth',2.0)
axis equal

axis([-0.001 1.001 -0.001 1.001])
xticks([0:0.1:1])
matlab2tikz('floatFormat','%.20f','Triag_5_Glob.tex')


x=gaussqtri(73);

figure
plot(t(1:73,1),t(1:73,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
x=[ 0 1]
y=[ 0 0]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 0]
y=[ 0 1]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 1]
y=[ 1 0]
plot(x,y,'--k','linewidth',2.0)
axis equal

axis([-0.001 1.001 -0.001 1.001])
xticks([0:0.1:1])
matlab2tikz('floatFormat','%.20f','Triag_6_Glob.tex')


x=gaussqtri(126);

figure
plot(t(1:126,1),t(1:126,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
x=[ 0 1]
y=[ 0 0]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 0]
y=[ 0 1]
plot(x,y,'--k','linewidth',2.0)
 x=[ 0 1]
y=[ 1 0]
plot(x,y,'--k','linewidth',2.0)
axis equal

axis([-0.001 1.001 -0.001 1.001])
xticks([0:0.1:1])
matlab2tikz('floatFormat','%.20f','Triag_7_Glob.tex')

% x=gaussqtri(175);
% 
% figure
% plot(t(1:175,1),t(1:175,2),'*b')
% hold on
% plot(x(:,1),x(:,2),'vr')
% x=[ 0 1]
% y=[ 0 0]
% plot(x,y,'--k','linewidth',2.0)
%  x=[ 0 0]
% y=[ 0 1]
% plot(x,y,'--k','linewidth',2.0)
%  x=[ 0 1]
% y=[ 1 0]
% plot(x,y,'--k','linewidth',2.0)
% axis equal
% 
% axis([-0.001 1.001 -0.001 1.001])
% xticks([0:0.1:1])
% matlab2tikz('floatFormat','%.20f','Triag_8_Glob.tex')

end

