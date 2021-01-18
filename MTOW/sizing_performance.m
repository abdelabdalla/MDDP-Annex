aircraft;

C_Lairframe = 0.001:0.001:1;

%Cruise
[T_cruise,p_cruise,rho_cruise,c_cruise] = atm(h_cr.*0.3048);
q_inf = p_cruise.*100.*(-1+(1+0.2.*M_cr.^2).^(7/2));
WS_cruise = q_inf.*C_Lairframe;
cruise = ((M_cr.*c_cruise) .* ((C_Lairframe.^-1) .* (C_D0(1) + ((C_Lairframe.^2) ./ (pi() .* A .* e(1)))))).^-1;
cruise = cruise./f_w(1);

%Take-off
WS_to = 0.1:0.1:10;
takeoff = ((1000.*WS_to).^-1).*(S_TO.*1.*C_Lmax(3).*9.81)./(V_SR.*1.1 .* 2.34);
takeoff = takeoff./f_w(3);

%Approach
q_inf_app = 1013.*0.7.*((V_app./1.944)./343).^2;
WS_approach = q_inf_app./C_Lmax(2);
approach = 0:0.01:0.2;
WS_app = ones(length(approach));
WS_app = WS_approach.*WS_app;


dp = InterX([WS_cruise;cruise],[WS_to;takeoff]);%design point (W/S,W/P);


%close all
figure();
hold on
plot(WS_cruise,cruise);
plot(WS_to,takeoff);
plot(WS_app,approach,'g');
legend('Cruise','Take-off Distance','Approach Speed');

xlim([0 8]);
ylim([0 0.1]);
xlabel('Wing loading W_{TO}/S (kN/m^2)');
ylabel('Power loading W/P (N/W)');
hold off
