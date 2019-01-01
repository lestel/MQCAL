load('Ps.mat');
name={'Random';'Dissimilarity';'Multiview';'Margin';'QBC';'Di,Mu';'Di,QBC';'Di,Un';'Di,Mu,QBC';'Di,Mu,Un';'Di,QBC,Ma';'Di,Mu,QBC,Un';'Mu,QBC';'Mu,Un';'Mu,QBC,Un';'QBC,Un'};
    


color={[0,0,0],...      %ºÚ
       [255,0,0]/255,...%ºì
       [255,255,0]/255,...%»Æ
       [255,0,255]/255,...%·Û
       [0,0,255]/255,...%À¶
       [0,255,0]/255,...%ÂÌ
       [160,32,240]/255,...%×Ï
       [0,255,255]/255,...%Çà
       [135,51,36]/255,...%¿§ 
       [255,128,0]/255, ...%éÙ
       [192,192,192]/255 ...%»Ò
      
       };
way_choose=[1,2,4,5,11];
%[1,2,3,5,6,7,10,11,12,11]
sample_choose=1:1:98;N=4;
experiment_result_performance=result_show(experiment_result_type,way_choose,5);






F1measure=experiment_result_performance.F1measure(:,sample_choose);

for i=1:N
    plot(sample_choose,F1measure(i,:),'--','color',color{1,i},'LineWidth',3);
    hold on
end
for i=N+1:size(F1measure,1)
    plot(sample_choose,F1measure(i,:),'color',color{1,i},'LineWidth',3);
    hold on
end
axis([0,100,0.8,1]);

title('\fontsize{10}MQCAL with both certainty and committee based sample query criteria (F1)')
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
    plot(sample_choose,accuracy(i,:),'--','color',color{1,i},'LineWidth',3);
    hold on
end
for i=N+1:size(accuracy,1)
    plot(sample_choose,accuracy(i,:),'color',color{1,i},'LineWidth',3);
    hold on
end
axis([0,100,0.8,1]);

title('\fontsize{10}MQCAL with both certainty and committee based sample query criteria (Acc)')
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


