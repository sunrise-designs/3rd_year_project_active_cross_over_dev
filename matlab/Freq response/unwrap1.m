function [phase1]= unwrap1(phase)
n=length(phase);
dp=pi/2+0.000001;
for i=1:n-1
diff=phase(i+1)-phase(i);
if abs(diff)>dp % if we detect a phase jump
% we either shift the rest of phase vector up:
if (diff)<0 %if goes from -pi/2 to pi/2
phase(i+1:end)=phase(i+1:end)+ones(1,n-i)*abs(diff);
end
if (diff)>0
phase(i+1:end)=phase(i+1:end)-ones(1,n-i)*abs(diff);
end

end
phase1=phase;
end