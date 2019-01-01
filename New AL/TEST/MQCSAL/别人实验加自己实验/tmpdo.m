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

figure
i=6;
fold_name='letterDP_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,2,3,7,10]

[experiment_result_performance1,experiment_result_performance2,experiment_result_performance3]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance3,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];
 