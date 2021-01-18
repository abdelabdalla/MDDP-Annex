W_OEref = (11550).*0.9.*9.81./1000;
W_known = W_OEref + W_PL;

t_f = 5308;
t_bat = t_f;


w_f = ((t_f./3600)./(12000)).*x(1);%kN
bat = 740;
w_bat = ((t_bat./3600)./bat).*x(6);%kN

W_TO = W_known./(1-w_f-w_bat);%KN

m_TO = W_TO.*1000./9.81;%Kg
m_f = w_f.*m_TO;
m_bat = w_bat.*m_TO;