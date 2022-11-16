function [ output_args ] = Hierarch_Legendre( input_args )
%HIERARCH_LEGENDRE Summary of this function goes here
%   Detailed explanation goes here

syms xi eta

pt=[-1:0.1:1];

[xi,eta]=meshgrid(pt);
phi_2_xi=xi^2/2-1/2
phi_2_eta=eta^2/2-1/2

phi_3_xi=5*xi^4/8-3*xi^2/4+1/8
phi_3_eta=5*eta^4/8-3*eta^2/4+1/8

% N1_h=1/4*(1-xi)*(1-eta);
% N2_h=1/4*(1+xi)*(1-eta);
% N3_h=1/4*(1+xi)*(1+eta);
% N4_h=1/4*(1-xi)*(1+eta);
% 
% 
% N5_h=1/2*(1-eta)*phi_2_xi
% N6_h=1/2*(1+xi)*phi_2_eta
% N7_h=1/2*(1+eta)*phi_2_xi
% N8_h=1/2*(1-xi)*phi_2_eta
% N9_h=phi_2_eta*phi_2_xi
% 
% 
% N10_h=1/2*(1-eta)*phi_3_xi
% N11_h=1/2*(1+xi)*phi_3_eta
% N12_h=1/2*(1+eta)*phi_3_xi
% N13_h=1/2*(1-xi)*phi_3_eta
% N14_h=phi_2_xi*phi_3_eta
% N15_h=phi_2_eta*phi_3_xi
% N16_h=phi_3_eta*phi_3_xi

phi_2_xi=xi.^2./2-1./2
phi_2_eta=eta.^2./2-1./2

phi_3_xi=5.*xi.^4./8-3.*xi.^2./4+1./8
phi_3_eta=5.*eta.^4./8-3.*eta.^2./4+1./8

N1_h=1./4.*(1-xi).*(1-eta);
N2_h=1./4.*(1+xi).*(1-eta);
N3_h=1./4.*(1+xi).*(1+eta);
N4_h=1./4.*(1-xi).*(1+eta);


N5_h=1./2.*(1-eta).*phi_2_xi*100000000
N6_h=1./2.*(1+xi).*phi_2_eta*100000000
N7_h=1./2.*(1+eta).*phi_2_xi*100000000
N8_h=1./2.*(1-xi).*phi_2_eta*100000000

N9_h=phi_2_eta.*phi_2_xi*100000000


N10_h=1./2.*(1-eta).*phi_3_xi*100000000
N11_h=1./2.*(1+xi).*phi_3_eta*100000000
N12_h=1./2.*(1+eta).*phi_3_xi*100000000
N13_h=1./2.*(1-xi).*phi_3_eta*100000000

N14_h=phi_2_xi.*phi_3_eta*100000000
N15_h=phi_2_eta.*phi_3_xi*100000000
N16_h=phi_3_eta.*phi_3_xi*100000000









%%%quadratic



phi_2_xi=xi.^2./2-1./2
phi_2_eta=eta.^2./2-1./2

phi_3_xi=5.*xi.^4./8-3.*xi.^2./4+1./8
phi_3_eta=5.*eta.^4./8-3.*eta.^2./4+1./8

N1_h=1./4.*(1-xi).*(1-eta);
N2_h=1./4.*(1+xi).*(1-eta);
N3_h=1./4.*(1+xi).*(1+eta);
N4_h=1./4.*(1-xi).*(1+eta);


N5_h=1./2.*(1-eta).*phi_2_xi*0.1

N6_h=1./2.*(1+xi).*phi_2_eta*0.1


N7_h=1./2.*(1+eta).*phi_2_xi*0.1


N8_h=1./2.*(1-xi).*phi_2_eta*0.1

N9_h=phi_2_eta.*phi_2_xi*0.1




%%%%%%%%%%%%%%%% cubic


phi_2_xi=xi.^2./2-1./2
phi_2_eta=eta.^2./2-1./2

