% addpath([pwd '\UtilityFunctions']);
% addpath([pwd '\QuadParts']);

BusDefinitions
%load('BusDefinitions.mat')
% load('PropellerState.mat')
% load('VehicleStates.mat')
DesktopMode=Simulink.Variant('HIL==0 && Desktop==1');
HILMode=Simulink.Variant('HIL==1 && Desktop==0');
Desktop=1;
HIL=0;
mass = 4.493;
L = 68/1000; %m
G = 80/12;
Jp = 1.46e-3;
Ixx = 0.177;
Iyy = 0.177;
Izz = 0.334;
J = [Ixx 0 0;0 Iyy 0;0 0 Izz];
Rp = 38/1000; %m
P =  45*pi/180;
V = 5;
R = 0.3;
kt = 0.8;
kd = 0.0013;
ki = 3.87e03;
kv = 0.0004;
kr = 0.35;
ks = 1;
ku = 1;
Kr = kr;
rho = 1.229; %kg/m3
Ap = 12/1000*Rp*2; %12/1000m wide * Rpmm long * 2 per prop 
Kv = kv;
Ks = ks;
Ku = ku;

Roll_0 = 0;
Pitch_0 = 0;
Yaw_0 = 0;
