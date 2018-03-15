s=tf('s');
kp=10.7;
ki=15.2;
kd=1.66;
c=kp+ki/s+kd*s;
cd=c2d(c,0.01,'tustin');
cd.num{1}
cd.den{1}