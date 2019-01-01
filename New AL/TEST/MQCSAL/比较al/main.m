

load('MQresult.mat');
name={'Random';'Density';'Diveristy';'EMC';'Entropy';'MAED';'TED';'Margin';'Margin_linear';'Margin_RBF';'Multiview';'QBC';'Margin_Bayes';'Yebatch'};

color={[0,0,0],[255,0,0]/255,[0,255,0]/255,[0,0,255]/255,[0,255,255]/255,[255,0,255]/255,[255,255,0]/255,[192,192,192]/255,[135,51,36]/255,[160,32,240]/255,[255,128,0]/255};
way_choose=[7,3];
%[1,2,3,5,6,7,10,11,12,13]
sample_choose=(2:3:95);




experiment_result_performance=result_show(experiment_result_type,way_choose,1);
accuracy=experiment_result_performance.accuracy(:,sample_choose);

for i=1:size(accuracy,1)
    plot(sample_choose,accuracy(i,:),'color',color{1,i},'LineWidth',2.5);
    hold on 
    %plot(sample_choose,accuracy(i,:),'x','color',color{1,i},'LineWidth',2.5);
   %hold on
        
end
axis([0,100,0.6,1]);
name_j='legend(';
for i=1:length(way_choose)
    if i~=length(way_choose)
    name_j=[name_j,'''',name{way_choose(i)},''','];
    else
    name_j=[name_j,'''',name{way_choose(i)},''',4)'];
    end
end

eval(name_j);
title('\fontsize{10}Accuarcy of AL method based on different single query strategies')
xlabel('The number of labeling');
ylabel('Performance');

%
hold on
a=ones(1,95)*0.9141;
plot(a)
legend('AL algorithm with better performance','AL algorithm with worse performance','The certain performance index')
