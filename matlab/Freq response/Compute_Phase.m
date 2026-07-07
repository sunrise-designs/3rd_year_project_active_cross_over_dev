function [angle]= Compute_Phase(x,x1,f,Fs)
%requirements for x and x1:
%same frequency, arbitary phase difference
Ts=1/Fs;
t=0:Ts:(length(x)*Ts)-Ts;
w=2*pi*f;
T=1/f; %instantaneous frequency of the signal
deg90_delay=round((T/4)/Ts); %time delay corresponding to 90 phase shift, in samples
% x is local signal (original)

% x1 is modified signal with phase shift

quad=[x(deg90_delay:end) zeros(1, deg90_delay-1)]; %so we're effectively delaying the wave
I=x1.*x; %in-phase components
Q=x1.*quad; %original signal shifted by 90 degrees


% period of sinewaves squared
T=pi/w;
%%
wind_1=round(T/Ts);
wind_2=length(t)-wind_1-deg90_delay-1;
[max1 first_peak]=max(I(1:wind_1));
[max2 last_peak]=max(I(wind_2:length(t)-deg90_delay));
last_peak=wind_2+last_peak-1;



%%
[max3 first_peak1]=max(Q(1:wind_1));
[max4 last_peak1]=max(Q(wind_2:length(t)-deg90_delay));
last_peak11=wind_2+last_peak1-1;


%% Now maybe correct peaks
if (first_peak<first_peak1) && (last_peak1<last_peak)
    [max2 last_peak]=max(I(wind_2-wind_1:wind_2));
    last_peak=wind_2-wind_1+last_peak-1;
end

if (first_peak1<first_peak) && (last_peak<last_peak11)
   [max4 last_peak1]=max(Q(last_peak-wind_1:last_peak));
    last_peak11=last_peak-wind_1+last_peak1;
    
end



%%
% if last_peak>1
% last_peak=last_peak-1;
% end
% if first_peak>1
% first_peak=first_peak-1;
% end
% if first_peak1>1
% first_peak1=first_peak1-1;
% end
% if first_peak1>1
% last_peak11=last_peak11-1;
% end
I_DC=sum(I(first_peak:last_peak));
 Q_DC=sum(Q(first_peak1:last_peak11));

% I_DC=sum(I);
% Q_DC=sum(Q);



%%
angle=-atan(Q_DC/I_DC);
% degrees=angle*180/pi;
% if f>1140 && f<1150
% plot(t,x,t,x1);
%  hold
%  plot([wind_1*Ts wind_2*Ts ],[1 1],'o','MarkerEdgeColor','red');
%  plot([first_peak*Ts last_peak*Ts ],[max1 max2  ],'o','MarkerEdgeColor','blue');
%  plot([first_peak1*Ts last_peak11*Ts ],[max3 max4  ],'o','MarkerEdgeColor','green');
%  hold off
% end
end