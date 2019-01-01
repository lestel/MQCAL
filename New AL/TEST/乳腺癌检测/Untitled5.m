%name={'ACL1.mat','NCL3.mat','ACL5.mat','NCL7.mat','ACL8.mat','ACL11.mat','ACL12.mat','ACL13.mat','ACL14.mat'};
name={'QBC2.mat'};
name2={'accuracy','precision','recall','fp','F1measure','AUC_block'};
load(name{1,1});
num2=size(name,2);
sjs=size(experiment_result_type{1, 1}.performance.accuracy,2);
final=cell(2,6);
for j=1:6
 
ls1=nan(num2,sjs);
ls2=nan(num2,sjs);    
for i=1:num2
    
    load(name{1,i});
    cfs=size(experiment_result_type,1);
    
    block=nan(cfs,sjs);
    for k=1:cfs
        eval(['tmp=experiment_result_type{k, 1}.performance.',name2{1,j},';']);
        block(k,:)=tmp;
    end
    if i~=1
    mean_line=mean(block,1);
    else
    mean_line=mean(block);
    end
    var_line=var(block,1);
    ls1(i,:)=mean_line;
    ls2(i,:)=var_line;
end
  final{1,j}=ls1;
  final{2,j}=ls2;
end
study=1;

