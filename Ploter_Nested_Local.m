function [ output_args ] = Ploter_Nested_Local( input_args )
%PLOTER Summary of this function goes here
%   Detailed explanation goes here

close all

ar=[7,16,10,15,11,1,9,6,13,12,8,14,5,2,3,4];
x=gaussqtri(16)
x=x(ar,:);
t=x;

x=gaussqtri(13);




figure
plot(t(1:13,1),t(1:13,2),'*b')
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
matlab2tikz('floatFormat','%.20f','Triag_10_Loc.tex')


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
matlab2tikz('floatFormat','%.20f','Triag_11_Loc.tex')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



ar=[13,17,19,10,5,16,6,1,9,12,18,7,8,14,15,11,2,3,4];
x=gaussqtri(19)
x=x(ar,:);
t=x;

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
matlab2tikz('floatFormat','%.20f','Triag_21_Loc.tex')


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
matlab2tikz('floatFormat','%.20f','Triag_22_Loc.tex')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




ar=[4,20,8,22,13,14,19,9,15,1,12,3,21,16,11,17,10,18,2,26,28,7,25,6,27,5,23,24];
x=gaussqtri(28)
x=x(ar,:);
t=x;

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
matlab2tikz('floatFormat','%.20f','Triag_32_Loc.tex')


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
matlab2tikz('floatFormat','%.20f','Triag_33_Loc.tex')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5




ar=[4,21,24,27,13,14,30,10,26,5,20,15,6,1,9,12,3,25,7,31,8,28,16,11,29,22,23,2,33,17,36,32,18,37,34,19,35];
x=gaussqtri(37)
x=x(ar,:);
t=x;

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
matlab2tikz('floatFormat','%.20f','Triag_43_Loc.tex')


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
matlab2tikz('floatFormat','%.20f','Triag_44_Loc.tex')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




ar=[9,7,18,2,25,12,1,10,3,37,34,11,29,28,6,46,43,38,35,30,8,17,24,39,44,33,50,52,36,42,45,49,55,51,59,60,61,4,16,13,27,22,20,19,31,5,21,14,23,15,40,32,26,47,41,48,53,57,54,58,56];
x=gaussqtri(61)
x=x(ar,:);
t=x;

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
matlab2tikz('floatFormat','%.20f','Triag_54_Loc.tex')


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
matlab2tikz('floatFormat','%.20f','Triag_55_Loc.tex')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




ar=[8,6,19,1,17,30,20,3,14,35,11,31,26,4,22,15,41,44,37,46,33,25,2,21,5,52,50,47,42,36,32,16,7,18,34,29,40,48,59,51,57,54,43,49,45,55,64,60,53,62,56,58,61,69,63,66,70,68,71,72,73,12,9,28,23,39,10,13,24,27,38,65,67];
x=gaussqtri(73)
x=x(ar,:);
t=x;

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
matlab2tikz('floatFormat','%.20f','Triag_65_Loc.tex')


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
matlab2tikz('floatFormat','%.20f','Triag_66_Loc.tex')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




ar=[29,49,61,52,82,85,67,64,20,88,103,73,17,106,70,1,97,109,102,78,4,14,76,112,72,114,7,66,40,108,90,54,3,6,9,15,18,21,30,80,50,86,10,104,39,62,8,110,68,111,75,13,5,74,38,113,2,69,105,16,41,77,107,87,19,63,71,89,81,51,65,53,28,55,58,26,79,31,23,43,91,37,34,115,42,118,94,46,48,121,36,96,124,126,100,11,120,84,60,12,24,27,56,116,99,122,123,92,32,125,44,98,45,93,117,101,119,33,95,47,22,35,83,25,57,59];
x=gaussqtri(126)
x=x(ar,:);
t=x;

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
matlab2tikz('floatFormat','%.20f','Triag_76_Loc.tex')


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
matlab2tikz('floatFormat','%.20f','Triag_77_Loc.tex')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





ar=[36,56,59,68,89,110,50,71,113,74,27,140,98,62,53,143,24,152,38,92,146,77,134,155,101,2,21,164,158,43,65,97,149,167,139,18,67,170,8,163,79,103,151,137,95,161,41,173,55,15,11,175,169,73,157,145,115,61,4,10,13,16,19,22,25,28,37,57,87,111,141,153,69,165,171,12,14,51,172,40,160,94,136,147,99,75,159,9,174,63,17,135,166,148,93,64,39,162,168,20,3,100,154,138,76,150,96,42,156,23,142,52,66,102,144,26,78,112,70,54,114,88,72,58,60,35,44,33,86,47,30,104,128,107,80,116,131,122,127,5,119,85,83,121,133,109,49,125,91,1,7,31,34,124,45,105,129,117,82,81,118,6,123,126,130,120,84,106,132,108,29,46,90,32,48];
x=gaussqtri(175)
x=x(ar,:);
t=x;

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
matlab2tikz('floatFormat','%.20f','Triag_87_Loc.tex')


x=gaussqtri(175);


figure
plot(t(1:175,1),t(1:175,2),'*b')
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
matlab2tikz('floatFormat','%.20f','Triag_88_Loc.tex')


end

