clear all;
close all;
T = 1;%(2^N)/fs;
f1=20; %starting frequency
f2=20000; %ending frequency
fs=44100;
% Create the swept sine tone
w1 = 2*pi*f1;
w2 = 2*pi*f2;
K = T*w1/log(w2/w1); %parameter for creating the sweep
L = T/log(w2/w1); %%parameter for creating the sweep
t = linspace(0,T-1/fs,fs*T); %time vector
s = sin(K*(exp(t/L) - 1)); %sweep vector
LT=length(s);
%Create Inverse Filter: Ideally is the reverse of the sweep with a slope of
%20dB per decade (6dB per octave) to compensate for the difference in
%energy at low and high frequencies
%
%Our inverse filter is missing amplitude scaling and does not have a
%perfect 20dB per decade slope
x=linspace(f1,f2,length(s)); %This inverse filter is not perfect
slope=fliplr(x).^3; % but is sufficient to prove the method works
sinv=slope.*fliplr(s); %Create the inverse filter
sinv=sinv./max(sinv); %normalize the inverse filter
SINV=fft(sinv);
%====================================================================
% Different approach to inverse filter (based on eq (7) report)
%====================================================================
% f_range=linspace(f1,f2,length(s)); %This inverse filter is not perfect
% A = f1;
% m = f1./f_range; % modulating function (8)
% s_rev=fliplr(s); %time reveresal of s
% sinv2 = m'*s_rev;
2
% sinv2=sinv2./max(sinv); %normalize the inverse filter
% SINV2=fft(sinv2);
figure(1)
NFFT=LT;
S = fft(s);
f = fs/2*linspace(0,1,NFFT/2); %create plotting vector
subplot(2,1,1), loglog(f,abs(S(1:NFFT/2)/max(abs(S)))) % Plot single-sided amplitude spectrum of the sweep
title('Amplitude Spectrum of the Exponential Sine Sweep')
ylabel('Amplitude (dB)')
xlabel('Frequency (Hz)')
subplot(2,1,2), loglog(f,abs(SINV(1:NFFT/2))/max(abs(SINV))) % Plot singlesided amplitude spectrum of inverse filter
title('Amplitude Spectrum of the Inverse Filter')
ylabel('Amplitude (dB)')
xlabel('Frequency (Hz)')



figure(2)
subplot(2,1,1), plot(s)
title('Exponential Sine Sweep')
ylabel('Amplitude')
xlabel('Frequency (Hz)')
subplot(2,1,2), plot(sinv)
title('Exponential Sine Sweep Inverse Filter')
ylabel('Amplitude')
xlabel('Frequency (Hz)')
SINV=fft(sinv);
%convolve sweep and inverse