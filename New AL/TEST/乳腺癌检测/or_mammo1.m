%%  OR ½á¹û
load('data_regression4.mat');
fea_num=size(fea,2);
sample_num=size(fea,1);
th=3;
pca_v=93;

train_set_num=round(sample_num/2);

accuracy_te=nan(th,1);
accuracy_tr=nan(th,1);

for i=1:th
tmp=randperm(sample_num);
fea_new=fea(tmp,:);
label_new=label_r(tmp,:);
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

model=ordinalregression_train(tr,tr_label);
[~,dec_te,accuracyte]=ordinalregression_test(te,te_label,model);
[~,dec_tr,accuracytr]=ordinalregression_test(tr,tr_label,model);
accuracy_te(i,1)=accuracyte;
accuracy_tr(i,1)=accuracytr;

end
