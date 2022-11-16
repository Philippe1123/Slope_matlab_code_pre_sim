l0(x)=(1-x)/2;
l1(x)=(x+1)/2;
l2(x)=1/2*sqrt(3/2)*(x^2-1);
l3(x)=1/2*sqrt(5/2)*(x^2-1)*x;
l4(x)=1/8*sqrt(7/2)*(x^2-1)*(5*x^2-1);

%edge function 

e1=l3(xi)*l0(eta)

e2=l1(xi)*l3(eta)

e3=l3(xi)*l1(eta)

e4=l0(xi)*l3(eta)

e5=l0(xi)*l0(eta)

e6=l1(xi)*l0(eta)

e7=l1(xi)*l1(eta)

e8=l0(xi)*l1(eta)

e9=l3(xi)*l0(eta)

e10=l1(xi)*l3(eta)

e11=l3(xi)*l1(eta)

e12=l0(xi)*l3(eta)


%face function 3rd orde


f1=l2(xi)*l3(eta)
f2=l3(xi)*l2(eta)
f3=l3(xi)*l3(eta)

f4=l2(xi)*l0(eta)
f5=l3(xi)*l0(eta)
f6=l3(xi)*l0(eta)

f7=l1(xi)*l2(eta)
f8=l1(xi)*l3(eta)
f9=l1(xi)*l3(eta)

f10=l2(xi)*l1(eta)
f11=l3(xi)*l1(eta)
f12=l3(xi)*l1(eta)

f13=l0(xi)*l2(eta)
f14=l0(xi)*l3(eta)
f15=l0(xi)*l3(eta)

f16=l2(xi)*l3(eta)
f17=l3(xi)*l2(eta)
f18=l3(xi)*l3(eta)




% interior functions



% i1=l2(xi)*l2(eta)*l3(zeta)
% i2=l2(xi)*l3(eta)*l2(zeta)
% i3=l3(xi)*l2(eta)*l2(zeta)
% i4=l3(xi)*l3(eta)*l2(zeta)
% i5=l3(xi)*l2(eta)*l3(zeta)
% i6=l2(xi)*l3(eta)*l3(zeta)
% i7=l3(xi)*l3(eta)*l3(zeta)




%4th order edge

e13=l4(xi)*l0(eta);
				  
e14=l1(xi)*l4(eta);
				  
e15=l4(xi)*l1(eta);
				  
e16=l0(xi)*l4(eta);
				  
e17=l0(xi)*l0(eta);
				  
e18=l1(xi)*l0(eta);
				  
e19=l1(xi)*l1(eta);
				  
e20=l0(xi)*l1(eta);
				  
e21=l4(xi)*l0(eta);
				  
e22=l1(xi)*l4(eta);
				  
e23=l4(xi)*l1(eta);
				  
e24=l0(xi)*l4(eta);


%face 4th order


f19=l2(xi)*l4(eta);
f20=l3(xi)*l4(eta);
f21=l4(xi)*l2(eta);
f22=l4(xi)*l3(eta);
f23=l4(xi)*l4(eta);
				  
f24=l2(xi)*l0(eta);
f25=l3(xi)*l0(eta);
f26=l4(xi)*l0(eta);
f27=l4(xi)*l0(eta);
f28=l4(xi)*l0(eta);
				  
				  
f29=l1(xi)*l2(eta);
f30=l1(xi)*l3(eta);
f31=l1(xi)*l4(eta);
f32=l1(xi)*l4(eta);
f33=l1(xi)*l4(eta);
				  
				  
f34=l2(xi)*l1(eta);
f35=l3(xi)*l1(eta);
f36=l4(xi)*l1(eta);
f37=l4(xi)*l1(eta);
f38=l4(xi)*l1(eta);
				  
f39=l0(xi)*l2(eta);
f40=l0(xi)*l3(eta);
f41=l0(xi)*l4(eta);
f42=l0(xi)*l4(eta);
f43=l0(xi)*l4(eta);
				  
				  
f44=l2(xi)*l4(eta);
f45=l3(xi)*l4(eta);
f46=l4(xi)*l2(eta);
f47=l4(xi)*l3(eta)
f48=l4(xi)*l4(eta)




h1=(1-xi)/2*(1-eta)/2
h2=(xi+1)/2*(1-eta)/2
h3=(xi+1)/2*(eta+1)/2
h4=(1-xi)/2*(eta+1)/2
 
h5=1/2*sqrt(3/2)*(xi^2-1)*(1-eta)/2
h6=e1*1000000

h7=(xi+1)/2*1/2*sqrt(3/2)*(eta^2-1)
h8=e2*1000000

h9=1/2*sqrt(3/2)*(xi^2-1)*(eta+1)/2
h10=e3*1000000

h11=(1-xi)/2*1/2*sqrt(3/2)*(eta^2-1)
h12=e4*1000000

h13=1/2*sqrt(3/2)*(xi^2-1)*1/2*sqrt(3/2)*(eta^2-1)
h14=f1*1000000
h15=f2*1000000
h16=f3*1000000


h1=(1-xi)/2*(1-eta)/2;
h2=(xi+1)/2*(1-eta)/2;
h3=(xi+1)/2*(eta+1)/2;
h4=(1-xi)/2*(eta+1)/2;
 
h5=1/2*sqrt(3/2)*(xi^2-1)*(1-eta)/2
h6=e1*1000000;
h7=e13*1000000;

h8=(xi+1)/2*1/2*sqrt(3/2)*(eta^2-1)
h9=e2*1000000;
h10=e14*1000000;

h11=1/2*sqrt(3/2)*(xi^2-1)*(eta+1)/2;
h12=e3*1000000;
h13=e15*1000000;

h14=(1-xi)/2*1/2*sqrt(3/2)*(eta^2-1)
h15=e4*1000000;
h16=e16*1000000;

h17=1/2*sqrt(3/2)*(xi^2-1)*1/2*sqrt(3/2)*(eta^2-1)
h18=f1*1000000;
h19=f2*1000000;
h20=f3*1000000;
h21=f19*1000000;
h22=f20*1000000;
h23=f21*1000000;
h24=f22*1000000;
h25=f23*1000000;