gam=0.9693;
Ts=.01;
dfod=irid_fod(gam,Ts,5);
kp=9.9498;
ki=0.1631;
cd=kp*(1+ki*dfod);

s=tf('s');
K=1.102, T1=0.17936
p=K/(T1*s+1)/s;
pd=c2d(p,Ts,'tustin');%plant

phiz=cd*pd/(1+cd*pd);