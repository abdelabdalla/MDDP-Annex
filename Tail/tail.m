clear
clc

l_f = 25.81 + 5;
S_W = 83.33088;
b = 30.27605712;
c_MAC = 2.752368829;

scale = 0.55;

l_H = scale.*l_f;
l_V = scale.*l_f;

C_H = 0.8.*0.95;
C_V = 0.07.*0.95;

S_H = C_H.*S_W.*c_MAC./l_H
S_V = C_V.*S_W.*b./l_V