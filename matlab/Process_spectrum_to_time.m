function [ time ] = Process_spectrum_to_time(spectrum,f,distance)
absorption_spectrum_points=[0 125 250 500 1000 2000 4000 8000 16000 max(f)];
%full absorption at DC
if spectrum(1)~=0
    spectrum=[0 spectrum];
end


%if max(size(spectrum))~=8
%    error('Spectrum size is not 8');
%end
%At 8KHz half of that at 4
spectrum(8)=spectrum(7)/2;
%at 16 and fmax = 0
spectrum(9)=spectrum(8)/2;
spectrum(10)=0;
full_spectrum=interp1(absorption_spectrum_points,spectrum,f,'cubic');
plot(f,full_spectrum);
c=341;
N=max(size(full_spectrum));

%out_spectrum=zeros(1,N);
%out_spectrum(1,:)=complex(0,0);
out_spectrum=full_spectrum;
% for i=1:N
% phase=exp(1i*distance*f(i)/c*2*pi);
% out_spectrum(i)=complex(full_spectrum(i),0)*phase;
% end


time=ifft([0 wrev(out_spectrum) out_spectrum]);
time=time(1:round(end/2));

end

