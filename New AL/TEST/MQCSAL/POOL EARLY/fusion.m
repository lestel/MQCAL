load('matlab4.mat');
name={'Random';'Diveristy';'Entropy';'Marginrbf';'Uncertainty';'Di,En';'Di,Ma';'Borda';'Di,En,Ma';'Di,En,Un';'Di,Ma,Un';'Di,En,Ma,Un';'Di,En';'Di,Ma';'Bucklin';'Di,En,Ma';'Di,En,Un';'Di,Ma,Un';'Di,En,Ma,Un';'Di,En';'Di,Ma';'MC2';'Di,En,Ma';'Di,En,Un';'Di,Ma,Un';'Di,En,Ma,Un';'Di,En';'Di,Ma';'Di,Un';'Di,En,Ma';'Di,En,Un';'Di,Ma,Un';'Di,En,Ma,Un';};
    


color={[0,0,0],...      %ºÚ
       [255,0,0]/255,...%ºì
       [255,0,255]/255,...%·Û
       [255,255,0]/255,...%»Æ
       [0,255,255]/255,...%Çà
       [0,255,0]/255,...%ÂÌ
       [0,0,255]/255,...%À¶
       [135,51,36]/255,...%¿§ 
       [160,32,240]/255,...%×Ï
       [255,128,0]/255, ...%éÙ
       [192,192,192]/255 ...%»Ò
      
       };
way_choose=[1,8,15,22];
sample_choose=[11,21,31,41,51,61,71,81,91];
experiment_result_performance=result_show(experiment_result_type,way_choose,2);




accuracy=experiment_result_performance.auc(:,sample_choose);
bar(accuracy(1:end,:)')
title('\fontsize{10}Accuarcy of AL method based on different single query strategies')
set(gca,'xticklabel',{'6%','9%','12%','15%','18%','21%','24%','27%','30%'})
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

axis([0,10,0.6,1]);
eval(name_j);

figure
F1measure=experiment_result_performance.F1measure(:,sample_choose);
bar(F1measure(1:end,:)')
title('\fontsize{10}F1measure of AL method based on different single query strategies')
set(gca,'xticklabel',{'6%','9%','12%','15%','18%','21%','24%','27%','30%'})
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

axis([0,10,0.6,1]);
eval(name_j);