clear all;
close all;
clc;
format long;


sample = 100; % ilosc probek
n1 = 1.53; 
n2 = 1.529;
n3 = 1;
n4 = 1.529;
n5 = n4;
lambda = 1.54*1e-6;
L = 0.05;
P_ratio_1 = 0.001;
k0= 2*pi /lambda; %wektor falowy 
Alfa = 0.01/L;


kxx = linspace (0, n1*k0, sample); 
kxy = linspace (0, n1*k0, sample); 
kyx = linspace (0, n1*k0, sample); 
kyy = linspace (0, n1*k0, sample); 
%grubosc d

y2x = sqrt((k0.^2.*((n1.^2)-(n2.^2)))-kxx.^2);
y3x = sqrt((k0.^2.*((n1.^2)-(n3.^2)))-kxx.^2);
y2y = sqrt((k0.^2.*((n1.^2)-(n2.^2)))-kyx.^2);
y3y = sqrt((k0.^2.*((n1.^2)-(n3.^2)))-kyx.^2);




dx1=((atan(((n1.^2).*kxx.*(((n3.^2).*y2x)+(n2.^2).*y3x))./(((n2.^2).*(n3.^2).*(kxx.^2))-(n1.^4).*y2x.*y3x)))+1.*pi)./kxx;
semilogy(kxx,dx1)
hold on
grid on

dx2=((atan(((n1.^2).*kxx.*(((n3.^2).*y2x)+(n2.^2).*y3x))./(((n2.^2).*(n3.^2).*(kxx.^2))-(n1.^4).*y2x.*y3x)))+2.*pi)./kxx;
semilogy(kxx,dx2)
dx3=((atan(((n1.^2).*kxx.*(((n3.^2).*y2x)+(n2.^2).*y3x))./(((n2.^2).*(n3.^2).*(kxx.^2))-(n1.^4).*y2x.*y3x)))+3.*pi)./kxx;
semilogy(kxx,dx3)
dx4=((atan(((n1.^2).*kxx.*(((n3.^2).*y2x)+(n2.^2).*y3x))./(((n2.^2).*(n3.^2).*(kxx.^2))-(n1.^4).*y2x.*y3x)))+4.*pi)./kxx;
semilogy(kxx,dx4)
dx5=((atan(((n1.^2).*kxx.*(((n3.^2).*y2x)+(n2.^2).*y3x))./(((n2.^2).*(n3.^2).*(kxx.^2))-(n1.^4).*y2x.*y3x)))+5.*pi)./kxx;
semilogy(kxx,dx5)
dx6=((atan(((n1.^2).*kxx.*(((n3.^2).*y2x)+(n2.^2).*y3x))./(((n2.^2).*(n3.^2).*(kxx.^2))-(n1.^4).*y2x.*y3x)))+6.*pi)./kxx;
semilogy(kxx,dx6)

dy1=((atan((kyx.*(y2y+y3y))./((kyx.^2)-y2y.*y3y)))+1*pi)./kyx;
semilogy(kyx,dy1)
dy2=((atan((kyx.*(y2y+y3y))./((kyx.^2)-y2y.*y3y)))+2*pi)./kyx;
semilogy(kyx,dy2)
dy3=((atan((kyx.*(y2y+y3y))./((kyx.^2)-y2y.*y3y)))+3*pi)./kyx;
semilogy(kyx,dy3)
dy4=((atan((kyx.*(y2y+y3y))./((kyx.^2)-y2y.*y3y)))+4*pi)./kyx;
semilogy(kyx,dy4)
dy5=((atan((kyx.*(y2y+y3y))./((kyx.^2)-y2y.*y3y)))+5*pi)./kyx;
semilogy(kyx,dy5)
dy6=((atan((kyx.*(y2y+y3y))./((kyx.^2)-y2y.*y3y)))+6*pi)./kyx;
semilogy(kyx,dy6)

legend('dx1','dx2','dx3','dx4','dx5','dx6','dy1','dy2','dy3','dy4','dy5','dy6')
%legend('dy1','dy2','dy3','dy4','dy5','dy6')

%semilogy(kxx,Check,'r-',Check2,dx1,'r-')



Check1 = 0.91e-6*ones(sample);
%semilogy(kxx,Check1,'r-')
Check2 = 1.51e-6*ones(sample);
%semilogy(kxx,Check2,'r-')
Check3 = 2.01e-6*ones(sample);
%semilogy(kxx,Check3,'r-')
Check4 = 2.51e-6*ones(sample);
%semilogy(kxx,Check4,'r-')
Check5 = 3.01e-6*ones(sample);
%semilogy(kxx,Check5,'r-')



