clear all;
close all;
clc;
format long;
sample = 200; % ilosc probek
n1 = 1.53; 
n2 = 1.529;
n3 = 1;
n4 = 1.529;
n5 = n4;
lambda = 1.54*1e-6;
L = 0.05;
P_ratio = 0.1;
k0= 2*pi /lambda; %wektor falowy 
Alfa = 0.01/L;
zakres = 2.5*10^5;
dokladnosc = 1e-4;
kxx = linspace (0, zakres, sample); 
kxy = linspace (0, zakres, sample); 
kyx = linspace (0, zakres, sample); 
kyy = linspace (0, zakres, sample); 
k_vector = linspace (0, zakres, sample); 
%wybor modu
m = 1;
n = 3;
dx = 68.3e-6;
tx = 29.2e-6;
dy = 68.3e-6;
ty = 29.2e-6;

f1=@(kxx)(atan(((n1.^2).*kxx.*(((n3.^2).*(sqrt((k0.^2.*(n1.^2-n2.^2))-kxx.^2)))+(n2.^2).*(sqrt((k0.^2.*(n1.^2-n3.^2))-kxx.^2))))./(((n2.^2).*(n3.^2).*(kxx.^2))-(n1.^4).*(sqrt((k0.^2.*(n1.^2-n2.^2))-kxx.^2)).*(sqrt((k0.^2.*(n1.^2-n3.^2))-kxx.^2)))))+m.*pi - dx.*kxx;
f2=@(kxy)(atan(kxy.*((sqrt((k0.^2.*(n1.^2-n4.^2))-kxy.^2))+(sqrt((k0.^2.*(n1.^2-n4.^2))-kxy.^2)))/(kxy.^2-(sqrt((k0.^2.*(n1.^2-n4.^2))-kxy.^2))-(sqrt((k0.^2.*(n1.^2-n4.^2))-kxy.^2)))))+n.*pi - tx.*kxy;
f3=@(kyx)(atan(kyx.*((sqrt((k0.^2.*(n1.^2-n2.^2))-kyx.^2))+(sqrt((k0.^2.*(n1.^2-n3.^2))-kyx.^2)))/(kyx.^2-(sqrt((k0.^2.*(n1.^2-n2.^2))-kyx.^2))-(sqrt((k0.^2.*(n1.^2-n3.^2))-kyx.^2)))))+m.*pi - dy.*kyx;
f4=@(kyy)(atan(((n1.^2).*kyy.*(((n4.^2).*(sqrt((k0.^2.*(n1.^2-n5.^2))-kyy.^2)))+(n5.^2).*(sqrt((k0.^2.*(n1.^2-n4.^2))-kyy.^2))))./(((n4.^2).*(n5.^2).*(kyy.^2))-(n1.^4).*(sqrt((k0.^2.*(n1.^2-n4.^2))-kyy.^2)).*(sqrt((k0.^2.*(n1.^2-n5.^2))-kyy.^2)))))+n.*pi - ty.*kyy;
fx = f1;
    Check1 = 0.*ones(sample);
    plot(k_vector, fx(k_vector),'b-o',k_vector,Check1,'r-')
    xlabel('kvector')
    ylabel('f(kvector)')
    title('Miejsce zerowe')
    hold off
