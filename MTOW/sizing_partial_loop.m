sizing_performance;

P_bat = 1;
P_f = 2;
phi_suplied = P_bat./(P_bat+P_f);
P_s2 = 1;
P_s1 = 3;
phi_shaft = P_s2./(P_s2+P_s1);

k = 1;
l = 1;

for i = 0:0.01:1

   phi_suplied = i;
   
Am = [-eta_GT,1,0,0,0,0,0,0,0,0;
     0,-eta_GB ,-eta_GB,1,0,0,0,0,0,0;
     0,0,0,-eta_P1(4),0,0,0,0,1,0;
     0,0,1,0,-eta_EM1,0,0,0,0,0;
     0,0,0,0,0,0,-eta_EM2,1,0,0;
     0,0,0,0,0,0,0,-eta_P1(4),0,1;
     0,0,0,0,1,-eta_PMAD,1,0,0,0;
     0,phi_suplied,(phi_suplied-1),0,0,0,0,0,0,0;
     0,0,0,phi_shaft,0,0,0,(phi_shaft-1),0,0;
     0,0,0,0,0,0,0,0,1,1];
 
bv = [0;0;0;0;0;0;0;0;0;2./dp(2)];
 
x = pinv(Am)*bv;

sizing_mass;

masses(l) = m_TO;
fuel(l) = m_f;
batteries(l) = m_bat;
POut_T(l) = (x(9)+(10)).*W_TO./1;
l = l+1;

end

xaxis = 0:01:100;


figure();
plot(xaxis,fuel);
hold on
plot(xaxis,batteries);
xlabel('Hybridization (%)');
ylabel('Mass (Kg)');
legend('Fuel Mass','Battery Mass');
hold off

figure();
plot(xaxis,masses);
xlabel('Hybridization (%)');
ylabel('MTOW (Kg)');

figure();
plot(xaxis,POut_T);
xlabel('Hybridization (%)');
ylabel('Overall Takeoff Rating (KW)');