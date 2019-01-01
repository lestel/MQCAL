%% generate data1
%ï¿½ï¿½Ò»ï¿½ï¿½
clc
clear

rand('seed',0);
alm={'random_noneblance_choose_sample';'density_existing_choose_sample';'diveristy_existing_choose_sample';'emc_bays_choose_sample';'entropy_bays_choose_sample';'maed_learning_choose_sample';'ted_learning_choose_sample';'margin_svm_choose_sample';'margin_svmlinear_choose_sample';'margin_svmrbf_choose_sample';'multiple_view_choose_sample';'committe_learning_choose_sample';'uncertainty_bays_choose_sample';'yebatch_active_choose_sample'};
hybird={'min';'median';'mean';'geom.mean';'Bucklin';'MC1';'MC2';'MC3';'ONE';'FALL'};
name='wdbc';
name1=['D',name,'.mat'];
name2=[name,'_NN.mat'];
load(name1);
TH=1;
experiment_result_type=cell(TH,1);
option.dimenreduction=100;
option.trainnum_per=1; 
option.testnum_per=1;
option.whethersave='N';

option_dataflow.batch_size=0;
option_dataflow.firstbatch_size=2;
option_dataflow.firstbatch_selection_strategy='random';
option_dataflow.first_choose_array=[];
option_dataflow.extra_buffersize=0;
option_dataflow.whethersave='N';

option_al.choose_num=1;
option_al.choose_strategies=[3,8];%3,12,8
option_al.fuision_strategies=8;%3,5,8
option_al.fuision_array=-1; %£¡

option_ml.method='svm';
option_ml.parameter=[1,0,1,0.5];
option_al.end_requirement_way=4;
option_al.end_requirement_options=50;

for i=1:TH

[train,test,info_id]=initialize_database(option,data);
disp('=======Generate data finish=======');
 


[dataflow_list,info_sd]=simulate_dataflow_list(option_dataflow,train);
disp('=======Generate dataflow finish=======');

 

train_sample=train;
test_sample=test;

result=active_learning_process(train_sample,test_sample,info_id,dataflow_list,info_sd,option_al,option_ml);
disp('=======Active learning finish=======');

 
label_stand=test_sample(:,2);
label_type=sort(unique(label_stand));
positive_class=label_type(1);
test_result_block=result.al_performance.test_result_block;
AUC_block=result.al_performance.AUC_block;
[confusion_table_test,accuracy1,precision1,recall1,fp1,F1measure]=result_analysis(test_result_block,label_stand,positive_class);
performance=cell(7,1);
performance{1,1}=confusion_table_test;
performance{2,1}=accuracy1;
performance{3,1}=precision1;
performance{4,1}=recall1;
performance{5,1}=fp1;
performance{6,1}=F1measure;
performance{7,1}=AUC_block;

experiment_result_type{i,1}=performance;

end


disp('=======result analysis finish=======');
save(name2,'experiment_result_type');