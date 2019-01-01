
load('all.mat');
name={'Random';'Dissimilarity';'TED';'MarginRBF';'QBC';'Margin';'Di,MB';'TED,MB';'MR,MB';'MB,QBC';'Di,TED,MB';'Di,TED,QBC';'Di,QBC,MB';'MB,TED,QBC';'Di,QBC,MB,TED';'Di,QBC,MB,TED,MR'};

%color={[0,0,0],[255,0,0]/255,[0,255,0]/255,[0,0,255]/255,[0,255,255]/255,[255,0,255]/255,[255,255,0]/255,[192,192,192]/255,[135,51,36]/255,[160,32,240]/255,[255,128,0]/255};
way_choose=[1,2,3,5,6];
%[1,2,3,5,6,7,10,11,12,13]
sample_choose=[5,15,25,35,45,55,65,75];



experiment_result_performance=result_show(experiment_result_type,way_choose,20);



accuracy=experiment_result_performance.accuracy(:,sample_choose);
bar(accuracy(1:end,:)')
title('\fontsize{10}Accuarcy of AL method based on different single query criteria')
set(gca,'xticklabel',{'3%','6%','9%','12%','15%','18%','21%','24%'})
ylabel('Accuracy');
xlabel('The percent of labeling');



name_j='legend(';
for i=1:length(way_choose)
    if i~=length(way_choose)
    name_j=[name_j,'''',name{way_choose(i)},''','];
    else
    name_j=[name_j,'''',name{way_choose(i)},''',4)'];
    end
end
%eval(name_j);

axis([0,9,0.6,1]);
eval(name_j);

figure
F1measure=experiment_result_performance.F1measure(:,sample_choose);
bar(F1measure(1:end,:)')
title('\fontsize{10}F1measure of AL method based on different single query criteria')
set(gca,'xticklabel',{'3%','6%','9%','12%','15%','18%','21%','24%'})
ylabel('F1measure');
xlabel('The percent of labeling');



name_j='legend(';
for i=1:length(way_choose)
    if i~=length(way_choose)
    name_j=[name_j,'''',name{way_choose(i)},''','];
    else
    name_j=[name_j,'''',name{way_choose(i)},''',4)'];
    end
end
%eval(name_j);

axis([0,9,0.6,1]);
eval(name_j);