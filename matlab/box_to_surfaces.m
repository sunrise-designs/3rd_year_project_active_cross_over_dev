function [surfaces] = box_to_surfaces(X,Y,Z)
%Box to xyz coordinates of 6 surfaces
%inputs: x,y,z dimensions of the box in meters
%outputs: 6 xyz arrays size 4
%X=5;
%Y=3;
%Z=3.2;
%floor
surfaces(1).x=[0 X X 0];
surfaces(1).y=[0 0 Y Y];
surfaces(1).z=[0 0 0 0];
%ceiling
surfaces(2).x=[0 X X 0];
surfaces(2).y=[0 0 Y Y];
surfaces(2).z=[Z Z Z Z];
%1st (left) wall
surfaces(3).x=[0 0 0 0];
surfaces(3).y=[0 0 Y Y];
surfaces(3).z=[0 Z Z 0];
%2nd (front) wall
surfaces(4).x=[0 X X 0];
surfaces(4).y=[Y Y Y Y];
surfaces(4).z=[0 0 Z Z];
%3rd (right) wall
surfaces(5).x=[X X X X];
surfaces(5).y=[0 0 Y Y];
surfaces(5).z=[0 Z Z 0];
%4th (back) wall
surfaces(6).x=[0 X X 0];
surfaces(6).y=[0 0 0 0];
surfaces(6).z=[0 0 Z Z];
