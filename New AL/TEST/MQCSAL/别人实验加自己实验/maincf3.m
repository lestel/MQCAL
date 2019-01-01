clc
clear

load('文献表格.mat');
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



i=1;
fold_name='austra_n.mat';
axis_setting=[0,80,0.45,0.9];
smooth_th=2;
ex_choose=[1,9,4,5,6];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
figure
i=2;
fold_name='isolet_n.mat';
axis_setting=[0,30,0.45,1];
smooth_th=2; 
ex_choose=[1,2,3,4,5];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];

figure
i=3;
fold_name='titato_n.mat';
axis_setting=[0,300,0.2,1];
smooth_th=2; 
ex_choose=[2,3,4,7,8];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
figure
i=4;
fold_name='vehicle_n.mat';
axis_setting=[0,127,0.4,1];
smooth_th=2;pos=[1:6]+18;
ex_choose=[2,3,5,6,7];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
figure
i=5;
fold_name='wdbc_n.mat';
axis_setting=[0,60,0.3,1];
smooth_th=2; 
ex_choose=[2,3,6,9,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];




figure
i=6;
fold_name='letterDP_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,2,3,7,10]
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
 

figure
i=7;
fold_name='letterEF_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,2,5,7,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];

figure
i=8;
fold_name='letterIJ_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,4,5,6,9];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
figure
i=9;
fold_name='letterMN_n.mat';
axis_setting=[0,100,0.45,1];
smooth_th=2; 
ex_choose=[1,5,8,9,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];



figure
i=10;
fold_name='letterUV_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,5,6,7,8,2];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
num=10;
compare=7;
method =2; %检验方法
[mat3,score_block,wlt_block,block_Z,block_R,block_B,block_X]=ttest2_block_invert(mat2,num,compare,method);
[mat32,score_block2,wlt_block2,block_Z2,block_R2,block_B2,block_X2]=ttest2_block_invert(mat2,num,compare,0);

