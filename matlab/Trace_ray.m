function [checked_rays ] = Trace_ray(room,ray_table)
%Bounces the ray around until it decays to a certain value
% do it 10 times for now
format short;
hits=0;
%allow for up to 200 rays that hit
checked_rays=zeros(10000,3);
%ray_table=Ray_angle_array(room);

number_of_rays=max(size(ray_table))
one_percent=round(number_of_rays/100);
for a=1:number_of_rays
    colour=[rand(1) rand(1) rand(1)];
    new_ray.line.R0=room.source.position;
    new_ray.line.Rd=ray_table(a,:);
    surface_i=10000;
    if mod(a,one_percent)==0
        fprintf('%d percent complete...\n\r',a/one_percent);
    end
    for i=1:20
        
        if Sphere_intersection(new_ray.line.R0,new_ray.line.Rd,room.receiver.position,0.05)
            hits=hits+1;
            %store the ray that hits with its original Rd
            %position is fixed so we dont need to store it
            checked_rays(hits,:)=ray_table(a,:);
            hits
        break; %go to the next ray
        end
        [end_point end_plane surface_i]=Bounce_ray(new_ray,room,surface_i,colour);
        if end_point==new_ray.line.R0
            break;
        end
        new_ray.line.R0=end_point;
        new_ray.line.Rd=Reflect_ray(new_ray.line.Rd,[end_plane.A end_plane.B end_plane.C]);
    end
    
end

end

