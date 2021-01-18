clear
clc

m = 24633.565;
W_f = m.*0.1.*9.81;

%Calculate Force requirement
mu = 0.4;
F = mu.*W_f;

%Calculate Power requirement
v = 11;
t_T = 5.*60;

P = F.*v;

E = P.*(t_T./3600);

disp(['Power for constant speed: ' , num2str(P./1000) , ' KW']);
disp(['Battery Required: ' , num2str(E./1000) , 'KWh']);