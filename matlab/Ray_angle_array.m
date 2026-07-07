function [ rays ] = Ray_angle_array( room )
%returns Rd of the ray
horisontal_start_angle=0;
horisontal_end_angle=2*pi;

vertical_start_angle=0;
vertical_end_angle=2*pi;

hor_steps=360;
ver_steps=360;
horisontal_angle_step=(horisontal_end_angle-horisontal_start_angle)/hor_steps;
vertical_angle_step=(vertical_end_angle-vertical_start_angle)/ver_steps;
%+1 is for the direct path ray
rays=zeros(hor_steps*ver_steps+1,3);
%calculate the direct path ray, always first ray
rays(1,:)=unit_vector(room.receiver.position-room.source.position);
for ver=1:ver_steps
    ver_angle=vertical_start_angle+ver*vertical_angle_step;
    hor_projection=sin(ver_angle);
    dz=cos(ver_angle);
    for hor=1:hor_steps
    hor_angle=horisontal_start_angle+hor*horisontal_angle_step;
    dx=hor_projection*sin(hor_angle);
    dy=hor_projection*cos(hor_angle);
    Rd=[dx,dy,dz];
    rays((ver-1)*hor_steps+hor+1,:)=Rd;
    end
    
    
end

end

