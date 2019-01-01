clc
clear


alm={'random_noneblance_choose_sample';'density_existing_choose_sample';'diveristy_existing_choose_sample';'emc_bays_choose_sample';'entropy_bays_choose_sample';'maed_learning_choose_sample';'ted_learning_choose_sample';'margin_svm_choose_sample';'margin_svmlinear_choose_sample';'margin_svmrbf_choose_sample';'multiple_view_choose_sample';'committe_learning_choose_sample';'uncertainty_bays_choose_sample';'yebatch_active_choose_sample';'margin_regression_choose_sample';'mv_regression_choose_sample'};hybird={'min';'median';'mean';'geom.mean';'Bucklin';'MC1';'MC2';'MC3';'ONE';'FALL'};
name='data_classification2';
name1=[name,'.mat'];
name2=[name,'_n.mat'];
load(name1);
TH=10;
experiment_result_type=cell(TH,1);
data=[(1:size(fea,1))',label_c,fea];

he=waitbar(0,'start one more experiment');
datasj=cell(TH,5);

for i=1:TH
option.dimenreduction=90;
option.trainnum_per=1; 
option.testnum_per=1;
option.whethersave='N';
[train,test,info_id]=initialize_database(option,data);
disp('=======Generate data finish=======');
 
option_dataflow.batch_size=0;
option_dataflow.firstbatch_size=4;
option_dataflow.firstbatch_selection_strategy='random';
option_dataflow.first_choose_array=[];
option_dataflow.extra_buffersize=0;
option_dataflow.whethersave='N';

[dataflow_list,info_sd]=simulate_dataflow_list(option_dataflow,train);
datasj{i,1}=train;
datasj{i,2}=test;
datasj{i,3}=info_id;
datasj{i,4}=dataflow_list;
datasj{i,5}=info_sd;
end

