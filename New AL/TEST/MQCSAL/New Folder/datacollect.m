%str={'8','10','12','15,'183','n'};
str={'3','8','12',''};

% c=2,3,4,5,6,7
c=2;
n=48;
k=3;
str_num=length(str);
name1='wdbc_NN';
result=nan(str_num,n);
for i=1:str_num
   name=[name1,str{i},'.mat'];
   load(name);
   block=nan(1,n);
   for j=1:1
       block(j,:)=experiment_result_type{j,1}{c,1};
   end
   if size(block,1)~=1
   tmp=mean(block,1);
   else
   tmp=block;
   end
   result(i,:)=tmp;
end