function [ output_args ] = Ploter( input_args )
%PLOTER Summary of this function goes here
%   Detailed explanation goes here



ar=[9 61 8 35 28 38 39 30 29 44 16 58 15 1 46  45 10 43 42 5 27 56 4 57 26 3 37  51 2 52 36 22 53 23 19 40 41 7 59 17 6 18 60 25 54 14 13 55 24 12 50 33 11 34 49 20 47 32 21 31 48];
x=gaussqtri(61)
x=x(ar,:);
t=x;

figure
axis([-2 2 -2 2])
for i=1:length(ar)
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
for i=1:length(ar)
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


x=gaussqtri(16);
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
plot(t(1:16,1),t(1:16,2),'*b')
hold on
plot(x(:,1),x(:,2),'vr')
xticks([-0.5:0.1:0.5])
set(gca,'xtick',[])
set(gca,'ytick',[])
axis equal
matlab2tikz('floatFormat','%.20f','Triag_1.tex')












x=gaussqtri(28);
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

