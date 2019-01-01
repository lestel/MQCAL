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
ex_choose=[1,9,4,5,6,8];




[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];


figure
i=2;
fold_name='isolet_n.mat';
axis_setting=[0,30,0.45,1];
smooth_th=2; 
ex_choose=[1,2,3,4,5];

[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];

figure
i=3;
fold_name='titato_n.mat';
axis_setting=[0,300,0.2,1];
smooth_th=2; 
ex_choose=[2,3,4,7,8];

[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];
figure
i=4;
fold_name='vehicle_n.mat';
axis_setting=[0,127,0.4,1];
smooth_th=2;pos=[1:6]+18;
ex_choose=[2,3,5,6,7];

[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];
figure
i=5;
fold_name='wdbc_n.mat';
axis_setting=[0,60,0.3,1];
smooth_th=2; 
ex_choose=[2,3,6,9,10];

[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];




figure
i=6;
fold_name='letterDP_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,2,3,7,10]

[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];
 

figure
i=7;
fold_name='letterEF_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,2,5,7,10];

[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];

figure
i=8;
fold_name='letterIJ_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,4,5,6,9];

[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];
figure
i=9;
fold_name='letterMN_n.mat';
axis_setting=[0,100,0.45,1];
smooth_th=2; 
ex_choose=[1,5,8,9,10];

[experiment_result_performance1,experiment_result_performance2, experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];



figure
i=10;
fold_name='letterUV_n.mat';
axis_setting=[0,60,0.45,1];
smooth_th=2; 
ex_choose=[1,5,6,7,8,2];

[experiment_result_performance1,experiment_result_performance2,experiment_result_performance5]=state_comp2(fold_name,ex_choose,axis_setting,smooth_th);
[mean_m1,std_m1]=add_mat(experiment_result_performance1,[1:10]);
[mean_m2,std_m2]=add_mat(experiment_result_performance2,[1:10]);
[mean_m3,std_m3]=add_mat(experiment_result_performance5,ex_choose);

mat2{i,1}=[mat2{i,1};mean_m1;mean_m2;mean_m3];
mat2{i,2}=[mat2{i,2};std_m1;std_m2;std_m3];
num=10;
compare=9;
method =2; %检验方法
[mat3,score_block,wlt_block,block_Z,block_R,block_B,block_X]=ttest2_block_invert(mat2,num,compare,method);
[mat32,score_block2,wlt_block2,block_Z2,block_R2,block_B2,block_X2]=ttest2_block_invert(mat2,num,compare,0);
