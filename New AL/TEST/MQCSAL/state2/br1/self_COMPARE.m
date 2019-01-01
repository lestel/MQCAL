clc
clear
load('wdbc_our_result.mat');
name={'Random';'Diveristy';'QBC';'Un';'Di,Un';'Di,QBC,Un';'Random';'Diveristy';'QBC';'Un';'Di,Un';'Di,QBC,Un';'Random';'Diveristy';'QBC';'Un';'Di,Un';'Di,QBC,Un'};
    
way_choose=[1,2,3,4,5,6];
%[1,2,3,5,6,7,10,11,12,11]
sample_choose=1:1:60;N=4;
space=[0,60,0.3,1];
color={[0,0,0],...      %ºÚ
       [255,0,255]/255,...%·Û
       [0,255,255]/255,...%Çà
       [0,0,255]/255,...%À¶
       [135,51,36]/255,...%¿§ 
       [160,32,240]/255,...%×Ï
       [0,255,0]/255,...%ÂÌ
       [255,0,0]/255,...%ºì
       [255,255,0]/255,...%»Æ
       [128,128,128]/255 ...%»Ò
       %[255,128,0]/255, ...%éÙ
       %
       };


experiment_result_performance=result_show(experiment_result_type,way_choose,3);
%{
F1measure=experiment_result_performance.F1measure(:,sample_choose);

for i=1:N
    plot(sample_choose,F1measure(i,:),'--','color',color{1,i},'LineWidth',2.5);
    hold on
end
for i=N+1:size(F1measure,1)
    plot(sample_choose,F1measure(i,:),'color',color{1,i},'LineWidth',2.5);
    hold on
end
axis([0,80,0.45,1]);

title('\fontsize{10}MQCAL with both pool and stream sample query strategies (F1)')
%set(gca,'xtick',[]);
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

%}
accuracy=experiment_result_performance.accuracy(:,sample_choose);

for i=1:N
    plot(sample_choose,accuracy(i,:),'--','color',color{1,i},'LineWidth',2.5);
    hold on
end
for i=N+1:size(accuracy,1)
    plot(sample_choose,accuracy(i,:),'color',color{1,i},'LineWidth',2.5);
    hold on
end
axis(space);

title('\fontsize{10}wdbc')
%set(gca,'xtick',[]);
ylabel('Accuracy');
xlabel('The number of labeling');

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
