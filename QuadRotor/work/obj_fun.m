function [itae_out] = obj_fun(wh)
%OBJ_FUN 此处显示有关此函数的摘要
%   此处显示详细说明
assignin('base','wb',1e-4);
assignin('base','wh',wh);
sim('../Models/Quadrotor_Controller.slx');
itae_out=itae.Data(end);
end

