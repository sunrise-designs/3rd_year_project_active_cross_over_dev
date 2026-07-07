function [ inside_polygon ] = is_inside_polygon(point, surface)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
% Find number of points defining the surface
% Number of lines connecting the points will be the same
[c num]=size(surface.x); 
% We will trace the line from intersection point to the middle of one of
% the surface edges

check_point(1)=(surface.x(2)-surface.x(1))/2; % x
check_point(2)=(surface.y(2)-surface.y(1))/2; % y
check_point(3)=(surface.z(2)-surface.z(1))/2; % z
plane=Plane_3P_to_scalar(surface.x(1:3),surface.y(1:3),surface.z(1:3));
% Need to compare magnitudes of A B and C
if abs(plane.A)==max([abs(plane.A),abs(plane.B),abs(plane.C)]) % throw away x
    u=surface.y;
    v=surface.z;
    pu=point(2);
    pv=point(3);
    c_pu=check_point(2);
    c_pv=check_point(3);
   % disp('Throw away x');
elseif abs(plane.B)==max([abs(plane.A),abs(plane.B),abs(plane.C)]) % throw away y
    u=surface.x;
    v=surface.z;
    pu=point(1);
    pv=point(3);
    c_pu=check_point(1);
    c_pv=check_point(3);
   % disp('Throw away y');
elseif abs(plane.C)==max([abs(plane.A),abs(plane.B),abs(plane.C)]) % throw away z
    u=surface.x;
    v=surface.y;
    pu=point(1);
    pv=point(2);
    c_pu=check_point(1);
    c_pv=check_point(2);
    %disp('Throw away z');
end
%fprintf('Plane intersection point x=%f y=%f',pu,pv);
% so we're transformed 3 dimensional surface and a point into 2 
% dimensional plane problem, in coordinates u and v
    intersections=0;
    line.x1=pu;
    line.y1=pv;
    line.x2=c_pu;
    line.y2=c_pv;
    
    dx1=c_pu-pu;
    dy1=c_pv-pv;
    
    for N=1:num
    % wrapping round
    next_point=N+1;
    
    if (N==num)
        next_point=1;
    end
    % for each edge(segment) we need to work out if a random line from the point
    % crosses it
    
    segment.x1=u(N);
    segment.y1=v(N);
    segment.x2=u(next_point);
    segment.y2=v(next_point);
    [intersect_u intersect_v]=Intersection_line_segment(line,segment);
    dx2=intersect_u-pu;
    dy2=intersect_v-pv;
    % if sign of dx1 and dx2 is different or
    % sign of dy1 and dy2 is different than don't count as intersection
    % but first check if they are NaN
    if isnan(dx2)
        dx2=0;
    end
    if isnan(dy2)
        dy2=0;
    end
    if (sign(dx1)~=sign(dx2)) || (sign(dy1)~=sign(dy2))
        continue;
    end
    
    if isnan(intersect_u)
        % disp('Do not intersect');
        continue;
    else
       % disp('Intersection!!!!!!!!!');
       
       
       intersections=intersections+1;
      % fprintf('Intersection count %d on the plane',intersections,N);
    end
end

if (mod(intersections,2)==1)
    inside_polygon=true;
    %disp('Inside');
else
    inside_polygon=false;
    %disp('Outside');
end

    
    

end

