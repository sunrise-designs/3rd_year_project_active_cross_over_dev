function [fc] = find3( x1 )

tol=0.05;
diff=x1+3;
found_values=0;
found=zeros(1,length(x1));
for i=1:length(x1)-25
if abs(diff(i))<tol
found_values=found_values+1;
found(found_values)=i;
end
end
%now trim length of found
found=found(1:found_values)

% Now we have to sort thru all the indexes we found, to see if 
% they are in the same place, ie belong to the same fc point
max_index=max(found);
min_index=min(found);
% fc=0;
% if abs(max_index-min_index)>20 %more than 1 -3dB crossing, need to do something
    
% fc=1;
% else %just return the middle index value
fc=(max_index+min_index)/2;
% end

end

