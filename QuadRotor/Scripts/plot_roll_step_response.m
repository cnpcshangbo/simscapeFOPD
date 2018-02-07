%%
% assignin('base','wb',1e-10);
% assignin('base','wh',1e-10);
sim('../Models/Quadrotor_Controller.slx');
figure(1);
hold on
plot(roll_meas.Time,roll_meas.Data,'-',roll_ref.Time,roll_ref.Data,'--');
%itae1=[num2str(itae.Data(end),10) ',wb=' num2str(wb) ',wh=' num2str(wh)];
legend('roll measure', 'roll set-point');
grid on