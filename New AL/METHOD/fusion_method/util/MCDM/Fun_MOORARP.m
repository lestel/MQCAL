function [CR]=Fun_MOORARP(m,n,D,w,MM, par)

%   5/06/2017
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   
%   (update 08.03.2018 :   
%   + MOORA-RP (Reference Point approch)

%   This Matlab code file is provided for MOORA implimentation function code  
%   (MultiObjective Optimization on the basis of Ratio Analysis)


% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход

    

    %---------------- MOORA RP (Reference Point approch--------------------
    
    % --In order to measure the distance between the alternatives and the reference
    % point, the Tchebycheff Min-Max metric is chosen 
    % (Karlin and Studden, 1966, p. 280):  (минимаксная метрика Чебышева)
        
    %-- Construct the Weighted Normalized Decision Matrix   
    %   1 Max method; 2 Sum method; 3 (Max-Min) method;  4 Vector method
    
    V=Fun_DMnorm(m,n,D,w,MM, par);   %   Max method

    for j=1:n
         if MM(j)==1
            r(j)=max(V(:,j));
         end
         if MM(j)==-1
            r(j)=min(V(:,j)); 
         end
    end
       
    V=abs(repmat(r,m,1) -V) .*repmat(w,m,1);
   
    for i=1:m
        C(i)=max(V(i,:));
    end
    CR=C'; 

return