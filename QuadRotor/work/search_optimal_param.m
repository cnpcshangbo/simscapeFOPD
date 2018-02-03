function [x,fval]=search_optimal_param

x0 = 1e-2;
A =[]; b=[]; Aeq=[];beq=[];VLB=0;VUB=[];
[x,fval]=fmincon(@obj_fun,x0,A,b,Aeq,beq,VLB,VUB);

% Àý1£ºmin f = -x1 - 2*x2 + 1/2*x1^2 + 1/2 * x2^2
% 2*x1 + 3*x2 <= 6
% x1 + 4*x2 <= 5
% x1, x2 >= 0
%  
% function ex131101
%  
% x0 = [1; 1];
% A = [2, 3; 1, 4];
% b = [6, 5];
% Aeq = [];
% beq = [];
% VLB = [0; 0];
% VUB = [];
% [x, fval] = fmincon(@fun3, x0, A, b, Aeq, beq, VLB, VUB)
%  
% function f = fun3(x)
% f = -x(1) - 2*x(2) + (1/2)*x(1)^2 + (1/2)*x(2)^2;