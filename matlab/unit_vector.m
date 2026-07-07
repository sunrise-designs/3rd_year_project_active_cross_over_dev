function [ uv ] = unit_vector( V )
%vector must be size 3
%Return unit vector of a given vector,(x y z)/magnitude
%where magnitude=sqrt(x^2+y^2+z^2)

[m,sX]=size(V);
if (sX~=3)
    error('Array is not of size 3');
    return
end
magnitude=sqrt(V(1)^2+V(2)^2+V(3)^2);
uv=[V(1)/magnitude,V(2)/magnitude,V(3)/magnitude];
end

