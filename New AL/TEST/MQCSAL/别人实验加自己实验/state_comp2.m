%{
clc
clear

fold_name='letterDP_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 

ex_choose=[1,2,3,7,10];

pos=[];
[experiment_result_performance1,experiment_result_performance2,experiment_result_performance3]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
%}

function [experiment_result_performance1,experiment_result_performance2,experiment_result_performance3]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th)
load(fold_name);
idx=strfind(fold_name,'_');
fold_name2=fold_name(1:(idx-1));
name1=load(fold_name2,'name');
name1={name1,'MCDMAL(s)','MCDMAL(p)','RLC'};
color={[0,0,255]/255,...%À¶
       [255,0,255]/255,...%·Û
       [0,255,255]/255,...%Çà
       [0,255,0]/255,...%ÂÌ
       [255,0,0]/255,...%ºì
       [255,0.64706*255,0]/255,...%éÙ
       [255,255,0]/255,...%éÙ
       [160,32,240]/255,...      %ºÚ
       };
load([fold_name2,'_A']);
experiment_result_performance1=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmpA=mean(experiment_result_performance1.accuracy([1;10],:),1);

load([fold_name2,'_B']);
experiment_result_performance2=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmpB=mean(experiment_result_performance2.accuracy([1:10],:),1);

load(fold_name);
experiment_result_performance3=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmpC=mean(experiment_result_performance3.accuracy(ex_choose,:),1);

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



plot(1:length(accuracy_tmpA),accuracy_tmpA,':','color',color{1,size(line1,2)+1},'LineWidth',4);
hold on
plot(1:length(accuracy_tmpB),accuracy_tmpB,':','color',color{1,size(line1,2)+2},'LineWidth',4);
hold on
plot(1:length(accuracy_tmpC),accuracy_tmpC,'color',color{1,size(line1,2)+3},'LineWidth',4);
hold on

axis(axis_setting);
ylabel('Accuracy');
xlabel('The number of labeling');
legend('Margin','Cluster','IDE','DUAL','QUIRE','MCDMAL(s)','MCDMAL(p)','RLC',4);
title(['\fontsize{12}',fold_name2]);
AAA=1;