phi_3_xi=5.*xi.^4./8-3.*xi.^2./4+1./8
phi_3_eta=5.*eta.^4./8-3.*eta.^2./4+1./8

N1_h=1./4.*(1-xi).*(1-eta);
N2_h=1./4.*(1+xi).*(1-eta);
N3_h=1./4.*(1+xi).*(1+eta);
N4_h=1./4.*(1-xi).*(1+eta);


N5_h=1./2.*(1-eta).*phi_2_xi*0.1
N6_h=1./2.*(1-eta).*phi_3_xi*1000000

N7_h=1./2.*(1+xi).*phi_2_eta*0.1
N8_h=1./2.*(1+xi).*phi_3_eta*1000000


N9_h=1./2.*(1+eta).*phi_2_xi*0.1
N10_h=1./2.*(1+eta).*phi_3_xi*1000000


N11_h=1./2.*(1-xi).*phi_2_eta*0.1
N12_h=1./2.*(1-xi).*phi_3_eta*1000000

N13_h=phi_2_eta.*phi_2_xi*0.1
N14_h=phi_2_xi.*phi_3_eta*1000000
N15_h=phi_2_eta.*phi_3_xi*1000000
N16_h=phi_3_eta.*phi_3_xi*1000000

figure
subplot(4,4,1)
surf(xi,eta,N1_h)

subplot(4,4,2)
surf(xi,eta,N2_h)
    
subplot(4,4,3)
surf(xi,eta,N3_h)
    
subplot(4,4,4)
surf(xi,eta,N4_h)

subplot(4,4,5)
surf(xi,eta,N5_h)

subplot(4,4,6)
surf(xi,eta,N6_h)

subplot(4,4,7)
surf(xi,eta,N7_h)

subplot(4,4,8)
surf(xi,eta,N8_h)

subplot(4,4,9)
surf(xi,eta,N9_h)

subplot(4,4,10)
surf(xi,eta,N10_h)
subplot(4,4,11)
surf(xi,eta,N11_h)
subplot(4,4,12)
surf(xi,eta,N12_h)
subplot(4,4,13)

surf(xi,eta,N13_h)
subplot(4,4,14)

surf(xi,eta,N14_h)
subplot(4,4,15)

surf(xi,eta,N15_h)
subplot(4,4,16)

surf(xi,eta,N16_h)



%%%%%%%%%%%%%%%% quadratric


phi_2_xi=xi.^2./2-1./2
phi_2_eta=eta.^2./2-1./2

phi_3_xi=5.*xi.^4./8-3.*xi.^2./4+1./8
phi_3_eta=5.*eta.^4./8-3.*eta.^2./4+1./8

phi_4_xi=7.*xi.^5./8-5.*xi.^3./4+3.*xi./8
phi_4_eta=7.*eta.^5./8-5.*eta.^3./4+3.*eta./8


N1_h=1./4.*(1-xi).*(1-eta);
N2_h=1./4.*(1+xi).*(1-eta);
N3_h=1./4.*(1+xi).*(1+eta);
N4_h=1./4.*(1-xi).*(1+eta);


N5_h=1./2.*(1-eta).*phi_2_xi*0.1
N6_h=1./2.*(1-eta).*phi_3_xi*1000000
N7_h=1./2.*(1-eta).*phi_4_xi*1000000

N8_h=1./2.*(1+xi).*phi_2_eta*0.1
N9_h=1./2.*(1+xi).*phi_3_eta*1000000
N10_h=1./2.*(1+xi).*phi_4_eta*1000000


N11_h=1./2.*(1+eta).*phi_2_xi*0.1
N12_h=1./2.*(1+eta).*phi_3_xi*1000000
N13_h=1./2.*(1+eta).*phi_4_xi*1000000


N14_h=1./2.*(1-xi).*phi_2_eta*0.1
N15_h=1./2.*(1-xi).*phi_3_eta*1000000
N16_h=1./2.*(1-xi).*phi_4_eta*1000000


