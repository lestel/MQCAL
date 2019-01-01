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



i=1;
fold_name='austra_2.mat';
axis_setting=[0,80,0.45,0.9];
smooth_th=1;
ex_choose=[1,9,4,5,6];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
figure
i=2;
fold_name='isolet_4.mat';
axis_setting=[0,30,0.45,1];
smooth_th=1; 
ex_choose=[1,2,3,4,5,6,7,8,9,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];

figure
i=3;
fold_name='titato_2.mat';
axis_setting=[0,300,0.2,1];
smooth_th=1; 
ex_choose=[3,7,8];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
figure
i=4;
fold_name='vehicle_2.mat';
axis_setting=[0,127,0.4,1];
smooth_th=1;pos=[1:6]+18;
ex_choose=[1,2,3,4,5,6,7,8,9,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
figure
i=5;
fold_name='wdbc_2.mat';
axis_setting=[0,60,0,1];
smooth_th=1; 
ex_choose=[1,2,3,5,6,7,9];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];




figure
i=6;
fold_name='letterDP_2.mat';
axis_setting=[0,60,0.45,1];
smooth_th=1; 
ex_choose=[1,2,3,4,5,6,7,8,9,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];


figure
i=7;
fold_name='letterEF_2.mat';
axis_setting=[0,60,0.45,1];
smooth_th=1; 
ex_choose=[1,2,3,5,6,7,8];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];

figure
i=8;
fold_name='letterIJ_2.mat';
axis_setting=[0,60,0.45,1];
smooth_th=1; 
ex_choose=[1,2,3,4,5,6,7,8,9,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];
figure
i=9;
fold_name='letterMN_2.mat';
axis_setting=[0,100,0.45,1];
smooth_th=1; 
ex_choose=[1,2,3,4,5,6,7,8,9,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];



figure
i=10;
fold_name='letterUV_2.mat';
axis_setting=[0,60,0.45,1];
smooth_th=1; 
ex_choose=[1,2,3,4,5,6,7,8,9,10];
[accuracy_tmp,experiment_result_performance]=state_comp(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m,std_m]=add_mat(experiment_result_performance,ex_choose);
mat2{i,1}=[mat2{i,1};mean_m];
mat2{i,2}=[mat2{i,2};std_m];

score_block=cell(size(mat2,1),1);
for i=1:size(mat2,1)

score_block{i,1}=ttest2_block(mat2{i,1},mat2{i,2},10,7);

end
method=1;
num=10;
compare=7;
[mat3,score_block,wlt_block,block_Z,block_R,block_B,block_X]=ttest2_block_invert(mat2,num,compare,method);
