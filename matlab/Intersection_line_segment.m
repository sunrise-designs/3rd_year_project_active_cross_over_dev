function [ x y ] = Intersection_line_segment( line,segment)
%Find out if infinite line intersects a segment of a line
format short;    
A1=line.y2-line.y1; %y2-y1
    B1=line.x1-line.x2; %x1-x2
    C1=A1*line.x1+B1*line.y1;
    
    A2=segment.y2-segment.y1;
    B2=segment.x1-segment.x2;
    C2=A2*segment.x2+B2*segment.y2;
    
    
    det=A1*B2-A2*B1;
    if det==0 %lines are parallel
        x=NaN;
        y=NaN;
        return;
    end
    x=(B2*C1-B1*C2)/det;
    y=(A1*C2-A2*C1)/det;
    % Now we need to see if these x and y actually lie in the segment
    % line is infinite so it can be anywhere on the line, so we dont 
    % perform a check on the line
    %
        
%     x=single(x);
%     y=single(y);
%     segment.x1=single( segment.x1);
%     segment.x2=single( segment.x2);
%     segment.y1=single( segment.y1);
%     segment.y2=single( segment.y2);
   if x<min(segment.x1,segment.x2) || x>max(segment.x1,segment.x2)
           x=NaN;
           y=NaN;
                         
   end
                 
    if y<min(segment.y1,segment.y2) || y>max(segment.y1,segment.y2)
           x=NaN;
           y=NaN;
                 
     end
   
end

