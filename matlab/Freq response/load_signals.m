% if exist('x','var')==0
x=wavread('xt96.wav');
x=x';
% end
% if exist('x1','var')==0
%    x1=wavread('lp 96 2.wav');
%       x1=wavread('xt96.wav');
%  x1=wavread('sc 7.wav');
 x1=wavread('shelf 96 1.wav');
% x1=y1;
% x1=x1(1:750000);
x1=x1';
% end

t=0:T:(length(x)/Fs)-T;

%  rec_delay=64; %to correct for phase shift resulting from recording
%  x=[x(rec_delay:end) zeros(1,rec_delay-1)];
  
%   n=1:1:length(x1);
% plot(n,x,n,x1);

fmin=30;
fmax=22E3;
Nf=1000;
frequencies=logspace(log10(fmin),log10(fmax),Nf);
phase=zeros(1,Nf);
phase_cor=zeros(1,Nf);
for k=1:Nf
fc=frequencies(k);
wc=fc*2*pi;
N=2;
tc=log(fc/22)/0.4605; %actually ln()
period=1/fc;
t_start=tc-N*period;
t_stop=tc+N*period;
%now convert to sample numbers
s_start=round(t_start/Ts);
s_stop=round(t_stop/Ts);


phase(k)=Compute_Phase(x(s_start:s_stop),x1(s_start:s_stop),fc,Fs);
phase_cor(k)=wc*(64/Fs);
end

% figure; 
%    ref_phase=phase;


%  semilogx(frequencies,unwrap1(phase),frequencies,unwrap1(ref_phase));
  semilogx(frequencies,(unwrap1(phase)-unwrap1(ref_phase))*180/pi);
  grid on;
%  semilogx(frequencies,phase-ref_phase);
%   semilogx(frequencies,unwrap1(phase));
xlim([10 10000]);




