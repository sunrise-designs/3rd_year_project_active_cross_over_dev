function [i] = Find_index( value, array )
%Find the index of the element in array closest to the specified value
array=array-value;
[min_v i]=min(abs(array));

end

