%% VRFT controller

num1=[36.3945e-3 1.3518e-3];
den1=[1 2.3580e-6];

num2=[32.9375e-003     1.5686e-003     5.1729e-006];
den2=[1.0000e+000     5.0241e-003     1.7839e-015];

ctf1=tf(num1,den1)
ctf2=tf(num2,den2)

ctf1d=c2d(ctf1,1,'tustin')
ctf2d=c2d(ctf2,1,'tustin')


numd3=[76.0766e-003   -72.9796e-003];
dend3=[1.0000e+000 -1000.0000e-003];

numd4=[33.6386e-003   -65.7074e-003    32.0739e-003];
dend4=[1.0000e+000    -1.9950e+000   994.9885e-003];
%Discretizado G1 nf=1.2 Ts =20 first-order
numd5=[271.3876e-003  -261.1775e-003];
dend5=[1.0000e+000  -999.9925e-003];
%Discretizado G1 nf=1.2 Ts =20 second-order
numd6=[5.3951e+000    -5.1911e+000];
dend6=[1.0000e+000  -999.9919e-003];

%discretizado G1 nf=1.2  Ts=1 first-order
numd7=[3.5401e+000    -4.9523e+000     1.4757e+000];
dend7=[     1.0000e+000    -1.6818e+000   681.8051e-003];

%discretizado G1 nf=1.2  Ts=1 second-order
numd8=[3.5401e+000    -4.9523e+000     1.4757e+000];
dend8=[1.0000e+000    -1.6818e+000   681.8051e-003];

%discretizado G1 Ts=0.1 nf=1.2 first-order
numd9=[54.1853e+000   -52.1448e+000];
dend9=[1.0000e+000  -999.9879e-003];

%discretizado G1 Ts=0.1 nf=1.2 second-order
numd10=[35.8390e+000   -50.7598e+000    15.5445e+000];
dend10=[1.0000e+000    -1.6881e+000   688.0579e-003];

%discretizado G1 Ts=0.1 nf=1.2 second-order
numd11=[3.08691206822950	-3.87889076570904	0.861851475619113];
dend11=[1	-1.65551041404534	0.655510428534770];

%first-order discretized new peltier driver camera ts=110s
% numd12=[2.4478e+000    91.3261e-003];
% dend12=[1.0000e+000     3.6735e-006];
% VRFTC=tf(numd12,dend12);
% VRFTD=c2d(VRFTC,1,'tustin')

%first-order discretized new peltier driver camera ts=20s
% numd12=[909.1340e-003    34.2766e-003];
% dend12=[1.0000e+000     3.4543e-006];
% VRFTC=tf(numd12,dend12);
% gSync=10;                %controller gain adjustment
% VRFTD=c2d(VRFTC,1,'tustin')

%first-order discretized new peltier driver camera ts=20s PRBS
numd12=[2.7563e+000    99.7088e-003];
dend12=[1.0000e+000   638.5571e-006];
VRFTC=tf(numd12,dend12);
gSync=2;                %controller gain adjustment
VRFTD=c2d(VRFTC,1,'tustin')


%second-order discretized new peltier driver camera
% numd12=[2.1278e+000   107.2445e-003   543.2045e-006];
% dend12=[1.0000e+000     6.6562e-003     6.3869e-012];
% VRFTC=tf(numd12,dend12);
% VRFTD=c2d(VRFTC,1,'tustin')



   

% %discretizado ts=30s
% num12=[ 9.539, 2.328];
% den12=[1 0.1032];  

% %discretizado ts=100s
%  num12=[5.7118e+000  -4.8897e+000];
%  den12=[1.0000e+000  -932.5581e-003];
% %discretizado ts=100s filtro 12
% num12=[772.6502e-003  -481.5786e-003];
% den12=[1.0000e+000  -972.7821e-003];
 
%  num12=[6.8843e+000  -13.1649e+000    6.2873e+000];
%  den12=[1.0000e+000  -1.9736e+000   973.7840e-003];

%first order ref model Ts-90s
% numd12=[4.2952e+000   105.2641e-003];
% dend12=[1.0000e+000     1.4728e-003];

% %second order ref model Ts-90s with zero
% numd12=[4.6093e+000   160.1928e-003];
% dend12=[ 1.0000e+000     3.6781e-003];
%      
% %second order ref model Ts-90s
% numd12=[3.2160e+000   180.4135e-0033];
% dend12=[1.0000e+000     8.1664e-003];
%      
ctf3d=tf(numd3,dend3,1);
ctf4d=tf(numd4,dend4,1);
ctf5d=tf(numd5,dend5,1);
ctf6d=tf(numd6,dend6,1);   %worked at 30degC
ctf7d=tf(numd7,dend7,1);
ctf8d=tf(numd8,dend8,1);
ctf9d=tf(numd9,dend9,1);
ctf10d=tf(numd10,dend10,1);
ctf11d=tf(numd11,dend11,1);
ctf12d=tf(numd12,dend12,1);


%% feedforward configuration first-order
Ts=20;
wp=4/Ts; np=1.5;
s=tf('s');
M= wp/(s+wp);
na=3;
Md=c2d(M,1,'tustin');


%% feedforward configuration second-order
Ts=110 % deseado
wn=5.8335/Ts  
sg=1
ka=1
nf=2.5
na=3; % Ganancia adaptacion 
Tf= 1/(nf*wn) % tao con sigma=1

s=tf('s');
M= (wn^2*Tf*s+wn^2)/(s^2+2*wn*s+wn^2);
Md=c2d(M,1,'tustin');