%metoda bisekcji do wyliczenia kolejnych wartosci kappa
    licznik=0;
    k1 = 0;
    k2 = zakres;
    p=0;
        err=10;
        if real(fx(k1))*real(fx(k2))>0 
            disp('zly zakres')
        else
            disp('else')
              p = (k1 + k2)/2;
                 err = abs((fx(p)));
          while err > dokladnosc
            licznik=licznik+1;
                disp('petla')
       if real(fx(k1))*real(fx(p))>0 
          k1 = p;
       else
           k2 = p;   
       end
        p = (k1 + k2)/2;
       err = abs(real(f3(p)));
       if licznik>500
           break
       end
          end
    p
        end
    disp('skonczone obliczenia za pomoca bisekcji');

    
   % do wykresu 3  
   %
   
   %{
Kxx_11 = 4.692527491097205e+04;
Kxy_11 = 1.474324618702575e+05;
Kyx_11 = 7.527542114257812e+04;
Kyy_11 = 8.211067817812593e+04;
Kxx_21 = 9.370189459802266e+04;
Kxy_21 = 1.474324618702575e+05;
Kyx_21 = 1.254558563232422e+05;
Kyy_21 = 8.211067817812593e+04;
Kxx_31 = 1.401098396511009e+05;
Kxy_31 = 1.474324618702575e+05;
Kyx_31 = 1.756324768066406e+05;
Kyy_31 = 8.211067817812593e+04;
Kxx_41 = 1.856423888820215e+05;
Kxy_41 = 1.474324618702575e+05;
Kyx_41 = 2.257919311523438e+05;
Kyy_41 = 8.211067817812593e+04;

Betax11 = sqrt(n1.^2*k0.^2-Kxx_11.^2-Kxy_11.^2);
Betay11 = sqrt(n1.^2*k0.^2-Kyx_11.^2-Kyy_11.^2);%
Betax21 = sqrt(n1.^2*k0.^2-Kxx_21.^2-Kxy_21.^2);
Betay21 = sqrt(n1.^2*k0.^2-Kyx_21.^2-Kyy_21.^2);
Betax31 = sqrt(n1.^2*k0.^2-Kxx_31.^2-Kxy_31.^2);
Betay31 = sqrt(n1.^2*k0.^2-Kyx_31.^2-Kyy_31.^2);
Betax41 = sqrt(n1.^2*k0.^2-Kxx_41.^2-Kxy_41.^2);
Betay41 = sqrt(n1.^2*k0.^2-Kyx_41.^2-Kyy_41.^2);
   
   
nx_11 = (atan(-sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy_11.^2)/(Kxy_11))+1*pi/(Kxy_11));
nx_21 = (atan(-sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy_21.^2)/(Kxy_21))+1*pi/(Kxy_21));
nx_31 = (atan(-sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy_31.^2)/(Kxy_31))+1*pi/(Kxy_31));
nx_41 = (atan(-sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy_41.^2)/(Kxy_41))+1*pi/(Kxy_41));
Ksi_11 = (atan((-n3.^2*Kxx_11)/(n1.^2*sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx_11.^2)))+1*pi)/Kxx_11;
Ksi_21 = (atan((-n3.^2*Kxx_21)/(n1.^2*sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx_21.^2)))+2*pi)/Kxx_21;
Ksi_31 = (atan((-n3.^2*Kxx_31)/(n1.^2*sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx_31.^2)))+3*pi)/Kxx_31;
Ksi_41 = (atan((-n3.^2*Kxx_41)/(n1.^2*sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx_41.^2)))+4*pi)/Kxx_41;
   
   %}
   
    


% do wykresu% 4
Kxx_11 = 1.228542987640665e+05;
Kxy_11 = 1.474324618702575e+05;
Kyx_11 = 2.242889404296875e+05;
Kyy_11 = 8.211067817812593e+04;

  
Kxx_12 = 1.228542987640665e+05;
Kxy_12 = 8.710422950198472e+04;
Kyx_12 = 2.242889404296875e+05;
Kyy_12 = 6.492303764290080e+04;
Kxx_13 = 1.228542987640665e+05;
Kxy_13 = 6.492303764290080e+04;
Kyx_13 = 2.242889404296875e+05;
Kyy_13 = 9.721028785030998e+04;
Kxx_14 = 1.228542987640665e+05;
Kxy_14 = 1.559369986783575e+05;
Kyx_14 = 2.242889404296875e+05;
Kyy_14 = 1.292467700262897e+05;

Betax11 = sqrt(n1.^2*k0.^2-Kxx_11.^2-Kxy_11.^2);
Betay11 = sqrt(n1.^2*k0.^2-Kyx_11.^2-Kyy_11.^2);
Betax12 = sqrt(n1.^2*k0.^2-Kxx_12.^2-Kxy_12.^2);
Betay12 = sqrt(n1.^2*k0.^2-Kyx_12.^2-Kyy_12.^2);
Betax13 = sqrt(n1.^2*k0.^2-Kxx_13.^2-Kxy_13.^2);
Betay13 = sqrt(n1.^2*k0.^2-Kyx_13.^2-Kyy_13.^2);
Betax14 = sqrt(n1.^2*k0.^2-Kxx_14.^2-Kxy_14.^2);
Betay14 = sqrt(n1.^2*k0.^2-Kyx_14.^2-Kyy_14.^2);

