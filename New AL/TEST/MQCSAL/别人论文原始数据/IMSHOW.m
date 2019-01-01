
foldname='wdbc';
name={'Margin','Cluster','IDE','DUAL','QUIRE'};
color={'b','m','c','g','r'};
load([foldname,'.mat']);

for i=1:size(line,2)
    plot(line{1,i}(1,:),line{1,i}(2,:),color{i},'Linewidth',2.5);
    hold on 
end