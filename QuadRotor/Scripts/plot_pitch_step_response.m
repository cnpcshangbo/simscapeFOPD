%%
% assignin('base','wb',1e-10);
% assignin('base','wh',1e-10);
sim('../Models/Quadrotor_Controller.slx');
figure(1);
hold on
plot(pitch_meas.Time,pitch_meas.Data,'-',pitch_ref.Time,pitch_ref.Data,'--');
%itae1=[num2str(itae.Data(end),10) ',wb=' num2str(wb) ',wh=' num2str(wh)];
legend('Pitch measure', 'Pitch set-point');
grid on