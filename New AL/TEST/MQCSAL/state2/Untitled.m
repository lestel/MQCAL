fold_name='austra_our_result.mat';
name_group={'Random';'Diveristy';'QBC';'Un';'Di,Un';'Di,QBC,Un'};
smooth_th=0;
per_study=[5,10,15,20,25,30]*2+10 ;


load(fold_name);
experiment_num=size(experiment_result_type,1);
method_num=size(name_group,1);
experiment_result_performance=result_show(experiment_result_type,1:experiment_num,smooth_th);
mean_re=nan(method_num,length(per_study));
std_re=nan(method_num,length(per_study));
for i=1:method_num
    study_serial=i:method_num:(experiment_num-method_num+i);
    auc_value_study=experiment_result_performance.auc(study_serial,per_study);
    tmp=mean(auc_value_study);
    tmp(tmp>1)=1;
    mean_re(i,:)=tmp;
    
    std_re(i,:)=std(auc_value_study);
end
[score_block] = ttest2_block(mean_re,std_re,30,5);