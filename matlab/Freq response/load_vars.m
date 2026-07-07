f1=22; %starting frequency
f2=22000; %ending frequency
Fs=96000;
Ts=1/Fs;
% Create the swept sine tone
w1 = 2*pi*f1;
w2 = 2*pi*f2;
T=25;
t = 0:Ts:T-Ts;


 xt=wavread('xt 500.wav');
 inv=wavread('inv 500.wav');
% xt=wavread('xt96.wav');
% inv=wavread('inv96.wav');
[r c]=size(xt);
if r~=1 
    xt=xt';
end
[r c]=size(inv);
if r~=1 
    inv=inv';
end

NFFT=length(xt);
f = Fs/2*linspace(0,1,round(NFFT/2)); %create plotting vector