N17_h=phi_2_eta.*phi_2_xi*0.1
N18_h=phi_2_xi.*phi_3_eta*1000000
N19_h=phi_2_eta.*phi_3_xi*1000000
N20_h=phi_3_eta.*phi_3_xi*1000000

N21_h=phi_2_xi.*phi_4_eta*1000000
N22_h=phi_3_eta.*phi_4_xi*1000000
N23_h=phi_2_eta.*phi_4_xi*1000000
N24_h=phi_4_eta.*phi_3_xi*1000000
N25_h=phi_4_eta.*phi_4_xi*1000000


figure
subplot(5,5,1)
surf(xi,eta,N1_h)

subplot(5,5,2)
surf(xi,eta,N2_h)
    
subplot(5,5,3)
surf(xi,eta,N3_h)
    
subplot(5,5,4)
surf(xi,eta,N4_h)

subplot(5,5,5)
surf(xi,eta,N5_h)

subplot(5,5,6)
surf(xi,eta,N6_h)

subplot(5,5,7)
surf(xi,eta,N7_h)

subplot(5,5,8)
surf(xi,eta,N8_h)

subplot(5,5,9)
surf(xi,eta,N9_h)

subplot(5,5,10)
surf(xi,eta,N10_h)
subplot(5,5,11)
surf(xi,eta,N11_h)
subplot(5,5,12)
surf(xi,eta,N12_h)
subplot(5,5,13)

surf(xi,eta,N13_h)
subplot(5,5,14)

surf(xi,eta,N14_h)
subplot(5,5,15)

surf(xi,eta,N15_h)
subplot(5,5,16)

surf(xi,eta,N16_h)


subplot(5,5,17)
surf(xi,eta,N17_h)
subplot(5,5,18)
surf(xi,eta,N18_h)
subplot(5,5,19)
surf(xi,eta,N19_h)
subplot(5,5,20)

surf(xi,eta,N20_h)
subplot(5,5,21)

surf(xi,eta,N21_h)
subplot(5,5,22)

surf(xi,eta,N22_h)
subplot(5,5,23)

surf(xi,eta,N23_h)

subplot(5,5,24)

surf(xi,eta,N24_h)
subplot(5,5,25)

surf(xi,eta,N25_h)




%%%%%%%%%%%%%%%% quintic


phi_2_xi=xi.^2./2-1./2
phi_2_eta=eta.^2./2-1./2

phi_3_xi=5.*xi.^4./8-3.*xi.^2./4+1./8
phi_3_eta=5.*eta.^4./8-3.*eta.^2./4+1./8

phi_4_xi=7.*xi.^5./8-5.*xi.^3./4+3.*xi./8
phi_4_eta=7.*eta.^5./8-5.*eta.^3./4+3.*eta./8

phi_5_xi=21.*xi.^6./16-35.*xi.^4./16+15.*xi.^2./16-1/16
phi_5_eta=21.*eta.^6./16-35.*eta.^4./16+15.*eta.^2/16-1/16


N1_h=1./4.*(1-xi).*(1-eta);
N2_h=1./4.*(1+xi).*(1-eta);
N3_h=1./4.*(1+xi).*(1+eta);
N4_h=1./4.*(1-xi).*(1+eta);


N5_h=1./2.*(1-eta).*phi_2_xi*0.1
N6_h=1./2.*(1-eta).*phi_3_xi*1000000
N7_h=1./2.*(1-eta).*phi_4_xi*1000000
N8_h=1./2.*(1-eta).*phi_5_xi*1000000


N9_h=1./2.*(1+xi).*phi_2_eta*0.1
N10_h=1./2.*(1+xi).*phi_3_eta*1000000
N11_h=1./2.*(1+xi).*phi_4_eta*1000000
N12_h=1./2.*(1+xi).*phi_5_eta*1000000


N13_h=1./2.*(1+eta).*phi_2_xi*0.1
N14_h=1./2.*(1+eta).*phi_3_xi*1000000
N15_h=1./2.*(1+eta).*phi_4_xi*1000000
N16_h=1./2.*(1+eta).*phi_5_xi*1000000


