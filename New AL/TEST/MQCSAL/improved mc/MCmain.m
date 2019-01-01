load('data.mat');
color={'r','b','c','y','m','g'};

for i=1:size(data,1)
    plot(data(i,:),'-o','color',color{1,i},'LineWidth',4);
    hold on
end
axis([0.5,10.5,-0.5,6.5]);
legend('50 sample 2 list','75 sample 3 list','100 sample 4 list','50 sample 5 list','75 sample 6 list','100 sample 7 list');
set(gca,'xticklabel',{'t1=0','t1=1','t1=2','t1=3','t1=4','t1=5','t1=6','t1=7','t1=8','t1=9'})
title('\fontsize{10}The difference between improved Markov Chain method and conventional one ')
xlabel('Sample selection number');