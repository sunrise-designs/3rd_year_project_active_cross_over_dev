function [t ess inv]=gen_ess()
%% Generate basic exp sine swept signal
T = 15; %15 seconds
f1=22; %starting frequency
f2=22000; %ending frequency
fs=96000;
Ts=1/fs;
% Create the swept sine tone
w1 = 2*pi*f1;
w2 = 2*pi*f2;
K = T*w1/log(w2/w1); %parameter for creating the sweep
L = T/log(w2/w1); %%parameter for creating the sweep

t = 0:Ts:T-Ts;
ess=sin(K*(exp(t/L) - 1)); %sweep vector

%% Now apply hanning window

Tw=0.1; %windowed length 0.1s
Nw=round(Tw/Ts)*2;
if mod(Nw,2)==1 %make sure windows is even length
    Nw=Nw+1;
end

n=0:1:Nw-1;
wn=0.5*(1-cos(2*pi*n/(Nw-1)));
hw=Nw/2; %half-window length
ess(1:hw)=ess(1:hw).*wn(1:hw); %first half of the window
ess(end-hw:end)=ess(end-hw:end).*wn(hw:end); %second half of the window

%% Generate inverse filter
% Apply amplitude scaling first
%-6dB per octave, final attenuation -6dB*ln(w2/w1)

wt=w1*exp(t./T*log(w2/w1));
%we need attenuation of 0dB (10^0) at w1
% and -6dB per doubling of frequency, 
atten=10.^(-log2(wt/w1)*3/10);
inv=ess(end:-1:1);
inv=inv.*atten;
inv=inv(end:-1:1);
semilogx(wt./(2*pi),atten);



%% Add silence
T_silence=10;
T=25;
N_silence=round(T_silence/Ts);
ess=[ess zeros(1,N_silence)];
inv=[inv zeros(1,N_silence)];
t = 0:Ts:T-Ts;

%% Normalise to -6db
ess=ess./2;
inv=inv./max(inv)./sqrt(2);





end