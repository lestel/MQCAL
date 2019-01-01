%options_active(1)��ʾÿ��ѡ�񼸸�

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
%��ʶ�������� δ��ʶ�������� b
note=0;
input_options_active_num=2;
default_options_active=[1,5];
%��һλ��ѡ����Ŀ
%�ڶ�λ��kernel_type   
choose_size=options_active(1);

if length(options_active) < input_options_active_num, %����û�����options_active������input_options_active_num����ô������Ĭ��ֵ; 
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