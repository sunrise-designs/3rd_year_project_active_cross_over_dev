function [ plane ] = Plane_3P_to_scalar(x,y,z)
%Takes coordinates of 3 points in the plane
%and returns A,B,C and D values of implicit
%plane equation of form:
%A*x+B*y+C*z+D=0
%and A^2+B^2+C^2=1 (normalised)

% [m,sx]=size(x);
% [m,sy]=size(y);
% [m,sz]=size(z);
% if (sx~=sy || sy~=sz || sz~=sx)
%    error('Arrays are not equal');
%    return
% end
% if (sx~=3)
%     error('Array are not of size 3');
%     return
% end

v1=[x(2)-x(1),y(2)-y(1),z(2)-z(1)];
v2=[x(3)-x(1),y(3)-y(1),z(3)-z(1)];

v_norm=cross(v2,v1);
v_unit_norm=unit_vector(v_norm);
plane.A=v_unit_norm(1);
plane.B=v_unit_norm(2);
plane.C=v_unit_norm(3);
plane.D=-dot(v_unit_norm,[x(1) y(1) z(1)]);
end