nx_11 = (atan(-sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy_11.^2)/(Kxy_11))+1*pi/(Kxy_11));
nx_12 = (atan(-sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy_12.^2)/(Kxy_12))+2*pi/(Kxy_12));
nx_13 = (atan(-sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy_13.^2)/(Kxy_13))+3*pi/(Kxy_13));
nx_14 = (atan(-sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy_14.^2)/(Kxy_14))+4*pi/(Kxy_14));
Ksi_11 = (atan((-n3.^2*Kxx_11)/(n1.^2*sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx_11.^2)))+1*pi)/Kxx_11;
Ksi_12 = (atan((-n3.^2*Kxx_12)/(n1.^2*sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx_12.^2)))+1*pi)/Kxx_12;
Ksi_13 = (atan((-n3.^2*Kxx_13)/(n1.^2*sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx_13.^2)))+1*pi)/Kxx_13;
Ksi_14 = (atan((-n3.^2*Kxx_14)/(n1.^2*sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx_14.^2)))+1*pi)/Kxx_14;

%petla liczy goL_11(r2) dla roznych m=1,2,3,4  oraz roznych n=1,2,3,4 ktore ustalamy na poczatku kodu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




dx_1 = 20.8e-6;
tx_1 = 29.2e-6;

Kxx = Kxx_11;
Kxy = Kxy_11;
Ksi = Ksi_11;
nx = nx_11;
Betax = Betax11;
Betay = Betay11;

r1 = 1;
r2a = linspace (0.01,0.90,90);
r2b = linspace(0.91,0.999,90);
r2_vector = [r2a,r2b];

for i=1:180
r2 = r2_vector(i);

Gamma = 1/2*L * log(1/r1*r2);

fR = @(z) exp(Gamma*z);
fS = @(z) 1./r2.*(exp (-Gamma*z));


C = 1/r2*(1/r1*(1-r1^2)+1/r2*(1-r2^2)); 

fun1 = @(z) abs(fR(z)).^2+abs(fS(z)).^2;
Licznik = integral(fun1,-L/2,L/2);


Ex_A = @(x,y) i/Kxx.*(n1^.2.*k0^.2-Kxx^.2).*cos(Kxy.*(y+nx)).*sin(Kxx.*(x+Ksi));
Ex_B = @(x,y) i/(sqrt((k0.^2.*((n1.^2)-(n2.^2)))-Kxx.^2).*Betax).*((sqrt((k0.^2.*((n1.^2)-(n2.^2)))-Kxx.^2)^.2)+n2.^2.*k0.^2).*cos(Kxy.*(y+nx)).*cos(Kxx.*(Ksi-dx_1)).*exp(sqrt((k0.^2.*((n1.^2)-(n2.^2)))-Kxx.^2).*(x+dx_1));
Ex_C = @(x,y) -i/(sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx.^2).*Betax).*((sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx^.2).^2)+n3.^2+k0.^2).*cos(Kxy.*(y+nx)).*cos(Kxx.*Ksi).*exp(-sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx.^2).*x);
Ex_D = @(x,y) (i.*n4.^2*k0.^2-Kxx.^2)/(n4.^2.*Kxx.*Betax).*cos(Kxy.*(tx_1+nx)).*sin(Kxx.*(x+Ksi)).*exp(-sqrt((k0.^2.*((n1.^2)-(n4.^2)))-Kxy.^2).*(y-tx_1));
Ex_E = @(x,y) (i.*n5.^2*k0.^2-Kxx.^2)/(n5.^2.*Kxx.*Betax).*cos(Kxy.*nx).*sin(Kxx.*(x+Ksi)).*exp(sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy.^2).*y);

