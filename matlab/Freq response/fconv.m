function imp = fconv(x,h)

%  xl=[x zeros(1,length(x)-1)]; %zero pad the input vectors to avoid circularconvolution
%  hl=[h zeros(1,length(h)-1)];
% xl=x;
% hl=h;
XL=fft(x);
HL=fft(h);
YL=XL.*HL; %frequency domain multiplication performs time domain convolution
imp=ifft(YL);
imp=imp/max(abs(imp));%Normalize


end
