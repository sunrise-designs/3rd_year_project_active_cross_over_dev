function [ out_spectrum ] = Correct_phase(freq,spectrum, distance)
%speed of sound in air, m/s
c=341;
N=max(size(spectrum))

out_spectrum=zeros(1,N);
%out_spectrum(1,:)=complex(0,0);

for i=1:N
f=freq(i);
phase=exp(1i*distance*f/c*2*pi);
out_spectrum(i)=complex(spectrum(i),0)*phase;
end

    

end

