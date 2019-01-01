%load('wdbc_our_result.mat')
fold_name='wdbc';
load([foldname,'.mat']);
way_choose=[1,8,11];
sample_choose=1:1:60;
space=[0,60,0.35,1];
N=2;



experiment_result_performance=result_show(experiment_result_type,way_choose,4);
name={'Random';'Diveristy';'Multiview';'QBC';'Uncertainty';'Di,Mu';'Di,QBC';'Di,Un';'Di,Mu,QBC';'Di,Mu,Un';'Di,QBC,Un';'Di,Mu,QBC,Un';'Mu,QBC';'Mu,Un';'Mu,QBC,Un';'QBC,Un'};

name2={'Margin','Cluster','IDE','DUAL','QUIRE'};
color={[0,0,255]/255,...%À¶
       [255,0,255]/255,...%·Û
       [0,255,255]/255,...%Çà
       [0,255,0]/255,...%ÂÌ
       [255,0,0]/255,...%ºì
       [255,255,0]/255,...%»Æ
       [128,128,128]/255,...%»Ò 
       [0,0,0],...      %ºÚ
       [160,32,240]/255 ...%×Ï
       %[135,51,36]/255,...%¿§ 
       %[255,128,0]/255, ...%éÙ
       %
       };



for i=1:size(line,2)
    if i<=N    
    plot(line{1,i}(1,:),line{1,i}(2,:),'--','color',color{i},'Linewidth',2.5);
    hold on 
    else
    plot(line{1,i}(1,:),line{1,i}(2,:),':','color',color{i},'Linewidth',2.5);
    hold on    
    end
end


accuracy=experiment_result_performance.accuracy(:,sample_choose);

i=1;
    plot(sample_choose,accuracy(i,:),'--','color',color{1,i+size(line,2)},'LineWidth',2.5);
    hold on

for i=2:size(accuracy,1)
    plot(sample_choose,accuracy(i,:),'color',color{1,size(line,2)+i},'LineWidth',2.5);
    hold on
end
axis(space);
ylabel('Accuracy');
xlabel('The number of labeling');

name_j='legend(''Margin'',''Cluster'',''IDE'',''DUAL'',''QUIRE'',';
for i=1:length(way_choose)
    if i~=length(way_choose)
    name_j=[name_j,'''',name{way_choose(i)},''','];
    else
    name_j=[name_j,'''',name{way_choose(i)},''',4)'];
    end
end
%eval(name_j);
eval(name_j);
title(fold_name);