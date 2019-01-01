%options_active(1)表示每次选择几个

%{
load('alg_test3.mat')
m=train;
now_part_train_sample_ind1=125:225;
rest_part_train_sample_ind1=[(1:124),(226:350)];
options=[];
options_active(1,1)=2;
 [choose_part_serials,diff] =Quire_kernel_choose_sample(m,now_part_train_sample_ind1,rest_part_train_sample_ind1,options_active);
%}



function [choose_part_serials,diff,diff_pos,rank,note] = Quire_kernel_choose_sample(m,now_part_train_sample_ind1,rest_part_train_sample_ind1,options_active)
%标识样本索引 未标识样本索引 b
note=0;
input_options_active_num=2;
default_options_active=[1,5];
%第一位是选择数目
%第二位是kernel_type   
choose_size=options_active(1);

if length(options_active) < input_options_active_num, %如果用户给的options_active数少于input_options_active_num个那么其他用默认值; 
  tmp = default_options_active; 
  tmp(1:length(options_active)) = options_active; 
  options_active = tmp; 
end 
K= rbfkernel(m(:,3:end), m(:,3:end), 1);
%K = m(:,3:end)* m(:,3:end)';
Lindex= reshape(now_part_train_sample_ind1,[1,length(now_part_train_sample_ind1)]);
Uindex= reshape(rest_part_train_sample_ind1,[1,length(rest_part_train_sample_ind1)]);
label=m(Lindex,2);
lambda=options_active(1,2);
diff = QUIRE(K,Lindex,Uindex,label,lambda);
[~,diff_pos]=sort(diff,'ascend');
rank=score_invert_rank(diff,'low');
choose_part_serials=diff_pos(1:choose_size,1);