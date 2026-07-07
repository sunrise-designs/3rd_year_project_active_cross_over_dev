w1=2*pi*10; %10Hz
w2=2*pi*Fs/2; %20KHz
T=5; % duration 5s

K=w1*T/log(w2/w1);
L=T/log(w2/w1);
Fs=96000;
Ts=1/Fs;
nBits=16;
t=0:Ts:T;
x=sin(K*exp(t/L-1))*0.1;
plot(t,x);
plot(abs(fftshift(x)));
stimulus = audioplayer(x, Fs, nBits,0);
% playblocking(stimulus);
