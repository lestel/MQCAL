%options_active(1)表示每次选择几个

%{
load('alg_test2.mat')
m=train;
now_part_train_sample_ind1=125:225;
rest_part_train_sample_ind1=[(1:124),(226:350)];
options=[];
options_active(1,1)=2;
[choose_part_serialss,diff,diff_pos,rank,note]=random_noneblance_choose_sample(m,now_part_train_sample_ind1,rest_part_train_sample_ind1,options_active);
%}


function [choose_part_serials,diff,diff_pos,rank,note]=random_noneblance_choose_sample(m,now_part_train_sample_ind1,rest_part_train_sample_ind1,options_active)

%标识样本索引 未标识样本索引 b

%%
note=1;
input_options_active_num=1;
default_options_active=1;


if length(options_active) < input_options_active_num, %如果用户给的options_active数少于input_options_active_num个那么其他用默认值; 
  tmp = default_options_active; 
  tmp(1:length(options_active)) = options_active; 
  options_active = tmp; 
end 


%%

now_part_train_sample1=m(now_part_train_sample_ind1,:);
rest_part_train_sample1=m(rest_part_train_sample_ind1,:);
choose_size=options_active(1);

n = size(rest_part_train_sample1,1);
rand('state',sum(100*clock));
diff=rand(1,n)';
[~,diff_pos]=sort(diff,'ascend');


rank=score_invert_rank(diff,'low');
choose_part_serials=diff_pos(1:choose_size,1);

