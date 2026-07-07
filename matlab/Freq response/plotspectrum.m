function [spectrum,fs] = plotspectrum(x,Fs,mode,ref)
NFFT=length(x);
f = Fs/2*linspace(0,1,round(NFFT/2)); %create plotting vector
% f_lim=round(30/(Fs/(NFFT/2)));
x(1:752)=0.0000001;
[C I]=max(abs(x));
dF=Fs/2/round(NFFT/2);

xn=x(1:round(NFFT/2));

%  
%   spectrum=20*log10(abs(xn)/max(abs(xn)));
%  max_tw=max(abs(xn))
max_tw= 2.5754e+003;
spectrum=20*log10(abs(xn)/max_tw);

% [c i]=max(abs(spectrum))
%% semi-octave smoothing
%let's try 1/96th octaves
%in general, f=f0*10^(0.3/96*1..96)
f0=22;
f1=22000;
w1=f0*2*pi;
w2=f1*2*pi;
Ts=1/Fs;
SemiOct=96;
Nmax=SemiOct/0.3*log10(f1/f0);
spec=zeros(1,Nmax);
T=25/2;
fs=zeros(1,Nmax);
for N=1:Nmax
fx1=f0*10^(0.3/SemiOct*(N-1));
fx2=f0*10^(0.3/SemiOct*N);
fs(N)=(fx1+fx2)/2;
ss1=round(fx1/dF);
ss2=round(fx2/dF); %sample numbers
spec(N)=sum(spectrum(ss1:ss2))/(ss2-ss1);
end

% plot(fs,spec);

% 
%  spec=spec-max(spec);
fc=find3(spec)
phase=angle(xn);


phase=unwrap(phase);
w=f*2*pi;
pc=w*(884/96E3);
%  figure(1);
%  plot(f,phase-unwrap(ref));
% xlim([50 22E3]);
% ylim([-5 5]);
figure(2);


if strcmp(mode,'lin')

 p=plot(f,abs(xn)/max(abs(xn)));
 
title('Amplitude Spectrum')
ylabel('Amplitude normalised')
xlabel('Frequency (Hz)')
set(gca,'XTick',0:1000:Fs/2)
xlim([20 round(Fs/2)])
end

if strcmp(mode,'dB')
p=plot(f,spectrum);
title('Amplitude Spectrum dB')
ylabel('Amplitude dB')
xlabel('Frequency (Hz)')
set(gca,'XTick',0:1000:Fs/2)
 mindB=20*log10(max(abs(xn))/min(abs(xn)))
mindB=round(mindB/10)*10;
set(gca,'YTick',-mindB:10:0);

xlim([20 round(Fs/2)])
end

if strcmp(mode,'loglog')
p=semilogx(fs,spec);

if fc>0
hold on
plot([fs(round(fc))],-3,'o','MarkerEdgeColor','green');
hold off
end
f_cutoff=fs(round(fc))
title('Amplitude Spectrum loglog')
ylabel('Amplitude dB')
xlabel('Frequency (Hz)')

ylim([-50 3]);
set(gca,'XTick',[20 30 40 50 60 70 80 90 100 200 300 400 500 600 700 800 900 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 12000 14000 16000 18000 22000]);
set(gca,'XTickLabel',{'20','30','40','50','60','','80','','100','200','300','400','500','600','','800','','1000','2K','3K','4K','5K','6K','','8K','','10K','12K','','16K','','22K'})
xlim([20 round(Fs/4)+100])
% mindB=20*log10(max(abs(xn))/min(abs(xn)))
% mindB=round(mindB/10)*10;
% set(gca,'YTick',-mindB:10:0);
end
set(p,'Color','blue','LineWidth',2)
grid on
end