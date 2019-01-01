%options_active(1)表示每次选择几个
%array_active表示如何分，为空集时为完全自动分
%{
clc
clear
load('alg_test3.mat')
m=train;
now_part_train_sample_ind1=125:225;
rest_part_train_sample_ind1=[(1:124),(226:350)];
options_active(1,1)=2;
[choose_part_serials,diff,diff_pos,rank,note]=cluster_existing_choose_sample(m,now_part_train_sample_ind1,rest_part_train_sample_ind1,options_active);
%}

function [choose_part_serials,diff,diff_pos,rank,note]=cluster_existing_choose_sample(m,now_part_train_sample_ind1,rest_part_train_sample_ind1,options_active)
%uncertainty_active_choose_sample 此处显示有关此函数的摘要
%   此处显示详细说明

%% 适合较少的情况
%%  diff是对应rest_part_train_sample_ind1的每个值得得分 越小越好
%%  diff_pos 从高到底 将rest_part_train_sample_ind1的位置 以其分数进行排序
%%  rank     不改变原始rest part序列，对每一个给一个名次
note=0;
input_options_active_num=4;
default_options_active=[1,0,1,1/(size(m,2)-2)];

if length(options_active) < input_options_active_num, %如果用户给的options_active数少于input_options_active_num个那么其他用默认值; 
       tmp = default_options_active; 
       tmp(1:length(options_active)) = options_active; 
       options_active =tmp; 
end 
%%
choose_size=options_active(1);
%method=options_active(2);
%c_value=options_active(3);
%g_value=options_active(4);
%options=[method,c_value,g_value];

now_part_train_sample1_tmp=m(now_part_train_sample_ind1,:);
rest_part_train_sample1_tmp=m(rest_part_train_sample_ind1,:);

now_part_train_sample_fea=now_part_train_sample1_tmp(:,3:end);
rest_part_train_sample_fea=rest_part_train_sample1_tmp(:,3:end);


type=unique(now_part_train_sample1_tmp(:,2));
cluster_point=zeros(length(type),size(now_part_train_sample_fea,2));
for i=1:length(type)
    index=find(now_part_train_sample1_tmp(:,2)==type(i));
    tmp=now_part_train_sample_fea(index,:);
    cluster_point(i,:)=mean(tmp,1);
end
rest_part_train_sample_num=size(rest_part_train_sample_fea,1);
differ=zeros(rest_part_train_sample_num,1);
for j=1:rest_part_train_sample_num
    tmp=zeros(length(type),1);
    for i=1:length(type)
        tmp(i,1)=pdist2(rest_part_train_sample_fea(j,:),cluster_point(i,:));
    end
    differ(j,1)=abs(tmp(2,1)-tmp(1,1));
end
diff=differ;
[~,diff_pos]=sort(diff,'ascend');
rank=score_invert_rank(diff,'low');
choose_part_serials=diff_pos(1:choose_size,1);