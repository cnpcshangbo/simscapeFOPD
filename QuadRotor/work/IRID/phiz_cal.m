gam=0.9693;
Ts=.01;
dfod=irid_fod(gam,Ts,5);

cd=7.9733*(1+0.2238*dfod);

s=tf('s');
p=0.99217/(0.2486*s+1)/s;
pd=c2d(p,Ts,'tustin');%plant

phiz=cd*pd/(1+cd*pd);