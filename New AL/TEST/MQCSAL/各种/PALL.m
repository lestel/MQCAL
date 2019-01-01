load('all2.mat');
name={'Random';'Dissimilarity';'TED';'MarginRBF';'QBC';'MarginBays';'Di,MB';'TED,MB';'MB,MR';'MB,QBC';'Di,TED,MB';'Di,TED,QBC';'Di,QBC,MB';'MB,TED,QBC';'Di,QBC,MB,TED';'Di,QBC,MB,TED,MR'};
    
figure

color={[0,0,0],...      %ºÚ
       [255,0,0]/255,...%ºì
       [255,0,255]/255,...%·Û  
       [0,0,255]/255,...%À¶     
       [255,255,0]/255,...%»Æ
       [0,255,255]/255,...%Çà
       [0,255,0]/255,...%ÂÌ
       [255,255,0]/255,...%»Æ
       [135,51,36]/255,...%¿§ 
       [160,32,240]/255,...%×Ï
       [192,192,192]/255 ...%»Ò
      [255,128,0]/255, ...%éÙ
       };
%way_choose=[1,3];%Di,MB
%way_choose=[1,2,6,7];%Di,MB
%way_choose=[1,3,6,8];%TED,MB
%way_choose=[1,5,6,10];%MB,QBC
%way_choose=[1,2,5,6,13];%Di,QBC,MB
%way_choose=[1,3,5,6,14];%MB,TED,QBC
%way_choose=[1,2,3,6,11];%Di,TED,MB
%way_choose=[1,2,3,5,12];%Di,TED,QBC
way_choose=[1,7,13,15,16];%Di,TED,QBC
%way_choose=[1,4,6,9];%MR,M
%[1,3,5,14,15]
sample_choose=1:1:98;N=3;
experiment_result_performance=result_show(experiment_result_type,way_choose,10);






F1measure=experiment_result_performance.F1measure(:,sample_choose);

for i=1:N
    plot(sample_choose,F1measure(i,:),'--','color',color{1,i},'LineWidth',4);
    hold on
end
for i=N+1:size(F1measure,1)
    plot(sample_choose,F1measure(i,:),'color',color{1,i},'LineWidth',4);
    hold on
end
axis([0,100,0.7,1]);

title('\fontsize{10}MQCAL with various combination of sample query criteria (F1)')
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
    plot(sample_choose,accuracy(i,:),'--','color',color{1,i},'LineWidth',4);
    hold on
end
for i=N+1:size(accuracy,1)
    plot(sample_choose,accuracy(i,:),'color',color{1,i},'LineWidth',4);
    hold on
end
axis([0,100,0.7,1]);

title('\fontsize{10}MQCAL with various combination of sample query criteria (Acc)')
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


