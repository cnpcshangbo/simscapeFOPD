function [itae_out] = obj_fun(wb,wh)
%OBJ_FUN 此处显示有关此函数的摘要
%   此处显示详细说明
disp(wh);
assignin('base','wb',wb);
assignin('base','wh',wh);
sim('../Models/Quadrotor_Controller.slx');
itae_out=itae.Data(end);
disp(vpa(itae.Data(end)));
end

