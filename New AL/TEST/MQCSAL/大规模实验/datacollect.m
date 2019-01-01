%str={'8','10','12','15,'183','n'};
str={'8','10','12','15','17','18','n'};
name_serial={'EEG_','Epileptic_','MoCap_','mushroom_'};
% c=2,3,4,5,6,7
c=2;
n=248;
k=3;
str_num=length(str);
name=name_serial{k};
result=nan(str_num,n);
for i=1:str_num
   name=[name_serial{k},str{i},'.mat'];
   load(name);
   block=nan(10,n);
   for j=1:10
       block(j,:)=experiment_result_type{j,1}{c,1};
   end
   tmp=mean(block,1);
   result(i,:)=smooth(smooth(smooth(mean(block,1))));
end