function [ output_args ] = QuadPoints_Revisited( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%%%%%%%%%% 7 from 16

[x,H]=gaussqtri(7);

r1=ones(length(x(:,1)),1);
r2=x(:,1);2;
r3=x(:,2);
r4=x(:,1).*x(:,2);
r5=x(:,1).^2;
r6=x(:,2).^2;
r7=x(:,1).^2.*x(:,2).^2
mat=[r1 r2 r3 r4 r5 r7 r6]';
res=mat*H;


[x,H]=gaussqtri(16);
x=x(1:7,:);
H=H(1:7,:);
r1=ones(length(x(:,1)),1);
r2=x(:,1);2;
r3=x(:,2);
r4=x(:,1).*x(:,2);
r5=x(:,1).^2;
r6=x(:,2).^2;
r7=x(:,1).^2.*x(:,2).^2;
mat=[r1 r2 r3 r4 r5 r7 r6]';

sol=mat\res;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 7 from 61


[x,H]=gaussqtri(7);

xi=x(:,1);
eta=x(:,2);

vec=[ ones(length(x(:,1)),1), xi, eta, xi.^2, eta.*xi, eta.^2,eta.^2.*xi.^2];
mat=vec';


res=mat*H;

[x,H]=gaussqtri(61);
x=[x(35,:);x(42,:);x(10,:);x(43,:);x(16,:);x(58,:);x(15,:)]
H=[H(35,:);H(42,:);H(10,:);H(43,:);H(16,:);H(58,:);H(15,:)]
xi=x(:,1);
eta=x(:,2);
vec=[ ones(length(x(:,1)),1), xi, eta, xi.^2, eta.*xi, eta.^2,eta.^2.*xi.^2];
vec=vec(:,1:7);
mat=vec';

sol=mat\res;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 7 from 61


[x,H]=gaussqtri(7);

xi=x(:,1);
eta=x(:,2);

vec=[ ones(length(x(:,1)),1), xi, eta, xi.^2, eta.*xi, eta.^2,eta.^2.*xi.^2];
mat=vec';


res=mat*H;

[x,H]=gaussqtri(61);
x=[x(35,:);x(42,:);x(10,:);x(43,:);x(16,:);x(58,:);x(15,:)]
H=[H(35,:);H(42,:);H(10,:);H(43,:);H(16,:);H(58,:);H(15,:)]
xi=x(:,1);
eta=x(:,2);
vec=[ ones(length(x(:,1)),1), xi, eta, xi.^2, eta.*xi, eta.^2,eta.^2.*xi.^2];
vec=vec(:,1:7);
mat=vec';

sol=mat\res;

%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10 or 13 from 19

% 
[x,H]=gaussqtri(16);

xi=x([1,2,3,4,10,8,9,7,5,6,11,15,14,13,16,12],1);
eta=x([1,2,3,4,10,8,9,7,5,6,11,15,14,13,16,12],2);
xi_1=xi;
eta_1=eta;
 H=H([1,2,3,4,10,8,9,7,5,6,11,15,14,13,16,12]);
vec=[  ones(length(x(:,1)),1), xi, eta,  eta.*xi,xi.^2, eta.^2, xi.^3, eta.*xi.^2, eta.^2.*xi, eta.^3, eta.*xi.^3, eta.^2.*xi.^2, eta.^3.*xi, eta.^2.*xi.^3, eta.^3.*xi.^2, eta.^3.*xi.^3];
mat=vec';
  mat=mat(1:16,1:16);
  H=H(1:16);
res=mat*H;

[x,H_1]=gaussqtri(19);
x=x([1,2,3,4,10,8,9,13,11,12,16,19,15,18,17,14],:);
% H=H([1,2,3,4,10,8,9,13,11,12,16,19,15,17,14,18]);
xi=x(:,1);
eta=x(:,2);
vec=[  ones(length(x(:,1)),1), xi, eta,  eta.*xi,xi.^2, eta.^2, xi.^3, eta.*xi.^2, eta.^2.*xi, eta.^3, eta.*xi.^3, eta.^2.*xi.^2, eta.^3.*xi, eta.^2.*xi.^3, eta.^3.*xi.^2, eta.^3.*xi.^3];
% vec=vec(:,1:7);
mat=vec';
  mat=mat(1:10,1:10);
% res=mat*H;
sol=mat\res(1:10);

%%%%%%%%%%%%%
close all
figure
[x,H]=gaussqtri(16);

x=x([1,2,3,4,10,8,9,7,5,6,11,15,14,13,16,12],:);
    for i=1:length(x)
        hold on
        
        plot(x(i,1),x(i,2),'*r')
        text(x(i,1),x(i,2),num2str((i)))
        hold on        
        
        i=i+1;
        
    end
[x,H]=gaussqtri(19);
x=x([1,2,3,4,10,8,9,13,11,12,16,19,15,18,17,14],:);
        for i=1:length(x)
        hold on
        
        plot(x(i,1),x(i,2),'*b')
        text(x(i,1),x(i,2),num2str((i)))
        hold on        
        
        i=i+1;
        
    end
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 19 from 28
clc
[x,H]=gaussqtri(19);

xi=x([1 2 3 4 7 5 6 12 13 11 10 8 9 16 19 15 18 17 14],1);
eta=x([1 2 3 4 7 5 6 12 13 11 10 8 9 16 19 15 18 17 14],2);
xi_1=xi;
eta_1=eta;
 H=H([1 2 3 4 7 5 6 12 13 11 10 8 9 16 19 15 18 17 14]);
vec=[  ones(length(x(:,1)),1), xi, eta,  eta.*xi,xi.^2, eta.^2, xi.^3, eta.*xi.^2, eta.^2.*xi, eta.^3, eta.*xi.^3, eta.^2.*xi.^2, eta.^3.*xi, eta.^2.*xi.^3, eta.^3.*xi.^2, eta.^3.*xi.^3,eta.^2.*xi.^4, eta.^4.*xi.^2, eta.^4.*xi.^4];
mat=vec';
   mat=mat(1:19,1:19);
   H=H(1:19);
res=mat*H;

[x,H_1]=gaussqtri(28);
x=x([1 8 9 10 16 14 15 3 4 2 13 11 12 19 22 18 21 20 17],:);
% H=H([1,2,3,4,10,8,9,13,11,12,16,19,15,17,14,18]);
xi=x(:,1);
eta=x(:,2);
vec=[  ones(length(x(:,1)),1), xi, eta,  eta.*xi,xi.^2, eta.^2, xi.^3, eta.*xi.^2, eta.^2.*xi, eta.^3, eta.*xi.^3, eta.^2.*xi.^2, eta.^3.*xi, eta.^2.*xi.^3, eta.^3.*xi.^2, eta.^3.*xi.^3];
% vec=vec(:,1:7);
mat=vec';
   mat=mat(1:13,1:13);
% res=mat*H;
sol=mat\res(1:13);

%%%%%%%%%%%%%%%%%%%%%%%%%%%55

[x,H]=gaussqtri(19);

 x=x([1 2 3 4 7 5 6 12 13 11 10 8 9 16 19 15 18 17 14],:);
    for i=1:length(x)
        hold on
        
        plot(x(i,1),x(i,2),'*r')
        text(x(i,1),x(i,2),num2str((i)))
        hold on        
        
        i=i+1;
        
    end
[x,H]=gaussqtri(28);
 x=x([1 8 9 10 16 14 15 3 4 2 13 11 12 19 22 18 21 20 17],:);
        for i=1:length(x)
        hold on
        
        plot(x(i,1),x(i,2),'*b')
        text(x(i,1),x(i,2),num2str((i)))
        hold on        
        
        i=i+1;
        
    end

end

