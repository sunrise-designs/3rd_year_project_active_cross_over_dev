function [ result_surfaces ] = MoveXYZ( surfaces ,X,Y,Z)
%Move a set of surfaces by XYZ
[c num]=size(surfaces);
for surf=1:num
    [c sz]=size(surfaces(surf).x);
    for i=1:sz
    surfaces(surf).x(i)=surfaces(surf).x(i)+X;
    surfaces(surf).y(i)=surfaces(surf).y(i)+Y;
    surfaces(surf).z(i)=surfaces(surf).z(i)+Z;
    end
end
result_surfaces=surfaces;

end

