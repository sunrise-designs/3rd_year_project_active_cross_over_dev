
yt=wavread('tw 2.wav')';
if length(yt)<NFFT
    yt=[yt zeros(1,NFFT-length(yt))];
end
if length(yt)>NFFT
    yt=yt(1:NFFT);
end
imp=fconv(yt,inv);

IMP=fft(imp);

% NFFT=length(IMP);
% phase_ref1=angle(IMP(1:round(NFFT/2)));
% ref_phase=angle(IMP(1:round(NFFT/2)));

[spectrum fs]=plotspectrum(IMP,96000,'loglog',ref_phase);