N17_h=1./2.*(1-xi).*phi_2_eta*0.1
N18_h=1./2.*(1-xi).*phi_3_eta*1000000
N19_h=1./2.*(1-xi).*phi_4_eta*1000000
N20_h=1./2.*(1-xi).*phi_5_eta*1000000


N21_h=phi_2_eta.*phi_2_xi*0.1
N22_h=phi_2_xi.*phi_3_eta*1000000
N23_h=phi_2_eta.*phi_3_xi*1000000
N24_h=phi_3_eta.*phi_3_xi*1000000

N25_h=phi_2_xi.*phi_4_eta*1000000
N26_h=phi_3_eta.*phi_4_xi*1000000
N27_h=phi_2_eta.*phi_4_xi*1000000
N28_h=phi_4_eta.*phi_3_xi*1000000
N29_h=phi_4_eta.*phi_4_xi*1000000

N30_h=phi_2_xi.*phi_5_eta*1000000
N31_h=phi_5_xi.*phi_2_eta*1000000
N32_h=phi_3_xi.*phi_5_eta*1000000
N33_h=phi_5_xi.*phi_3_eta*1000000
N34_h=phi_4_xi.*phi_5_eta*1000000
N35_h=phi_5_xi.*phi_4_eta*1000000
N36_h=phi_5_xi.*phi_5_eta*1000000



figure
subplot(6,6,1)
surf(xi,eta,N1_h)

subplot(6,6,2)
surf(xi,eta,N2_h)
    
subplot(6,6,3)
surf(xi,eta,N3_h)
    
subplot(6,6,4)
surf(xi,eta,N4_h)

subplot(6,6,5)
surf(xi,eta,N5_h)

subplot(6,6,6)
surf(xi,eta,N6_h)

subplot(6,6,7)
surf(xi,eta,N7_h)

subplot(6,6,8)
surf(xi,eta,N8_h)

subplot(6,6,9)
surf(xi,eta,N9_h)

subplot(6,6,10)
surf(xi,eta,N10_h)
subplot(6,6,11)
surf(xi,eta,N11_h)
subplot(6,6,12)
surf(xi,eta,N12_h)
subplot(6,6,13)

surf(xi,eta,N13_h)
subplot(6,6,14)

surf(xi,eta,N14_h)
subplot(6,6,15)

surf(xi,eta,N15_h)
subplot(6,6,16)

surf(xi,eta,N16_h)


subplot(6,6,17)
surf(xi,eta,N17_h)
subplot(6,6,18)
surf(xi,eta,N18_h)
subplot(6,6,19)
surf(xi,eta,N19_h)
subplot(6,6,20)

surf(xi,eta,N20_h)
subplot(6,6,21)

surf(xi,eta,N21_h)
subplot(6,6,22)

surf(xi,eta,N22_h)
subplot(6,6,23)

surf(xi,eta,N23_h)

subplot(6,6,24)

surf(xi,eta,N24_h)
subplot(6,6,25)

surf(xi,eta,N25_h)

subplot(6,6,26)
surf(xi,eta,N26_h)

subplot(6,6,27)
surf(xi,eta,N27_h)

subplot(6,6,28)
surf(xi,eta,N28_h)

subplot(6,6,29)
surf(xi,eta,N29_h)

subplot(6,6,30)
surf(xi,eta,N30_h)

subplot(6,6,31)
surf(xi,eta,N31_h)

subplot(6,6,32)
surf(xi,eta,N32_h)

subplot(6,6,33)
surf(xi,eta,N33_h)

subplot(6,6,34)
surf(xi,eta,N34_h)

subplot(6,6,35)
surf(xi,eta,N35_h)

subplot(6,6,36)
surf(xi,eta,N36_h)







%%%%%%%%%%% sixtic


%%%%%%%%%%%%%%%% quintic


phi_2_xi=xi.^2./2-1./2
phi_2_eta=eta.^2./2-1./2

phi_3_xi=5.*xi.^4./8-3.*xi.^2./4+1./8
phi_3_eta=5.*eta.^4./8-3.*eta.^2./4+1./8

