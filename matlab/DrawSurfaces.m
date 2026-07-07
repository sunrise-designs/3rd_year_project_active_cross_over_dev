function [  ] = DrawSurfaces( room )
%draws all the surfaces defined in the room
[c num]=size(room.surfaces);
for i=1:num
    patch(room.surfaces(i).x,room.surfaces(i).y,room.surfaces(i).z,'w');
end
hold
[x,y,z]=sphere;
factor=0.1;
x=x*factor;
y=y*factor;
z=z*factor;
surf(x+room.receiver.position(1),y+room.receiver.position(2),z+room.receiver.position(3))
set(gca,'XDir','reverse');
alpha(0.5);
view([-160 25]);
plot3(room.source.position(1),room.source.position(2),room.source.position(3),'marker','o','MarkerSize',10,'MarkerFaceColor','r');
plot3(room.receiver.position(1),room.receiver.position(2),room.receiver.position(3),'marker','o','MarkerSize',10,'MarkerFaceColor','g');
hold
end

