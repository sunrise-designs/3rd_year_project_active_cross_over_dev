function [ y_filt ] = CreateSeparationFilt( numl,denl,numh,denh,Fs)
figure;
[numdl dendl]=Verify(numl,denl,Fs);
figure;
[numdh dendh]=Verify(numh,denh,Fs);
impl=impz(numdl,dendl);
imph=impz(numdh,dendh);
if length(impl)>length(imph)
    imph=[imph' zeros(1,length(impl)-length(imph))]';
end
if length(impl)<length(imph)
    impl=[impl' zeros(1,length(imph)-length(impl))]';
end
y_filt=[imph impl];
        
        
      

end

