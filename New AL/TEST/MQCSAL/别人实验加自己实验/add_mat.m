function [mean_m,std_m]=add_mat(experiment_result_performance,ex_choose)
num=size(experiment_result_performance.auc,2)/45*[5,10,20,30,40]+2;

PPP=round(num);
mean_TMP=mean(experiment_result_performance.auc(ex_choose,:),1);
std_TMP=std(experiment_result_performance.auc(ex_choose,:));
mean_m=mean_TMP(1,PPP);
std_m=std_TMP(1,PPP);