%%
assignin('base','wb',1e-4);
assignin('base','wh',1e-2);
sim('../Models/Quadrotor_Controller.slx');
figure(1);
hold on
plot(Altitude_Meas.Time,Altitude_Meas.Data,'--');
itae1=num2str(itae.Data(end));
%legend('wh=2e-3');
grid on
%%
assignin('base','wb',1e-4);
assignin('base','wh',1e-1);
sim('../Models/Quadrotor_Controller.slx');
figure(1);
hold on
plot(Altitude_Meas.Time,Altitude_Meas.Data,'-');
itae2=num2str(itae.Data(end));

legend(['ITAE=' num2str(itae1)],['ITAE=' num2str(itae2)]);
%legend('wh=3e-3');

% grid on
% figure(2);
% hold on
% plot(itae.Time,itae.Data,'-');
% %legend('wh=3e-3');
% grid on


