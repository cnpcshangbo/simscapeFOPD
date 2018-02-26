%%
assignin('base','wb',1e-3);
assignin('base','wh',1e7);
sim('../Models/Quadrotor_Controller.slx');
figure(1);
hold on
plot(Altitude_Meas.Time,Altitude_Meas.Data,'--');
itae1=[num2str(itae.Data(end),10) ',wb=' num2str(wb) ',wh=' num2str(wh)];
%legend('wh=2e-3');
grid on
%%
assignin('base','wb',1e-10);
assignin('base','wh',1e-9);
sim('../Models/Quadrotor_Controller.slx');
figure(1);
hold on
plot(Altitude_Meas.Time,Altitude_Meas.Data,'-');
itae2=[num2str(itae.Data(end),10) ',wb=' num2str(wb) ',wh=' num2str(wh)];

legend(['ITAE=' itae1],['ITAE=' itae2]);
%legend('wh=3e-3');

% grid on
% figure(2);
% hold on
% plot(itae.Time,itae.Data,'-');
% %legend('wh=3e-3');
% grid on


