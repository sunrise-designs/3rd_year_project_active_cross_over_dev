function [intersection_point] = Intersection_plane_line(plane,line)
% plane must be a structure with format:
% plane.A
% plane.B
% plane.C
% plane.D
% and line must be a structure with format
% line.R0 is the origin of the line
% line.Rd is normalised (unit) direction vector
vd=dot([plane.A plane.B plane.C],line.Rd);
if vd==0
    intersection_point(1)=NaN;
    return;
end
v0=-(dot([plane.A plane.B plane.C],line.R0)+plane.D);
t=v0/vd;
if t<0 
    intersection_point(1)=NaN;
    return;
end
intersection_point(1)=line.R0(1)+t*line.Rd(1);
intersection_point(2)=line.R0(2)+t*line.Rd(2);
intersection_point(3)=line.R0(3)+t*line.Rd(3);

end

