function [ Is_Planar] = Is_Planar(X,Y,Z)
%X, Y and Z are arrays of corrdinates (float), all of the same size
% and minimum size 3.
[m,sX]=size(X);
[m,sY]=size(Y);
[m,sZ]=size(Z);
if (sX~=sY || sY~=sZ || sZ~=sX)
   error('Arrays are not equal');
   return
end

if (sX<3)
    error('Arrays are too small, min 3 elements');
    return
end

v1=[X(2)-X(1),Y(2)-Y(1),Z(2)-Z(1)];
v2=[X(3)-X(1),Y(3)-Y(1),Z(3)-Z(1)];

vcheck=cross(v1,v2);
Is_Planar=true;
%if for some reason we only have 3 points 
%they are always in the same plane
if sX==3  
    return;
end
    
for i=4:sX    
    v=[X(i)-X(1),Y(i)-Y(1),Z(i)-Z(1)]
    if (dot(vcheck,v)~=0)
        Is_Planar=false;
        %disp('Not planar');
        return;
    end
end
%disp('Planar');

end

