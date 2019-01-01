filename= 'letterIJ';

filename1=[filename,'_A.mat'];
filename2=[filename,'_B.mat'];
filename3=[filename,'_C.mat'];
filename4=[filename,'_D.mat'];
filename5=[filename,'_n.mat'];
load(filename1);
s1=size(experiment_result_type{1, 1}.performance.accuracy,2);
load(filename2);
s2=size(experiment_result_type{1, 1}.performance.accuracy,2);
load(filename3);
s3=size(experiment_result_type{1, 1}.performance.accuracy,2);
load(filename4);
s4=size(experiment_result_type{1, 1}.performance.accuracy,2);
load(filename5);
s5=size(experiment_result_type{1, 1}.performance.accuracy,2);

s=min([s1,s2,s3,s4,s5]);

B1=zeros(5,s);
B2=zeros(5,s);
for j=1:5
eval(['load(filename',num2str(j),');']);
block1=zeros(10,size(experiment_result_type{1, 1}.performance.accuracy,2));
block2=zeros(10,size(experiment_result_type{1, 1}.performance.AUC_block,2));
for i=1:10
    block1(i,:)=experiment_result_type{i, 1}.performance.accuracy;
    block2(i,:)=experiment_result_type{i, 1}.performance.AUC_block;
end
c1=mean(block1,1);
c2=mean(block2,1);
B1(j,:)=c1(1,1:s);
B2(j,:)=c2(1,1:s);
end