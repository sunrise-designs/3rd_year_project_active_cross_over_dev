tic;
%DrawSurfaces(room);
%hold;
%rays=Trace_ray(room,Ray_angle_array(room));

[imp, dist,time_axis]=Trace_ray_acoustic(room,rays1,f);
toc