

function h = ttest1_my(mean1,mean2,std1,std2,number)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
if number<2
    errordlg('number is too low')
else    
    array1=ones(1,number)*mean1;
    array2=ones(1,number)*mean2;
    b=sqrt((number-1)/number);
    if mod(number,2)==1
    tmp=[ones(1,(number-1)/2)*-1*b,0,ones(1,(number-1)/2)*1*b];
    elseif  mod(number,2)==0
    tmp=[ones(1,number/2)*-1*b,ones(1,number/2)*1*b];
    end
    array1=array1+(tmp*std1);
    array2=array2+(tmp*std2);
    p = ranksum(array1,array2);
    if p<0.05
    h=1;
    else
    h=0;
    end
        
    
    
end





