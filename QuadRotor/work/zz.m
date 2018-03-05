%Oustaloup approximation
gam=0.9693;
ww=[1e-4,1e4];n=6;
wb=ww(1); wh=ww(2); 
kF=0;Ts=0.01;
if kF==1, G=ousta_fod(gam,n,wb,wh);
else, G=new_fod(gam,n,wb,wh); end
G=c2d(G,Ts,'tustin');
num=G.num{1}; den=G.den{1}; T=1/wh; str='Fractional\n';
if isnumeric(gam)
	if gam>0, str=[str, 'Der  s^' num2str(gam) ];
	else, str=[str, 'Int  s^{' num2str(gam) '}']; end
else, str=[str, 'Der  s^gam']; end
if kF1==1, G=G*tf(1,[T 1]); end
