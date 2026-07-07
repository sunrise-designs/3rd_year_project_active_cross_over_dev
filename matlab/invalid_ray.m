format short;
DrawSurfaces(room);
hold;
new_ray.line.R0=[4 2.5 1];
new_ray.line.Rd=[1 1 0];
surface_i=10000;

for i=1:20
  i
    [end_point end_plane surface_i]=Bounce_ray(new_ray,room,surface_i);
    if end_point==new_ray.line.R0
        disp('Haha caught you!');
    break;
    end
    
    new_ray.line.R0=end_point;
    new_ray.line.R0
    new_ray.line.Rd=Reflect_ray(new_ray.line.Rd,[end_plane.A end_plane.B end_plane.C])
end
