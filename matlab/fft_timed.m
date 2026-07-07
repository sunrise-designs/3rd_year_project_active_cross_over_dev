tic
%1. Sample rate
Fs=44100;
%2. Sample period
Ts=1/Fs;
%3. Number of samples
N=882; % to give nice 25 Hz freq resolution
%4 Sample length
L=Ts*N;
%5. Corresponding time axis
t=(0:(N-1))*L/N;
%6. Corresponding frequency axis
f=(0:(N-1))*Fs/2/N; %up to Fs/2

%7. Create Hamming window
k=0:(N-1);
w = 0.53836 - 0.46164*cos(2*pi*k/(N-1));


%7. Create a test signal 1KHz and 5KHz
y=2*sin(2*pi*1000*t)+cos(2*pi*20000*t);
subplot(2,2,1);
plot(t,y);
%8. Window the signal
y=y.*w;
subplot(2,2,2);
plot(t,y);
Y=abs(fft(y)/N);
%Y=fftshift(Y);
subplot(2,2,3);
plot(f,[Y(1:(N/2)) zeros(1,N-(N/2))]);
%h=get(gcf,'CurrentAxes');
%set(h,'XLim',[0 100]);
disp('For 250 Hz');
f(round(250/(max(f)/N)+1))

disp('For 1000 Hz');
f(round(1000/(max(f)/N)+1))

toc;