function [ output_args ] = Plotter_GaussSorter( input_args )
%PLOTTER_GAUSSSORTER Summary of this function goes here
%   Detailed explanation goes here


ar=[4 2 3 1 5 6 7 9 10 8 13 11 12 14 15 16 17 18 19 20 24 23 21 22 25 26 30 29 27 28 31 32 36 35 33 34 37] 
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
plot(t(:,1),t(:,2),'*')



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
x_l=GaussPoints_Global;




dist=[];
srt=[];
for id=1:length(x_l)
    
    for ix=1:length(x_l)
        
     dist(id,ix)=sqrt((t(id,1)-x_l(ix,1))^2+(t(id,2)-x_l(ix,2))^2);
        
        
    end
    
    
end





srt=[];
    
    for ix=1:length(x_l)
        
        added=false;
      while(added==false)  
     [val,minpos]=min(dist(ix,:));
     
     [srttd,psrrtd]=sort(dist(ix,:),'Ascend');
     numberofmin=sum(srttd==val);
     
     if(numberofmin==1)
         q=1;
     else
         h=1
      dist(:,psrrtd(2))=   dist(:,psrrtd(2))-srttd(2);

     end
     
     
     
     if(~ismember(minpos,srt))
         srt(ix)=minpos;
         added=true;
     else
      dist(ix,minpos)=   dist(ix,minpos)+minpos;
         
     end
    end
    end
    
    
    
    
    figure
hold on
x=t;
t=x_l(srt,:);

for i=1:length(t)
plot(t(i,1),t(i,2),'vr')
text(t(i,1),t(i,2),num2str((i)))

 plot(x(i,1),x(i,2),'*b')
 text(x(i,1),x(i,2),num2str((i)))


i=i+1;    
    
end

end

