name={'NCL1.mat','NCL3.mat','NCL5.mat','NCL7.mat','NCL8.mat','NCL11.mat','NCL12.mat','NCL13.mat','NCL14.mat'};
name2={'accuracy','precision','recall','fp','F1measure','AUC_block'};
load('NCL1.mat');
sjs=size(experiment_result_type{1, 1}.performance.accuracy,2);
final=cell(2,6);
for j=1:6
 
ls1=nan(9,sjs);
ls2=nan(9,sjs);    
for i=1:9
    
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
    var_line=std(block,1);
    ls1(i,:)=mean_line;
    ls2(i,:)=var_line;
end
  final{1,j}=ls1;
  final{2,j}=ls2;
end
study=1;

study_point=round([5/40,10/40,15/40,20/40,25/40,30/40,40/40]*sjs);
final2=cell(1,6);
for i=1:6
    a1=final{1,i}(:,study_point);
    a2=final{2,i}(:,study_point);  
    tmp=cell(size(a1,1),size(a1,2));
    for ii=1:size(a1,1)
        for jj=1:size(a1,2)
            b1=round(a1(ii,jj)*10000)/10000;
            b2=round(a2(ii,jj)*10000)/10000;
            tmp{ii,jj}=[num2str(b1),'¡À',num2str(b2)];
        end
    end
    final2{1,i}=tmp;
end

