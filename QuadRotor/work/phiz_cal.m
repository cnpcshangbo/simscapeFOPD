%Oustaloup approximation
gam=0.9693;
ww=[1e-4,1e4];n=6;
wb=ww(1); wh=ww(2); 
Ts=0.01;
Cs=new_fod(gam,n,wb,wh);

cd=7.9733+0.2238*c2d(Cs,Ts,'tustin');%controller

s=tf('s');
p=0.99217/(0.2486*s+1)/s;
pd=c2d(p,Ts,'tustin');%plant

phiz=cd*pd/(1+cd*pd);