%legend('dx1')
xlabel('kx')
ylabel('d')
title('Grubosc odciecia')
hold off



%%%% szerokosc t %%%%



y4x=sqrt((k0.^2.*((n1.^2)-(n4.^2)))-kxy.^2);
y5x=sqrt((k0.^2.*((n1.^2)-(n5.^2)))-kxy.^2);

y4y=sqrt((k0.^2.*((n1.^2)-(n4.^2)))-kyy.^2);
y5y=sqrt((k0.^2.*((n1.^2)-(n5.^2)))-kyy.^2);



figure()
tx1=((atan((kxy.*(y4x+y5x))./((kxy.^2)-y4x.*y5x)))+1*pi)./kxy;
semilogy(kxy,tx1)
hold on
grid on
tx2=((atan((kxy.*(y4x+y5x))./((kxy.^2)-y4x.*y5x)))+2*pi)./kxy;
semilogy(kxy,tx2)
tx3=((atan((kxy.*(y4x+y5x))./((kxy.^2)-y4x.*y5x)))+3*pi)./kxy;
semilogy(kxy,tx3)
tx4=((atan((kxy.*(y4x+y5x))./((kxy.^2)-y4x.*y5x)))+4*pi)./kxy;
semilogy(kxy,tx4)
tx5=((atan((kxy.*(y4x+y5x))./((kxy.^2)-y4x.*y5x)))+5*pi)./kxy;
semilogy(kxy,tx5)
tx6=((atan((kxy.*(y4x+y5x))./((kxy.^2)-y4x.*y5x)))+6*pi)./kxy;
semilogy(kxy,tx6)


ty1=((atan(((n1.^2).*kyy.*(((n4.^2).*y5y)+(n5.^2).*y4y))./(((n4.^2).*(n5.^2).*(kyy.^2))-(n1.^4).*y4y.*y5y)))+1.*pi)./kxy;
semilogy(kyy,ty1)
ty2=((atan(((n1.^2).*kyy.*(((n4.^2).*y5y)+(n5.^2).*y4y))./(((n4.^2).*(n5.^2).*(kyy.^2))-(n1.^4).*y4y.*y5y)))+2.*pi)./kxy;
semilogy(kyy,ty2)
ty3=((atan(((n1.^2).*kyy.*(((n4.^2).*y5y)+(n5.^2).*y4y))./(((n4.^2).*(n5.^2).*(kyy.^2))-(n1.^4).*y4y.*y5y)))+3.*pi)./kxy;
semilogy(kyy,ty3)
ty4=((atan(((n1.^2).*kyy.*(((n4.^2).*y5y)+(n5.^2).*y4y))./(((n4.^2).*(n5.^2).*(kyy.^2))-(n1.^4).*y4y.*y5y)))+4.*pi)./kxy;
semilogy(kyy,ty4)
ty5=((atan(((n1.^2).*kyy.*(((n4.^2).*y5y)+(n5.^2).*y4y))./(((n4.^2).*(n5.^2).*(kyy.^2))-(n1.^4).*y4y.*y5y)))+5.*pi)./kxy;
semilogy(kyy,ty5)
ty6=((atan(((n1.^2).*kyy.*(((n4.^2).*y5y)+(n5.^2).*y4y))./(((n4.^2).*(n5.^2).*(kyy.^2))-(n1.^4).*y4y.*y5y)))+6.*pi)./kxy;
semilogy(kyy,ty6)




legend('tx1','tx2','tx3','tx4','tx5','tx6','ty1','ty2','ty3','ty4','ty5','ty6')
xlabel('ky')
ylabel('t')
title('Szerokosc odciecia')
hold off


%kkxxm=[4.4138e6,4.4138e6];




r1 = 1;
r2= linspace (0.1,1,sample);

for i=1:sample
   C(i) = 1/r2(i)*(1/r1*(1-r1^2)+1/r2(i)*(1-r2(i)^2)); 
    
end

%Bx11
%t = ?
%d = ?


%pole podluzne
Gamma = 1/2*L * log(1/r1*r2);

z = linspace(0,L,sample);
fR = exp (Gamma.*z);
fS =1./r2.*(exp (-Gamma.*z));

