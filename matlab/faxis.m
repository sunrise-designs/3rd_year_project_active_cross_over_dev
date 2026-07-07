function y = faxis( s )
%Creates a frequency axis
f=(0:127)*s/128;
y=[f(65:128)-s f(1:64)];


end