phi_4_xi=7.*xi.^5./8-5.*xi.^3./4+3.*xi./8
phi_4_eta=7.*eta.^5./8-5.*eta.^3./4+3.*eta./8

phi_5_xi=21.*xi.^6./16-35.*xi.^4./16+15.*xi.^2./16-1/16
phi_5_eta=21.*eta.^6./16-35.*eta.^4./16+15.*eta.^2/16-1/16


phi_6_xi=33*xi^7/16-63*xi^5/16+35*xi^3/16-5*xi/16
phi_6_eta=33*eta^7/16-63*eta^5/16+35*eta^3/16-5*eta/16


N1_h=1./4.*(1-xi).*(1-eta);
N2_h=1./4.*(1+xi).*(1-eta);
N3_h=1./4.*(1+xi).*(1+eta);
N4_h=1./4.*(1-xi).*(1+eta);


N5_h=1./2.*(1-eta).*phi_2_xi*0.1
N6_h=1./2.*(1-eta).*phi_3_xi*1000000
N7_h=1./2.*(1-eta).*phi_4_xi*1000000
N8_h=1./2.*(1-eta).*phi_5_xi*1000000
N9_h=1./2.*(1-eta).*phi_6_xi*1000000


N10_h=1./2.*(1+xi).*phi_2_eta*0.1
N11_h=1./2.*(1+xi).*phi_3_eta*1000000
N12_h=1./2.*(1+xi).*phi_4_eta*1000000
N13_h=1./2.*(1+xi).*phi_5_eta*1000000
N14_h=1./2.*(1+xi).*phi_6_eta*1000000


N15_h=1./2.*(1+eta).*phi_2_xi*0.1
N16_h=1./2.*(1+eta).*phi_3_xi*1000000
N17_h=1./2.*(1+eta).*phi_4_xi*1000000
N18_h=1./2.*(1+eta).*phi_5_xi*1000000
N19_h=1./2.*(1+eta).*phi_6_xi*1000000


N20_h=1./2.*(1-xi).*phi_2_eta*0.1
N21_h=1./2.*(1-xi).*phi_3_eta*1000000
N22_h=1./2.*(1-xi).*phi_4_eta*1000000
N23_h=1./2.*(1-xi).*phi_5_eta*1000000
N24_h=1./2.*(1-xi).*phi_6_eta*1000000


N25_h=phi_2_eta.*phi_2_xi*0.1
N26_h=phi_2_xi.*phi_3_eta*1000000
N27_h=phi_2_eta.*phi_3_xi*1000000
N28_h=phi_3_eta.*phi_3_xi*1000000

N29_h=phi_2_xi.*phi_4_eta*1000000
N30_h=phi_3_eta.*phi_4_xi*1000000
N31_h=phi_2_eta.*phi_4_xi*1000000
N32_h=phi_4_eta.*phi_3_xi*1000000
N33_h=phi_4_eta.*phi_4_xi*1000000

N34_h=phi_2_xi.*phi_5_eta*1000000
N35_h=phi_5_xi.*phi_2_eta*1000000
N36_h=phi_3_xi.*phi_5_eta*1000000
N37_h=phi_5_xi.*phi_3_eta*1000000
N38_h=phi_4_xi.*phi_5_eta*1000000
N39_h=phi_5_xi.*phi_4_eta*1000000
N40_h=phi_5_xi.*phi_5_eta*1000000


N41_h=phi_2_xi.*phi_6_eta*1000000
N42_h=phi_6_xi.*phi_2_eta*1000000
N43_h=phi_3_xi.*phi_6_eta*1000000
N44_h=phi_6_xi.*phi_3_eta*1000000
N45_h=phi_4_xi.*phi_6_eta*1000000
N46_h=phi_6_xi.*phi_4_eta*1000000
N47_h=phi_5_xi.*phi_6_eta*1000000
N48_h=phi_6_xi.*phi_5_eta*1000000
N49_h=phi_6_xi.*phi_6_eta*1000000



end

