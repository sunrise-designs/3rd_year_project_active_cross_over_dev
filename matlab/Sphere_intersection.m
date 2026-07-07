function [ does_intersect ] = Sphere_intersection(R0,Rd,S0,Sr)
%R0 and Rd origin and direction vector of a line
%Rd must be normalised
%S0 is the centre of the sphere
%Sr is the radius of the sphere
%1. B=2*(Xd*(X0-Xc)+Yd*(Y0-Yc)+Zd*(Z0-Zc))
B=2*(Rd(1)*(R0(1)-S0(1))+Rd(2)*(R0(2)-S0(2))+Rd(3)*(R0(3)-S0(3)));
%2. C=(X0-Xc)^2+(Y0-Yc)^2+(Z0-Zc)^2-Sr^2;
C=(R0(1)-S0(1))^2+(R0(2)-S0(2))^2+(R0(3)-S0(3))^2-Sr^2;
%3. Calculate discriminant
if (B^2-4*C)>0
    does_intersect=true;
else
    does_intersect=false;
end
end

