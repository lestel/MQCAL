name={'diversity.mat','margin.mat','QBC.mat','diversity4.mat','margin3.mat','QBC2.mat'};
color={[0,0,0],[255,0,0]/255,[0,255,0]/255,[0,0,255]/255,[0,255,255]/255,[255,0,255]/255,[255,255,0]/255,[192,192,192]/255,[135,51,36]/255,[160,32,240]/255,[255,128,0]/255};
name2={'accuracy','precision','recall','fp','F1measure','AUC_block'};
load(name{1,1});
sjs=size(experiment_result_type{1, 1}.performance.accuracy,2);
num1=size(name,2);
final=cell(2,6);
for j=1:6
 
ls1=nan(num1,sjs);
ls2=nan(num1,sjs);    
for i=1:num1
    
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
for i=1:size(name,2)
    plot(final{1,2}(i,:),'color',color{1,i});
    hold on
end




name_j='legend(';
for i=1:size(name,2)
    if i~=size(name,2)
    name_j=[name_j,'''',name{1,i},''','];
    else
    name_j=[name_j,'''',name{1,i},''',4)'];
    end
end
eval(name_j);
