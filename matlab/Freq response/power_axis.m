set(gca,'XTick',[10 20 30 40 50 60 70 80 90 100 200 300 400 500 600 700 800 900 1000 2000 3000 4000 5000]);
set(gca,'XTickLabel',{'10','20','30','40','50','60','','80','','100','200','300','400','500','600','','800','','1000','2K','3K','4K','5K'})
set(gca,'Ytick',-48:3:0);
grid on
set(gca,'FontSize',13);
h=get(gca,'title');
title('Woofer and tweeter individual responses');
ylabel('Amplitude (dB)')
xlabel('Frequency (Hz)')
set(h,'FontSize',17);