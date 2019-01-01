clc
clear
fold_name='titato_our_result.mat';
sample_choose=1:1:150;
pos_range=[0,150,0.3,1];
smooth_th=4;
group_choose=[1];

N=4;
M=2;

%+++++++++++++++++++++++++++++++++++
name_group={'Random';'Diveristy';'QBC';'Un';'Di,Un';'Di,QBC,Un'};
subplot(1,2,1);
way_choose=[1,2,3,4,5,6];%+(group-1)*size(name_group,1);
self_compare1(fold_name,group_choose,way_choose,sample_choose,N,pos_range,name_group,smooth_th);
subplot(1,2,2);
way_choose=[1,5,6];%+(group-1)*size(name_group,1);
state_compare1(fold_name,group_choose,way_choose,sample_choose,M,pos_range,name_group,smooth_th);
