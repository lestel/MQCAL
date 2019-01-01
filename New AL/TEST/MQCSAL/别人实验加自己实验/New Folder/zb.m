%{
clc
clear

load('RESULTforall2.mat');
BT=zb(mat3);
%}
function BT=zb(mat3)



w=size(mat3{1,1},2)/2;
l=size(mat3{1,1},1);
BT=[];
for k=1:size(mat3,1)
  bt=cell(l+1,w);
  TMP=mat3{k,1}; 
  for i=1:(l+1)
    for j=1:w
        if i<=l-1  
            s1=TMP(i,(j*2-1));
            s2=TMP(i,(j*2));
            s1=num2str(round(s1*1000)/1000);
            s2=num2str(round(s2*1000)/1000);
            s1=buling(s1,3);
            s2=buling(s2,3);
            str=[s1,'¡À',s2];
            bt{i,j}=str;
        elseif i==l
            s1=TMP(i,(j*2-1));
            s2=TMP(i,(j*2));
            s1=num2str(round(s1*10000)/10000);
            s2=num2str(round(s2*10000)/10000);
            s1=buling(s1,4);
            s2=buling(s2,4);
            str=[s1,'¡À',s2];
            bt{i,j}=str;
        elseif i==l+1 
            bt{i,j}=[];
        end
    end
  end
   BT=[BT;bt]; 
end
        
    function s1=buling(s,opt)
        s_num=length(s);
        if opt==3
           if s_num==1
              s1=[s,'.000'];
           elseif s_num==3
              s1=[s,'00'];
           elseif s_num==4
              s1=[s,'0']; 
           else
               s1=s;
           end
        elseif opt==4
           if s_num==1
              s1=[s,'.0000'];
           elseif s_num==3
              s1=[s,'000'];
           elseif s_num==4
              s1=[s,'00']; 
           elseif s_num==5
              s1=[s,'0']; 
           else
               s1=s;
           end
        else
            s1=s;
        end
        