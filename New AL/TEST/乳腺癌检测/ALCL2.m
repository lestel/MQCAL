clc
clear
load('sysj.mat');
alm={'random_noneblance_choose_sample';'density_existing_choose_sample';'diveristy_existing_choose_sample';'emc_bays_choose_sample';'entropy_bays_choose_sample';'maed_learning_choose_sample';'ted_learning_choose_sample';'margin_svm_choose_sample';'margin_svmlinear_choose_sample';'margin_svmrbf_choose_sample';'multiple_view_choose_sample';'committe_learning_choose_sample';'uncertainty_bays_choose_sample';'yebatch_active_choose_sample';'margin_regression_choose_sample';'mv_regression_choose_sample'};hybird={'min';'median';'mean';'geom.mean';'Bucklin';'MC1';'MC2';'MC3';'ONE';'FALL'};

he=waitbar(0,'start one more experiment');
TH=size(datasj,1);

for i=1:TH 
train_sample=datasj{i,1};
test_sample=datasj{i,2};   
info_id=datasj{i,3};
dataflow_list=datasj{i,4};
info_sd=datasj{i,5};
    
option_al.choose_num=6;
option_al.choose_strategies=8%[2,13,12];
option_al.fuision_strategies=0;
option_al.fuision_array=1;

option_ml.method='svm';
option_ml.parameter=[2,0,1,0.125];
option_al.end_requirement_way=5;
option_al.end_requirement_options=0.45*1.2;
result=active_learning_process(train_sample,test_sample,info_id,dataflow_list,info_sd,option_al,option_ml);
disp('=======Active learning finish=======');

 
label_stand=test_sample(:,2);
label_type=sort(unique(label_stand));
positive_class=label_type(1);
test_result_block=result.al_performance.test_result_block;
AUC_block=result.al_performance.AUC_block;
[confusion_table_test,accuracy1,precision1,recall1,fp1,F1measure]=result_analysis(test_result_block,label_stand,positive_class);

performance.confusion_table_test=confusion_table_test;
performance.accuracy=accuracy1;
performance.precision=precision1;
performance.recall=recall1;
performance.fp=fp1;
performance.F1measure=F1measure;
performance.AUC_block=AUC_block;
tmp.performance=performance;
tmp.result=result;
experiment_result_type{i,1}=tmp;

waitbar((i)/(TH),he,['test ',num2str(i),' experiment, total is',num2str(TH)]);
end


disp('=======result analysis finish=======');

