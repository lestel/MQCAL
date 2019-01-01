%{
clc
clear

fold_name='letterDP_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 

ex_choose=[1,2,3,7,10];

pos=[];
[experiment_result_performance1,experiment_result_performance2,experiment_result_performance3,experiment_result_performance4,experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
%}

function [experiment_result_performance1,experiment_result_performance2,experiment_result_performance3,experiment_result_performance4,experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th)
load(fold_name);
idx=strfind(fold_name,'_');
fold_name2=fold_name(1:(idx-1));
name1=load(fold_name2,'name');
name1={name1,'CSAL','SMCQAL','PMCQAL','MCDMAL','RLC'};
color={[0,255,255]/255,...%À¶
       [0,255,0]/255,...%·Û
       [255,255,0]/255,...%Çà
       [255,128,0]/255,...%ÂÌ
       [210,180,140]/255,...%ºì
       [255,0,255]/255,...%éÙ
       [138,43,226]/255,...      %ºÚ
       [0,0,255]/255,...   
       [176,23,31]/255,...   
       [255,0,0]/255,...   
       }; 
load([fold_name2,'_C']);
experiment_result_performance1=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmpA=mean(experiment_result_performance1.accuracy([1;10],:),1);

load([fold_name2,'_A']);
experiment_result_performance2=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmpB=mean(experiment_result_performance2.accuracy([1:10],:),1);

load([fold_name2,'_B']);
experiment_result_performance3=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmpC=mean(experiment_result_performance3.accuracy(ex_choose,:),1);

load([fold_name2,'_D']);
experiment_result_performance4=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmpD=mean(experiment_result_performance4.accuracy(ex_choose,:),1);

load(fold_name);
experiment_result_performance5=result_show(experiment_result_type,1:size(experiment_result_type,1),smooth_th);
accuracy_tmpE=mean(experiment_result_performance5.accuracy(ex_choose,:),1);



M=2;
line0=load(fold_name2,'line');
line1=line0.line;

figure
for i=1:size(line1,2)
    if i<=M    
    plot(line1{1,i}(1,:),line1{1,i}(2,:),'--','color',color{i},'Linewidth',4);
    hold on 
    else  
    plot(line1{1,i}(1,:),line1{1,i}(2,:),'--','color',color{i},'Linewidth',4);
    hold on    
    end
end



plot(1:length(accuracy_tmpA),accuracy_tmpA,':','color',color{1,size(line1,2)+1},'LineWidth',4);
hold on
plot(1:length(accuracy_tmpB),accuracy_tmpB,':','color',color{1,size(line1,2)+2},'LineWidth',4);
hold on
plot(1:length(accuracy_tmpC),accuracy_tmpC,':','color',color{1,size(line1,2)+3},'LineWidth',4);
hold on
plot(1:length(accuracy_tmpD),accuracy_tmpD,':','color',color{1,size(line1,2)+4},'LineWidth',4);
hold on
plot(1:length(accuracy_tmpE),accuracy_tmpE,'color',color{1,size(line1,2)+5},'LineWidth',4);
hold on

axis(axis_setting);
ylabel('Accuracy');
xlabel('The number of labeling');
legend('Margin','Cluster','IDE','DUAL','QUIRE','CSAL','SMCDQAL','PMCQAL','MCDMAL','RLC',4);
title(['\fontsize{12}',fold_name2]);