Ex_A_abs_2 = @(x,y) (abs(i/Kxx.*(n1^.2.*k0^.2-Kxx^.2).*cos(Kxy.*(y+nx)).*sin(Kxx.*(x+Ksi)))).^2;
Ex_B_abs_2 = @(x,y) (abs(i/(sqrt((k0.^2.*((n1.^2)-(n2.^2)))-Kxx.^2).*Betax).*((sqrt((k0.^2.*((n1.^2)-(n2.^2)))-Kxx.^2)^.2)+n2.^2.*k0.^2).*cos(Kxy.*(y+nx)).*cos(Kxx.*(Ksi-dx_1)).*exp(sqrt((k0.^2.*((n1.^2)-(n2.^2)))-Kxx.^2).*(x+dx_1)))).^2;
Ex_C_abs_2 = @(x,y) (abs(-i/(sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx.^2).*Betax).*((sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx^.2).^2)+n3.^2+k0.^2).*cos(Kxy.*(y+nx)).*cos(Kxx.*Ksi).*exp(-sqrt((k0.^2.*((n1.^2)-(n3.^2)))-Kxx.^2).*x))).^2;
Ex_D_abs_2 = @(x,y) (abs((i.*n4.^2*k0.^2-Kxx.^2)/(n4.^2.*Kxx.*Betax).*cos(Kxy.*(tx_1+nx)).*sin(Kxx.*(x+Ksi)).*exp(-sqrt((k0.^2.*((n1.^2)-(n4.^2)))-Kxy.^2).*(y-tx_1)))).^2;
Ex_E_abs_2 = @(x,y) (abs((i.*n5.^2*k0.^2-Kxx.^2)/(n5.^2.*Kxx.*Betax).*cos(Kxy.*nx).*sin(Kxx.*(x+Ksi)).*exp(sqrt((k0.^2.*((n1.^2)-(n5.^2)))-Kxy.^2).*y))).^2;


Calka2_1A = integral2(Ex_A_abs_2,-dx_1,0,0,tx_1);
Calka2_1B = integral2(Ex_B_abs_2,-dx_1*5,-dx_1,0,tx_1);
Calka2_1C = integral2(Ex_C_abs_2,0,dx_1*5,0,tx_1);
Calka2_1D = integral2(Ex_D_abs_2,-dx_1,0,tx_1,tx_1*5);
Calka2_1E = integral2(Ex_E_abs_2,-dx_1,0,-tx_1*5,0);

Mianownik = 2/(Calka2_1A+Calka2_1B+Calka2_1C+Calka2_1D+Calka2_1E);

F_int3_A = @(x,y,z)  (((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_A_abs_2(x,y))./(1+P_ratio.*(((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_A_abs_2(x,y))./C); 
F_int3_B = @(x,y,z)  (((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_B_abs_2(x,y))./(1+P_ratio.*(((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_B_abs_2(x,y))./C);
F_int3_C = @(x,y,z)  (((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_C_abs_2(x,y))./(1+P_ratio.*(((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_C_abs_2(x,y))./C); 
F_int3_D = @(x,y,z)  (((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_D_abs_2(x,y))./(1+P_ratio.*(((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_D_abs_2(x,y))./C); 
F_int3_E = @(x,y,z)  (((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_E_abs_2(x,y))./(1+P_ratio.*(((abs(fR(z))).^2+(abs(fS(z)))).^2.*Ex_E_abs_2(x,y))./C);
Calka_3_E_A = integral3(F_int3_A,-dx_1,0,0,tx_1,-L/2,L/2);
Calka_3_E_B = integral3(F_int3_B,-5*dx_1,-dx_1,0,tx_1,-L/2,L/2);
Calka_3_E_C = integral3(F_int3_C,0,5*dx_1,0,tx_1,-L/2,L/2);
Calka_3_E_D = integral3(F_int3_D,-dx_1,0,tx_1,5*tx_1,-L/2,L/2);
Calka_3_E_E = integral3(F_int3_E,-dx_1,0,-5*tx_1,0,-L/2,L/2);
Calka_3_E_Suma = Calka_3_E_A+Calka_3_E_B+Calka_3_E_C+Calka_3_E_D+Calka_3_E_E;
goL(i) = (C+2*Alfa*Licznik)/(Mianownik*Calka_3_E_Suma);
i
end

semilogx(r2_vector,goL,'r');

