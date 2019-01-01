
%{
p=2
C=[1,61,121,181,241]+p;
[mat2,result]=datacollect2(C)
[mat3,score_block,wlt_block,block_Z,block_R,block_B,block_X]=ttest2_block_invert(mat2,10,7,2);
BT=zb(mat3);

%}

function [mat2,result]=datacollect2(C)

%str={'8','10','12','15,'183','n'};
str={'8','10','12','15','17','18','n'};
name_serial={'EEG_','Epileptic_','MoCap_','mushroom_'};

n=248;

n2=2*length(C);
mat2=cell(4,2);
for k=1:4

str_num=length(str);
name=name_serial{k};
result1=nan(str_num,5);
result2=nan(str_num,5);
result=nan(str_num,n2);
for i=1:str_num
   name=[name_serial{k},str{i},'.mat'];
   load(name);
   block=nan(10,n);
   for j=1:10
       block(j,:)=experiment_result_type{j,1}{7,1};
   end
   tmp=mean(block,1);
   tmp2=std(block,1);
   result1(i,:)=tmp(C);
   result2(i,:)=tmp2(C);
   result(i,:)=[tmp(C(1)),tmp2(C(1)),tmp(C(2)),tmp2(C(2)),tmp(C(3)),tmp2(C(3)),tmp(C(4)),tmp2(C(4)),tmp(C(5)),tmp2(C(5))];
end
mat2{k,1}=result1;
mat2{k,2}=result2;
end


        