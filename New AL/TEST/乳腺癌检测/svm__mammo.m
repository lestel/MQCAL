%% SVM ½á¹û
load('data_classification2.mat');
fea_num=size(fea,2);
sample_num=size(fea,1);
th=3;
pca_v=100;
svm_option=[1,0,1,0.125];
train_set_num=round(sample_num/2);
test_result_block=[];
accuracy=nan(th,1);
precision=nan(th,1);
recall=nan(th,1);
fp=nan(th,1);
F1measure=nan(th,1);
AUC=nan(th,1);
for i=1:th
tmp=randperm(sample_num);
fea_new=fea(tmp,:);
label_new=label_c(tmp,:);
name_new=name(tmp,:);

tr=fea_new(1:train_set_num,:);
tr_label=label_new(1:train_set_num,:);
tr_name=name_new(1:train_set_num,:);

te=fea_new(train_set_num+1:end,:);
te_label=label_new(train_set_num+1:end,:);
te_name=name_new(train_set_num+1:end,:);

tr1=(1:size(tr_label,1))';
te1=(1:size(te_label,1))';
[PA_rebuilt,PB_rebuilt,ycsjy_num]=PCAdimen([tr1,tr_label,tr],[te1,te_label,te],pca_v);
tr=PA_rebuilt(:,3:end);
te=PB_rebuilt(:,3:end);

train_sample=[(1:size(tr))',tr_label,tr];
[net,need_type,~]=svm_building(train_sample,svm_option);
[test_result,evaluation,deci]=svmpredict(te_label,te,net);
[confusion_table_test,accuracy1,precision1,recall1,fp1,F1measure1]=result_analysis(test_result,te_label,1);
AUC_now = AUC_calculate(deci,te_label,net);
accuracy(i,1)=accuracy1;
precision(i,1)=precision1;
recall(i,1)=recall1;
fp(i,1)=fp1;
F1measure(i,1)=F1measure1;
AUC(i,1)=AUC_now;
end
