% Impulse response invariant discretization of fractional order
% integrators/differentiators
% 
% irid_fod function is prepared to compute a discrete-time finite dimensional
% (z) transfer function to approximate a continuous irrational transfer
% function s^r, where "s" is the Laplace transform variable, and "r" is a
% real number in the range of (-1,1). s^r is called a fractional order
% differentiator if 0 < r < 1 and a fractional order integrator if -1 < r < 0.
%
% The proposed approximation keeps the impulse response "invariant"
%
% IN: 
%       r: the fractional order
%       Ts: the sampling period
%       norder: the finite order of the approximate z-transfer function 
%               (the orders of denominator and numerator z-polynomial are the same)
% OUT: 
%       sr: returns the LTI object that approximates the s^r in the sense
%       of impulse response. 
% TEST CODE
% dfod=irid_fod(-.5,.01,5);figure;pzmap(dfod)
%
% Reference: YangQuan Chen. "Impulse-invariant and step-invariant
% discretization of fractional order integrators and differentiators".
% August 2008. CSOIS AFC (Applied Fractional Calculus) Seminar.
% http://fractionalcalculus.googlepages.com/
% --------------------------------------------------------------------
% YangQuan Chen, Ph.D, Associate Professor and Graduate Coordinator
% Department of Electrical and Computer Engineering,
% Director, Center for Self-Organizing and Intelligent Systems (CSOIS)
% Utah State University, 4120 Old Main Hill, Logan, UT 84322-4120, USA
% E: yqchen@ece.usu.edu or yqchen@ieee.org, T/F: 1(435)797-0148/3054; 
% W: http://www.csois.usu.edu or http://yangquan.chen.googlepages.com 
% --------------------------------------------------------------------
%
% 9/5/2009 
% 
function [sr]=irid_fod(r,Ts,norder)
if nargin<3; norder=5; end
if Ts < 0 , sprintf('%s','Sampling period has to be positive'),     return, end
if abs(r)>=1, sprintf('%s','The fractional order should be less than 1.'), return, end
if norder<2,       sprintf('%s','The order of the approximate transfer function has to be greater than 1'), return, end
% 
L=200; %number of points of the impulse response function h(n)
Taxis=[0:L-1]*Ts;r0=r;r=abs(r);
ha0=(7*Ts/8)^r;n=1:L-1;h=[ha0, (Ts^r)*(n.^(r-1))/gamma(r)]; 
[b,a]=prony(h,norder,norder);
sr=tf(b,a,Ts);if r0>0, sr=1/sr; r=-r0; end

if 1  % change this to 0 if you do not want to see plots
% approximated h()
wmax0=2*pi/Ts/2; % rad./sec. Nyquist frequency
if r0>0, 
    hhat=impulse(1/sr,Taxis); 
else
    hhat=impulse(sr,Taxis); 
end    
    figure;plot(Taxis,hhat,'r');hold on;plot(Taxis,h,'ok')
xlabel('time');ylabel('impulse response'); legend(['true for 1/s^{',num2str(abs(r)),'}'],'approximated')
figure;
wmax=floor(1+ log10(wmax0) ); wmin=wmax-5;
w=logspace(wmin,wmax,1000);
srfr=(j*w).^(-r); 
subplot(2,1,1)
semilogx(w,20*log10(abs(srfr)),'r');grid on
hold on;
srfrhat=freqresp(sr,w);semilogx(w,20*log10(abs(reshape(srfrhat, 1000, 1))),'k');grid on
xlabel('frequency in Hz');ylabel('dB');
legend('true mag. Bode','approximated mag. Bode')
subplot(2,1,2)
semilogx(w,(180/pi) * (angle(srfr)),'r');grid on;hold on
semilogx(w,(180/pi) * (angle(reshape(srfrhat, 1000, 1))),'k');grid on
xlabel('frequency in Hz');ylabel('degree');
legend('true phase Bode','approximated Phase Bode')
end % if 1

 
