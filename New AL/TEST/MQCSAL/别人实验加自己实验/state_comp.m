%{
clc
clear
fold_name='austra_2.mat';
axis_setting=[0,80,0.45,0.9];
smooth_th=1;
ex_choose=[1:10];
pos=[];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th)
%}

function [accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th)
load(fold_name);
idx=strfind(fold_name,'_');
fold_name2=fold_name(1:(idx-1));
name1=load(fold_name2,'name');
name1={name1,'RLC'};
color={[0,0,255]/255,...%À¶
       [255,0,255]/255,...%·Û
       [0,255,255]/255,...%Çà
       [0,255,0]/255,...%ÂÌ
       [255,0,0]/255,...%ºì
       [160,32,240]/255,...      %ºÚ
       };
   
experiment_result_performance=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmp=mean(experiment_result_performance.accuracy(ex_choose,:),1);




M=2;
line0=load(fold_name2,'line');
line1=line0.line;
for i=1:size(line1,2)
    if i<=M    
    plot(line1{1,i}(1,:),line1{1,i}(2,:),'--','color',color{i},'Linewidth',4);
    hold on 
    else
    plot(line1{1,i}(1,:),line1{1,i}(2,:),':','color',color{i},'Linewidth',4);
    hold on    
    end
end
plot(1:length(accuracy_tmp),accuracy_tmp,'color',color{1,size(line1,2)+1},'LineWidth',4);
hold on

axis(axis_setting);
ylabel('Accuracy');
xlabel('The number of labeling');
legend('Margin','Cluster','IDE','DUAL','QUIRE','RLC',4);
title(['\fontsize{12}',fold_name2]);
AAA=1;
