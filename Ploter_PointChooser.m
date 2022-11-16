function [ output_args ] = Ploter( input_args )
%PLOTER Summary of this function goes here
%   Detailed explanation goes here

 close all
array90d={};


% 
% arr=[ 7 16 28 37];
% x=gaussqtri(37);


 arr=[28 37];

% arr=[19 25];


x_master=gaussqtri(arr(end));
x=x_master;

% x=x(ar,:);
t=x';

% [s,srtpost]=sort(t(:,1),'Ascend');
% t(:,1:2)=t(srtpost,1:2);




GaussPoints_Local=[t;ones(1,length(t))];
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
x=t;




% for fg=4:-1:1
for fg=length(arr):-1:1

x_l=gaussqtri(arr(fg))';


GaussPoints_Local=[x_l;ones(1,length(x_l))];
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

% [s,srtpost]=sort(x_l(:,1),'Ascend');
% x_l(:,1:2)=x_l(srtpost,1:2);


dist=[];
% t(:,1)=t(:,1)-0.01
srt=[];
for id=1:length(t)
    
    for ix=1:length(x_l)
        
     dist(ix,id)=sqrt((t(id,1)-x_l(ix,1))^2+(t(id,2)-x_l(ix,2))^2);
        
        
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
t=t(srt,:);

t=sortrows(t,[1 2]);
x_l=sortrows(x_l,[1 2]);



for i=1:length(t)
plot(t(i,1),t(i,2),'*b')
text(t(i,1),t(i,2),num2str((i)))

 plot(x_l(i,1),x_l(i,2),'vr')
 text(x_l(i,1),x_l(i,2),num2str((i)))


i=i+1;    
    
end
axis([-0.5 0.5 -0.2887 0.5773]);

postnul_X=find(t(:,1)<10^-3 & t(:,1)>-10^-3);
t(postnul_X,1)=0;

postnul_Y=find(t(:,2)<10^-3 & t(:,2)>-10^-3);
t(postnul_Y,2)=0;

postnul_X=find(x(:,1)<10^-3 & x(:,1)>-10^-3);
x(postnul_X,1)=0;

postnul_Y=find(x(:,2)<10^-3 & x(:,2)>-10^-3);
x(postnul_Y,2)=0;

% 
% 
x_l_90_d=[];
x_l_n=t(t(:,1)<=0.001,:)
x_l_n_2=x_l_n(x_l_n(:,2)<=0.15,:)
mat=[cos(pi/3*2) -sin(pi/3*2) ; sin(pi/3*2) cos(pi/3*2)];
op=1;
 figure
 hold on
postsrtarray=[];
for j=1:length(x_l_n_2)
   x_l_90_d(op,:)= x_l_n_2(j,:);
   pt=x_l_90_d(op,:)';
   
   pos=(pt'==x);
    
    sumpos=sum(pos,2);
    
    posit=find(sumpos==2);
    if(~ismember(posit,postsrtarray))


     postsrtarray(op)=posit;
   
    plot(pt(1,:),pt(2,:),'rv')
   op=op+1;
    end
   for k=1:2
    pt_prev=pt;   
    pt=mat*pt;
    pt_o=pt;
    pt_x=interp1(unique(t(:,1)),unique(t(:,1)),pt(1),'nearest','extrap');
    pt_y=interp1(unique(t(:,2)),unique(t(:,2)),pt(2),'nearest','extrap');
    
    
    pt=[pt_x;pt_y];
    
    pos=(pt'==x);
    
    sumpos=sum(pos,2);
    
    posit=find(sumpos==2);
    
    if(isempty(posit))
    sumpos=sum(pos,2);
%     posit=find(sumpos==1);

       
       
       
       for idd=1:length(t)
    
    
        
     dist_pt(idd)=sqrt((x(idd,1)-pt_o(1))^2+(x(idd,2)-pt_o(2))^2);
        
        
   
       
    
end
       
       
       
      [value,position]=min(dist_pt); 
       
       posit=position;
       
       
       
       
       
    end
    
if(~ismember(posit,postsrtarray))
     postsrtarray(op)=posit;
     pt=x(posit,:)';
    ss=sum(pt_prev == pt);
    if(ss~=2)
      plot(pt(1,:),pt(2,:),'r*')
     x_l_90_d(op,:)= pt';
     op=op+1;
    end
end
   end
    
end
array90d{fg}=postsrtarray;

tt=x(postsrtarray,:);
figure
hold on
for i=1:length(tt)
plot(tt(i,1),tt(i,2),'*b')
text(tt(i,1),tt(i,2),num2str((i)))

%  plot(x_l(i,1),x_l(i,2),'vr')
%  text(x_l(i,1),x_l(i,2),num2str((i)))


i=i+1;    
    
end



end






arrayfinal90d=[];

for iu=1:length(arr)
 
 if(iu==1)   
arrayfinal90d=array90d{iu};

 else
     
  [diff,pos]=setdiff(array90d{iu},arrayfinal90d,'stable');
  arrayfinal90d=[arrayfinal90d array90d{iu}(pos)];
  
  
     
     
 end
    
    
    
    
    
end

vec=arr;
% vec=[7 13  19 25 28 33 37 61 73];
x=x_master;





x_sortdor=x(arrayfinal90d,:);
for hj=1:length(vec)
 y=gaussqtri(vec(hj));
 y=sortrows(y,[1 2]);

x_sortd=x_sortdor(1:vec(hj),:);
figure
hold on
for i=1:length(x_sortd)
plot(x_sortd(i,1),x_sortd(i,2),'*b')
text(x_sortd(i,1),x_sortd(i,2),num2str((i)))

%   plot(y(i,1),y(i,2),'vr')
%   text(y(i,1),y(i,2),num2str((i)))


i=i+1;    
    
end

end













x=x_master;
x_sortdor=x(arrayfinal90d,:);
sortgp={};
for fg=1:length(vec)
t=x_sortdor(1:arr(fg),:);
x_l=gaussqtri(arr(fg));

% [s,srtpost]=sort(x_l(:,1),'Ascend');
% x_l(:,1:2)=x_l(srtpost,1:2);


dist=[];
% t(:,1)=t(:,1)-0.01
srt=[];
for id=1:length(t)
    
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




sortgp{fg}=srt;



end

% close all




vec=arr;
x=x_master;



x_sortdor=x(arrayfinal90d,:);
for hj=1:length(vec)
x_l=gaussqtri(vec(hj));
x_l=x_l(sortgp{hj},:);
x_sortd=x_sortdor(1:vec(hj),:);
figure
hold on
for i=1:length(x_sortd)
% plot(x_sortd(i,1),x_sortd(i,2),'*b')
% text(x_sortd(i,1),x_sortd(i,2),num2str((i)))

   plot(x_l(i,1),x_l(i,2),'vr')
   text(x_l(i,1),x_l(i,2),num2str((i)))


i=i+1;    
    
end

figure
for i=1:length(x_l)
hold on
    
plot(x_sortd(i,1),x_sortd(i,2),'*b')
text(x_sortd(i,1),x_sortd(i,2),num2str((i)))
hold on
   plot(x_l(i,1),x_l(i,2),'vr')
   text(x_l(i,1),x_l(i,2),num2str((i)))


i=i+1;    
    
end

end





end
