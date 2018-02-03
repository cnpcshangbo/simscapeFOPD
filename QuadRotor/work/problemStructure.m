
x0 = 1e-2;
A =[]; b=[]; Aeq=[];beq=[];VLB=0;VUB=[];
[x,fval]=fmincon(@obj_fun,x0,A,b,Aeq,beq,VLB,VUB);