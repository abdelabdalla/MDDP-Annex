clc
clear

g = 9.81;

%Top Level Req
W_PL = 5000.*g./1000;
h_cr = 25000;
M_cr = 0.6;
R = 500;
V_SR = 80;
V_app = V_SR.*1.3;
s_LFL = 1000;

c_BL = 2.1;
V_BL = 1.4*V_SR;
h_div = 10000;
M_div = 0.4;
R_div = 100;

S_TO = 1000;

%Design Params
A = 15;
sweep = 0;
taper = 0.6;
thick_chord = 0.18;
N_1 = 2;
N_2 = 0;
DP_span = 0.6;
DP_space = 0.01;
DP_axial = 0.2;

%HEP tech levels
e_bat = 500;
specPwr_bat = 1;
SOC_min = 20;
specPwr_EM = 7.7;
eta_EM1 = 0.96;
eta_EM2 = 0.96;
eta_PMAD = 0.99;
eta_GB = 0.96;
eta_GT = 0.3;

%Flight Profile
C_D0 = [0.02, 0.085, 0.035, 0.65];
e = [0.85, 1, 0.95, 1];
C_Lmax = [0, 2.95, 1.75, 2.95];
eta_P1 = [0.9, 0.8, 0.75, 0.8];