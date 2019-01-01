clc
clear

load('ндов╠М╦Я.mat');
mean_pos=[1,3,5,7,9];
std_pos=[1,3,5,7,9]+1;
mean_mat=data(:,mean_pos);
std_mat=data(:,std_pos);

mat=cell(10,2);
for i=1:10
    tmp=(6*i-5):(6*i);
    mat{i,1}=mean_mat(tmp,:);
    mat{i,2}=std_mat(tmp,:);
end
    
mat2=mat;

%=======================================================
i=8;
fold_name='letterMN_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,4,5,6,9];

[experiment_result_performance1,experiment_result_performance2,experiment_result_performance3,experiment_result_performance4, experiment_result_performance5]=state_comp3(fold_name,ex_choose,axis_setting,smooth_th);




