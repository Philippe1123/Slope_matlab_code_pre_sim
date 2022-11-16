function [ output_args ] = Ploter( input_args )
%PLOTER Summary of this function goes here
%   Detailed explanation goes here

% ar=[4 1 2 3 5 6 7 9 10 8 13 11 12 14 15 16 17 18 19 20 22 21 24 23 25 26 28 27 30 29 31 32 34 33 36 35 37] 
close all

%ar=[31,40,41,32,71,80,81,72,1,11,20,21,12,51,60,61,52,28,4,37,5,64,8,73,9,67,76,44,45,77,68,36,35,10,2,19,3,46,6,55,7,30,29,13,22,38,39,23,14,    15,16,17,18,24,25,26,27,33,34,42,43,47,48,49,50,53,54,56,57,58,59,62,63,65,66,69,70,74,75,78,79];
% ar=[13,11,12,15,16,14,1,4,2,3,27,28,31,30,29,26,21,22,25,24,23,20,10,8,9,6,7,5,33,34,37,36,35,32,18,19,17];


% ar=[13,11,12,15,16,14,1,4,2,3,27,28,31,30,29,26,21,22,25,24,23,20,10,8,9,6,7,5,33,34,37,36,35,32,18,19,17];%config for [ 7 16 28 37]
ar=[4,2,3,15,16,14,1,27,28,31,30,29,26,10,8,9,6,7,5,21,22,25,24,23,20,13,11,12,33,34,37,36,35,32,18,19,17];%config for [ 7 19 28 37]


x=gaussqtri(37)
 x=x(ar,:);
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













x=gaussqtri(7);
% vec=[5,6,7,4,2,3,1];%config for [ 7 16 28 37]
vec=[5,6,7,4,2,3,1];%config for [ 7 19 28 37]
x=x(vec,:);
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
x=GaussPoints_Global;

figure

figure
plot(t(1:7,1),t(1:7,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
xticks([-0.5:0.1:0.5])
set(gca,'xtick',[])
set(gca,'ytick',[])
axis equal
matlab2tikz('floatFormat','%.20f','Triag_0.tex')


% x=gaussqtri(16);
x=gaussqtri(19);

%             vec=[10,12,11,3,4,2,1,7,5,6,16,8,13,15,14,9];%config for [ 7 16 28 37]
             vec=[13,11,12,3,4,2,1,17,14,18,19,15,16,10,8,9,6,7,5];%config for [ 7 19 28 37]
x=x(vec,:);
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
x=GaussPoints_Global;

figure

figure
plot(t(1:19,1),t(1:19,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
xticks([-0.5:0.1:0.5])
set(gca,'xtick',[])
set(gca,'ytick',[])
axis equal
matlab2tikz('floatFormat','%.20f','Triag_1.tex')












x=gaussqtri(28);
%             vec=[7,5,6,9,10,8,1,4,2,3,20,17,21,22,18,19,26,23,27,28,24,25,13,11,12,15,16,14];%config for [ 7 16 28 37]
            vec=[4,2,3,9,10,8,1,20,17,21,22,18,19,13,11,12,15,16,14,26,23,27,28,24,25,7,5,6];%config for [ 7 19 28 37]
x=x(vec,:);

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
x=GaussPoints_Global;

figure

figure
plot(t(1:28,1),t(1:28,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
xticks([-0.5:0.1:0.5])
set(gca,'xtick',[])
set(gca,'ytick',[])
axis equal
matlab2tikz('floatFormat','%.20f','Triag_2.tex')















x=gaussqtri(37);
%             vec=[13,11,12,15,16,14,1,4,2,3,27,28,31,30,29,26,21,22,25,24,23,20,10,8,9,6,7,5,33,34,37,36,35,32,18,19,17];%config for [ 7 16 28 37]
vec=[4,2,3,15,16,14,1,27,28,31,30,29,26,10,8,9,6,7,5,21,22,25,24,23,20,13,11,12,33,34,37,36,35,32,18,19,17];%config for [ 7 19 28 37]
x=x(vec,:);

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
x=GaussPoints_Global;

figure

figure
plot(t(1:37,1),t(1:37,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
xticks([-0.5:0.1:0.5])
set(gca,'xtick',[])
set(gca,'ytick',[])
axis equal
matlab2tikz('floatFormat','%.20f','Triag_3.tex')

end

