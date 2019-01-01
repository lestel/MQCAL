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

i=10;
fold_name='letterUV_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,5,6,7,8];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
