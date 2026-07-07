function [end_point end_plane end_surface_index distance] = Bounce_ray(ray,room,start_surface_index,colour)
%bounces the ray once
[~, num]=size(room.surfaces);
% path_length_table structure:
%|   1    |     2:4    |     5:8     |      9       |
%|Distance| Point X Y Z|Plane A B C D| surface_index|
%num=6;
path_length_table=zeros(num,9);
% very large distance value, to ensure correct
%array sorting
path_length_table(1:end,1)=999; 
for N=1:num
    % do not check for the surface that ray was emitted from
    if N==start_surface_index
        continue;
    end
    % Get scalar representation of Nth surface
    plane=Plane_3P_to_scalar(room.surfaces(N).x(1:3),room.surfaces(N).y(1:3),room.surfaces(N).z(1:3));
    % See if this ray intersects with a surface
    i_point=Intersection_plane_line(plane,ray.line);
    % if it doesnt intersect go to next surface
    if isnan(i_point(1))
         continue;
    else
        %otherwise calculate the distance to the surface and save the
        %candidate surface
        path_length_table(N,1)=Distance(ray.line.R0,i_point);
        path_length_table(N,2:4)=i_point;
        path_length_table(N,5:8)=[plane.A plane.B plane.C plane.D]; % needed for reflecting the ray at later stage
        path_length_table(N,9)=N;
    end
end % end of the loop

%sort by distance
% as surfaces with least distance away from the ray origin are more likely
% to have polygons that contain the intersection point
path_length_table=sortrows(path_length_table,1); 

for i=1:num %and find first valid polygon
    surf_index=path_length_table(i,9);
    if (surf_index==0)
end_plane.A=0;end_plane.B=0;end_plane.C=0;end_plane.D=0;
end_point=ray.line.R0;
end_surface_index=0;
return;



    end
    
    if is_inside_polygon(path_length_table(i,2:4),room.surfaces(surf_index))==true
                break;
    end
   
   
    
    end
% i-th row will contain the valid surface index
distance=path_length_table(i,1);
index=path_length_table(i,9);
end_point=path_length_table(i,2:4); %extract the intersection point
end_surface_index=index;
end_plane.A=path_length_table(i,5);
end_plane.B=path_length_table(i,6);
end_plane.C=path_length_table(i,7);
end_plane.D=path_length_table(i,8);

%optionally plot the line
%i_point=end_point;
%plot3([ray.line.R0(1) i_point(1)],[ray.line.R0(2) i_point(2)],[ray.line.R0(3) i_point(3)],'Color',colour,'LineWidth',1);
   
end

