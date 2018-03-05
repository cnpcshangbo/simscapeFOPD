%Oustaloup approximation
gam=0.9693;
ww=[1e-4,1e4];n=6;
wb=ww(1); wh=ww(2); 
Ts=0.01;
C=new_fod(gam,n,wb,wh);

Cd=7.9733+0.2238*c2d(G,Ts,'tustin');

