load('matlab4.mat');
name={'Random';'Diveristy';'Entropy';'Marginrbf';'Uncertainty';'Di,En';'Di,Ma';'Di,Un';'Di,En,Ma';'Di,En,Un';'Di,Ma,Un';'Di,En,Ma,Un';'Di,En';'Di,Ma';'Di,Un';'Di,En,Ma';'Di,En,Un';'Di,Ma,Un';'Di,En,Ma,Un';'Di,En';'Di,Ma';'Di,Un';'Di,En,Ma';'Di,En,Un';'Di,Ma,Un';'Di,En,Ma,Un';'Di,En';'Di,Ma';'Di,Un';'Di,En,Ma';'Di,En,Un';'Di,Ma,Un';'Di,En,Ma,Un';};
    


color={[0,0,0],...      %ºÚ
       [255,0,0]/255,...%ºì
       [255,0,255]/255,...%·Û
       [255,255,0]/255,...%»Æ
       [0,0,255]/255,...%À¶
       [0,255,255]/255,...%Çà
       [160,32,240]/255,...%×Ï
       [255,255,0]/255,...%»Æ
       [135,51,36]/255,...%¿§ 
       [0,255,0]/255,...%ÂÌ
       [255,128,0]/255, ...%éÙ
       [192,192,192]/255 ...%»Ò
      
       };
way_choose=[1,2,4,5,20,21,25];
%[1,2,3,4,5,6,7,13]
sample_choose=2:3:98;N=4;
experiment_result_performance=result_show(experiment_result_type,way_choose,5);






F1measure=experiment_result_performance.F1measure(:,sample_choose);

for i=1:N
    plot(sample_choose,F1measure(i,:),'--','color',color{1,i},'LineWidth',2.5);
    hold on
end
for i=N+1:size(F1measure,1)
    plot(sample_choose,F1measure(i,:),'color',color{1,i},'LineWidth',2.5);
    hold on
end
axis([0,100,0.6,1]);

title('\fontsize{10}Markov Chain based MQCAL with more criteria(F1)')
%set(gca,'xtick',[]);
set(gca,'xticklabel',0:3:30);
ylabel('F1measure');
xlabel('The percent of labeling');

name_j='legend(';
for i=1:length(way_choose)
    if i~=length(way_choose)
    name_j=[name_j,'''',name{way_choose(i)},''','];
    else
    name_j=[name_j,'''',name{way_choose(i)},''',4)'];
    end
end
%eval(name_j);
eval(name_j);

figure


accuracy=experiment_result_performance.accuracy(:,sample_choose);

for i=1:N
    plot(sample_choose,accuracy(i,:),'--','color',color{1,i},'LineWidth',2.5);
    hold on
end
for i=N+1:size(accuracy,1)
    plot(sample_choose,accuracy(i,:),'color',color{1,i},'LineWidth',2.5);
    hold on
end
axis([0,100,0.6,1]);

title('\fontsize{10}Markov Chain based MQCAL with more criteria(Acc)')
%set(gca,'xtick',[]);
set(gca,'xticklabel',0:3:30);
ylabel('Accuracy');
xlabel('The percent of labeling');

name_j='legend(';
for i=1:length(way_choose)
    if i~=length(way_choose)
    name_j=[name_j,'''',name{way_choose(i)},''','];
    else
    name_j=[name_j,'''',name{way_choose(i)},''',4)'];
    end
end
%eval(name_j);
eval(name_j);

