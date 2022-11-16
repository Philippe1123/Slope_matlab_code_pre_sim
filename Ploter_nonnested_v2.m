sortfunction [ output_args ] = Ploter( input_args )
%PLOTER Summary of this function goes here
%   Detailed explanation goes here

% ar=[4 1 2 3 5 6 7 9 10 8 13 11 12 14 15 16 17 18 19 20 22 21 24 23 25 26 28 27 30 29 31 32 34 33 36 35 37] 
close all


x=gaussqtri(37)
t=x;

figure
axis([-2 2 -2 2])
for i=1:37
plot(t(i,1),t(i,2),'r.','linewidth',5.0)
text(t(i,1),t(i,2),num2str((i)))
i=i+1;
hold on;
end
axis([-0.01 1.01 -0.01 1.01])

x=x';

GaussPoints_Local=[x;ones(1,length(x))];
TriangleCoordLocal=[[0;0;1],[1;0;1],[0;1;1]];
GaussPointsCoord=[];
Nodes=[0 0 ; 1 0 ; 0.5 0.866];
Nodes=[-.5 -.2887 ; 0.5 -0.2887 ; 0 0.5779];

for idx=1:1
    
  TriangleVertices=Nodes;
  TriangleVertices=TriangleVertices';
  TriangleVertices=[TriangleVertices;[1 1 1]];  
  TransformationMatrix=TriangleVertices*inv(TriangleCoordLocal);
  GaussPoints_Global=TransformationMatrix*GaussPoints_Local;

end
GaussPoints_Global=GaussPoints_Global(1:2,:);
GaussPoints_Global=GaussPoints_Global';
t=GaussPoints_Global;

figure
axis([-2 2 -2 2])
for i=1:37
plot(t(i,1),t(i,2),'r.','linewidth',5.0)
text(t(i,1),t(i,2),num2str((i)))
i=i+1;
hold on;
end
xticks([-0.5:0.1:0.5])
axis equal
x=[-0.5 0.5]
y=[-0.2887 -0.2887]
plot(x,y,'--k','linewidth',2.0)
 x=[-0.5 0]
y=[-0.2887 0.5773]
plot(x,y,'--k','linewidth',2.0)

 x=[ 0 0.5]
y=[ 0.5773 -0.2887]
plot(x,y,'--k','linewidth',2.0)













x=gaussqtri(13);





figure
plot(x(1:13,1),x(1:13,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
% xticks([-0.5:0.1:0.5])
% set(gca,'xtick',[])
% set(gca,'ytick',[])
axis equal

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

xticks([0:0.1:1])
axis([-0.001 1.001 -0.001 1.001])


matlab2tikz('floatFormat','%.20f','Triag_0_nn.tex')





x=gaussqtri(16);

figure
plot(x(1:16,1),x(1:16,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
axis equal

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


matlab2tikz('floatFormat','%.20f','Triag_1_nn.tex')












x=gaussqtri(19);





figure
plot(x(1:19,1),x(1:19,2),'*b')
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

matlab2tikz('floatFormat','%.20f','Triag_2_nn.tex')















x=gaussqtri(28);





figure
plot(x(1:28,1),x(1:28,2),'*b')
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

matlab2tikz('floatFormat','%.20f','Triag_3_nn.tex')


x=gaussqtri(37);



figure
plot(x(1:37,1),x(1:37,2),'*b')
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

matlab2tikz('floatFormat','%.20f','Triag_4_nn.tex')







x=gaussqtri(61);



figure
plot(x(1:61,1),x(1:61,2),'*b')
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

matlab2tikz('floatFormat','%.20f','Triag_5_nn.tex')










x=gaussqtri(73);



figure
plot(x(1:73,1),x(1:73,2),'*b')
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

matlab2tikz('floatFormat','%.20f','Triag_6_nn.tex')






x=gaussqtri(126);



figure
plot(x(1:126,1),x(1:126,2),'*b')
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

matlab2tikz('floatFormat','%.20f','Triag_7_nn.tex')





x=gaussqtri(175);



figure
plot(x(1:175,1),x(1:175,2),'*b')
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

matlab2tikz('floatFormat','%.20f','Triag_8_nn.tex')

end

