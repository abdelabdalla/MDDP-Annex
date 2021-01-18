clear
clc

g = 9.81;

M_max = 24000;
W_max = M_max.*g;

diam = 2.76;
length = 25.81;
tail_length = 5;
wing_area = 83.33088;

P_n = 0.1;
P_m = (1-P_n);

%Wheelbase
B_n_front = 2;
B_n = (12.36)-B_n_front;
B = B_n./P_m;
B_m = B.*P_n;

clearance = (length-B-B_n_front).*tand(6);
c = clearance*1000 - 50 - 350

H_lg = (length - B_n_front - B);
H_cg = (diam./2) + H_lg;

a_L = 0.3.*g;
a_T = 0.2.*g;
F_n = (B_m./B).*W_max + (W_max.*a_L.*H_cg)./(g.*B);
F_m_tot = (B_n./B).*W_max + (W_max.*a_T.*H_cg)./(g.*B);
F_m = F_m_tot./2;

%Wheel Track
speed_turn = 5.5;
rad_turn = 20;

F_c = M_max.*(speed_turn.^2)./rad_turn;
overturn = atand(F_c./(M_max.*g));

T_min = 2.*(F_c.*H_cg)./(M_max.*g)

%Buckling
E = 113.*10.^9;
rad_n = ((8.*(clearance.^2).*F_n)./(E.*pi().^3)).^0.25;
rad_m = ((8.*(clearance.^2).*F_m)./(E.*pi().^3)).^0.25;