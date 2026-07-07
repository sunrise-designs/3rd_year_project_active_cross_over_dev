function [impulse, dist,t_impulse] = Trace_ray_acoustic(room,ray_table,f)
%Bounces the ray around until it decays to a certain value
% do it 10 times for now
format short;
hits=0;

%impulse is in time domain
Ts=1/44100;
Ni=round(0.5/Ts);
t_impulse=(0:(Ni-1))*0.5/Ni; %generate 0.5s long impulse response
impulse=zeros(1,Ni);
ts=zeros(1500,2);


number_of_rays=max(size(ray_table))-1

for a=1:number_of_rays %for first 40 rays
    colour=[rand(1) rand(1) rand(1)];
    new_ray.line.R0=room.source.position;
    new_ray.line.Rd=ray_table(a,:);
    surface_i=10000;
    running_distance=0;
    new_ray.spectrum=ones(1,6);
    for i=1:20 %for first 20 reflections
        
        if Sphere_intersection(new_ray.line.R0,new_ray.line.Rd,room.receiver.position,0.05)
            hits=hits+1;
            %store the ray that hits with its original Rd
            %position is fixed so we dont need to store it
              
        running_distance=running_distance+Distance(room.receiver.position,new_ray.line.R0);
        ts(hits,1)=running_distance;
        yt=Process_spectrum_to_time(new_ray.spectrum,f,running_distance);
         start_t=running_distance/341;
         start_s=round(start_t/Ts);
         ts(hits,2)=start_s;
         len=max(size(yt));
        impulse(start_s:(start_s+len-1))=impulse(start_s:(start_s+len-1))+yt;
        
        
        break; %move on to the next ray!
        end
        [end_point end_plane surface_i pass_distance]=Bounce_ray(new_ray,room,surface_i,colour);
        running_distance=running_distance+pass_distance;
                % ray got stuck in one place = shoulnt have any of those
              
        material_n=room.surfaces(surface_i).material;
        new_ray.spectrum=new_ray.spectrum.*(1-room.materials(material_n).absorption) ;       
        
        
        new_ray.line.R0=end_point;
        new_ray.line.Rd=Reflect_ray(new_ray.line.Rd,[end_plane.A end_plane.B end_plane.C]);
    end
    
end
dist=ts;
figure;
impulse=impulse/max(real(impulse));
plot(t_impulse,real(impulse));
%figure;
%plot(f,abs(fft(impulse)));

end

