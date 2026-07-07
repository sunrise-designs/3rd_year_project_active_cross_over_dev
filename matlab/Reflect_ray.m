function [ R_inverted] = Reflect_ray(Rd,normal)
%Reflects a vector geometrically
%Given the propagation vector and normal to the surface of reflection
R_inverted=Rd-2*(dot(Rd,normal)*normal);

end

