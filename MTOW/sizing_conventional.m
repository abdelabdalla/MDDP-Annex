sizing_performance;


Am = [-eta_GT ,1,0,0;
     0,-eta_GB,1,0;
     0,0,-eta_P1(4),1;
     0,0,0,1];
 
bv = [0;0;0;2./dp(2)];
 
x = linsolve(Am,bv);