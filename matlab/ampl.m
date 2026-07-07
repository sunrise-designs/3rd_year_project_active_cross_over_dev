function y = ampl( x )
%
[a b]=size(x);
if a>b
    x=x';
end
temp=abs(x);
y=[temp(65:128) temp(1:64)];

end

