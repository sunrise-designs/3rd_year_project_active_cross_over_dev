function [numd,dend] = Verify(num,den,Fs)
% S domain num and den
T=1/Fs;
f=logspace(1,log10(Fs/2),1000); %1000 points between 10Hz and Fs/2 Hz
w=f*2*pi;
hw=freqs(num,den,w);
Fp=2/T*tan(13000*T/2);
[numd dend]=bilinear(num,den,Fs);
[hd1 wn]=freqz(numd,dend);
semilogx(f,20*log10(abs(hw)),'b');
hold on
semilogx(wn/pi*Fs/2,20*log10(abs(hd1)),'g');
grid on







end

