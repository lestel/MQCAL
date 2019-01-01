%{
clc
clear
fold_name='isolet_our_result.mat';
way_choose=[1,5,6];
group_choose=[1,3];
sample_choose=4:1:30;
M=2;
smooth_th=2;
pos_range=[5,30,0.45,1];
name_group={'Random';'Diveristy';'QBC';'Un';'Di,Un';'Di,QBC,Un'};
state_compare1(fold_name,group_choose,way_choose,sample_choose,M,pos_range,name_group,smooth_th);

%}
function [accuracy1,experiment_result_performance]=state_compare1(fold_name,group_choose,way_choose,sample_choose,M,pos_range,name_group,smooth_th)
load(fold_name);
idx=strfind(fold_name,'_');

fold_name2=fold_name(1:(idx-1));
load([fold_name2,'.mat']);

element_num=size(name_group,1);
name=name_group;
for i=1:(size(experiment_result_type,1)/element_num-1)
    name=[name;name_group];
end


%name2={'Margin','Cluster','IDE','DUAL','QUIRE'};
color={[0,0,255]/255,...%À¶
       [255,0,255]/255,...%·Û
       [0,255,255]/255,...%Çà
       [0,255,0]/255,...%ÂÌ
       [255,0,0]/255,...%ºì
       [0,0,0],...      %ºÚ
       [135,51,36]/255,...%¿§ 
       [160,32,240]/255,...%×Ï
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
line0=load(fold_name2,'line');
line1=line0.line;
for i=1:size(line1,2)
    if i<=M    
    plot(line1{1,i}(1,:),line1{1,i}(2,:),'--','color',color{i},'Linewidth',2.5);
    hold on 
    else
    plot(line1{1,i}(1,:),line1{1,i}(2,:),':','color',color{i},'Linewidth',2.5);
    hold on    
    end
end


accuracy_tmp=experiment_result_performance.accuracy(:,sample_choose);
accuracy1=nan(element_num,size(accuracy_tmp,2));
for i=1:element_num
    list=i:element_num:size(accuracy_tmp,1)-element_num+i;
    tmp=mean(accuracy_tmp(list,:),1);
    accuracy1(i,:)=tmp;
end
accuracy=accuracy1(way_choose,:);
i=1;
    plot(sample_choose,accuracy(i,:),'--','color',color{1,i+size(line1,2)},'LineWidth',2.5);
    hold on

for i=2:size(accuracy,1)
    plot(sample_choose,accuracy(i,:),'color',color{1,size(line1,2)+i},'LineWidth',2.5);
    hold on
end
axis(pos_range);
ylabel('Accuracy');
xlabel('The number of labeling');

name_j='legend(''Margin'',''Cluster'',''IDE'',''DUAL'',''QUIRE'',';
for i=1:length(way_choose)
    if i~=length(way_choose)
    name_j=[name_j,'''',name{way_choose(i)},''','];
    else
    name_j=[name_j,'''',name{way_choose(i)},''',4)'];
    end
end
%eval(name_j);
eval(name_j);
title(fold_name2);