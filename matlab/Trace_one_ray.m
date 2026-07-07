function [ output_args ] = Trace_one_ray( input_args )
%
new_ray.line.R0=room.source.position;
    new_ray.line.Rd=ray_table(a,:);
    surface_i=10000;
    running_distance=0;
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
        end
        [end_point end_plane surface_i]=Bounce_ray(new_ray,room,surface_i);
        if end_point==new_ray.line.R0
            break;
        end
        new_ray.line.R0=end_point;
        new_ray.line.Rd=Reflect_ray(new_ray.line.Rd,[end_plane.A end_plane.B end_plane.C]);
    end

end

