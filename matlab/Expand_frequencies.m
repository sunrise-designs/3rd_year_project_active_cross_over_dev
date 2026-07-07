function [ out_spectrum ] = Expand_frequencies( spectrum, f)
%expands 6-point spectrum to end_size spectrum
%the 6 points are at 125, 250, 500, 1000, 2000, 4000 Hz
%f is the frequency vector
f_max=max(f)
N=max(size(f)) %say 1024
out_spectrum=zeros(1,N);
%find the nearest vector elements to these frequencies
indexes(1)=round(125/(f_max/N)+1);
indexes(2)=round(250/(f_max/N)+1);
indexes(3)=round(500/(f_max/N)+1);
indexes(4)=round(1000/(f_max/N)+1);
indexes(5)=round(2000/(f_max/N)+1);
indexes(6)=round(4000/(f_max/N)+1);
%from 0 to 125
for i=1:indexes(1)
    out_spectrum(i)=0+spectrum(1)*i/indexes(1);
end
%from 125 to 250
d=spectrum(2)-spectrum(1);
spacing=indexes(2)-indexes(1);
for i=indexes(1):indexes(2)
    pos=i-indexes(1);
        out_spectrum(i)=spectrum(1)+d*pos/spacing;
end
%from 250 to 500
d=spectrum(3)-spectrum(2);
spacing=indexes(3)-indexes(2);
for i=indexes(2):indexes(3)
    pos=i-indexes(2);
    out_spectrum(i)=spectrum(2)+d*pos/spacing;
end

%from 500 to 100
d=spectrum(4)-spectrum(3);
spacing=indexes(4)-indexes(3);
for i=indexes(3):indexes(4)
    pos=i-indexes(3);
    out_spectrum(i)=spectrum(3)+d*pos/spacing;
end

%from 1000 to 2000
d=spectrum(5)-spectrum(4);
spacing=indexes(5)-indexes(4);
for i=indexes(4):indexes(5)
    pos=i-indexes(4);
    out_spectrum(i)=spectrum(4)+d*pos/spacing;
end

%from 2000 to 4000
d=spectrum(6)-spectrum(5);
spacing=indexes(6)-indexes(5);
for i=indexes(5):indexes(6)
    pos=i-indexes(5);
    out_spectrum(i)=spectrum(5)+d*pos/spacing;
end

%from 4000 to f_max
d=0-spectrum(6);
spacing=N-indexes(6);
for i=indexes(6):N
    pos=i-indexes(6);
    out_spectrum(i)=spectrum(5)+d*pos/spacing;
end



end

