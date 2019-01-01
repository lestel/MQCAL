function [score_block] = ttest2_block(mean_block,std_block,number,comp_line_num,method)
[wi,li]=size(mean_block);
comp_line_m=mean_block(comp_line_num,:);
comp_line_s=std_block(comp_line_num,:);
score_block=nan(wi,li);
for i=1:wi
    for j=1:li
        if method ==2
        [~,h1] = ttest2_my(mean_block(i,j),comp_line_m(1,j),std_block(i,j),comp_line_s(1,j),number);
        if h1==1
           if mean_block(i,j)>comp_line_m(1,j)
              score_block(i,j)=0;
           elseif mean_block(i,j)<comp_line_m(1,j)
              score_block(i,j)=3;
           elseif mean_block(i,j)==comp_line_m(1,j)
          
                  score_block(i,j)=1;
     
           end
        else
             score_block(i,j)=1;
        end
        
        elseif method ==1
        h1 = ttest1_my(mean_block(i,j),comp_line_m(1,j),std_block(i,j),comp_line_s(1,j),number);  
        if h1==1
           if mean_block(i,j)>comp_line_m(1,j)
              score_block(i,j)=0;
           elseif mean_block(i,j)<comp_line_m(1,j)
              score_block(i,j)=3;
           elseif mean_block(i,j)==comp_line_m(1,j)
          
                  score_block(i,j)=1;
     
           end
        else
             score_block(i,j)=1;
        end
        elseif method ==0
        
           if mean_block(i,j)>comp_line_m(1,j)
              score_block(i,j)=0;
           elseif mean_block(i,j)<comp_line_m(1,j)
              score_block(i,j)=3;
           elseif mean_block(i,j)==comp_line_m(1,j)
             if std_block(i,j)>comp_line_s(1,j)
                  score_block(i,j)=3;
             elseif std_block(i,j)<comp_line_s(1,j)
                  score_block(i,j)=0;
             elseif std_block(i,j)==comp_line_s(1,j)
                  score_block(i,j)=1;
             end    
           end
        end
    end
end
               

              

     