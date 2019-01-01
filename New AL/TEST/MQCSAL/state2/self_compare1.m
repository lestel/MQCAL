%{
clc
clear
fold_name='isolet_our_result.mat';
way_choose=[1,2,3,4,5,6];
sample_choose=4:1:30;
group_choose=[1,2,3];

N=4;
smooth_th=2;
pos_range=[5,30,0.45,1];
name_group={'Random';'Diveristy';'QBC';'Un';'Di,Un';'Di,QBC,Un'};
self_compare1(fold_name,group_choose,way_choose,sample_choose,N,pos_range,name_group,smooth_th);

%}
function self_compare1(fold_name,group_choose,way_choose,sample_choose,N,pos_range,name_group,smooth_th)
load(fold_name);
element_num=size(name_group,1);
name=name_group;
group_num=size(experiment_result_type,1)/element_num;
for i=1:(size(experiment_result_type,1)/element_num-1)
    name=[name;name_group];
end



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
m=group_choose*element_num;
s=(group_choose-1)*element_num+1;
xl=[];
for i=1:length(s)
    xl=[xl,s(i):m(i)];
end

experiment_result_performance=result_show(experiment_result_type,xl,smooth_th);
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
accuracy_tmp=experiment_result_performance.accuracy(:,sample_choose);
accuracy1=nan(element_num,size(accuracy_tmp,2));
for i=1:element_num
    list=i:element_num:size(accuracy_tmp,1)-element_num+i;
    tmp=mean(accuracy_tmp(list,:),1);
    accuracy1(i,:)=tmp;
end
accuracy=accuracy1(way_choose,:);
    
    
    
    
for i=1:N
    plot(sample_choose,accuracy(i,:),'--','color',color{1,i},'LineWidth',2.5);
    hold on
end
for i=N+1:size(accuracy,1)
    plot(sample_choose,accuracy(i,:),'color',color{1,i},'LineWidth',2.5);
    hold on
end
axis(pos_range);
idx=strfind(fold_name,'_');
title(fold_name(1:(idx(1)-1)));
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
 