name={'NCL1.mat','NCL8.mat','NCL12.mat','NCL8N.mat','NCL12M.mat'};
name2={'accuracy','precision','recall','fp','F1measure','AUC_block'};

sjs=size(experiment_result_type{1, 1}.performance.accuracy,2);
final=cell(2,6);
for j=1:6
 
ls1=nan(5,sjs);
ls2=nan(5,sjs);    
for i=1:5
    
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
    mean_line=min(block);
    end
    var_line=var(block,1);
    ls1(i,:)=mean_line;
    ls2(i,:)=var_line;
end
  final{1,j}=ls1;
  final{2,j}=ls2;
end
study=1;