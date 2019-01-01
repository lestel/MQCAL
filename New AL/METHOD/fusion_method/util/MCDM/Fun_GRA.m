function [C]=Fun_GRA(m,n,D,w,MM,k,par)

%   05/06/2017 
%   (update 23.02.2018 +  Normalization of decision matrix DM
%        (2)- Vector method; (3)- Max-Min method; (4)- Sum method
%
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   
%   This Matlab code file is provided for GRA implimentation function code  
%   (Grey Relation Analysis)

%   References:
%    Deng, J.L. (1989). Introduction to grey system. 
%       Journal of Grey System, 1(11), 1-24


% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход


    V=zeros(m,n); 
    C1=zeros(m,1); R1=zeros(m,1); C2=zeros(m,1); R2=zeros(m,1);
    r=zeros(1,n); r1=zeros(1,n); r2=zeros(1,n);
    
    %-- Construct the Weighted Normalized Decision Matrix 
    t1=max(D);     %--max 
    t2=min(D);     %--min

%----------------------------- GRA ------------------------------------      
    
   %- Construct the Weighted Normalized Decision Matrix  without W

    V=Fun_DMnorm(m,n,D,w,MM,par);  
    
    r=max(V);
    A=abs(repmat(r,m,1) -V);
    
    for i=1:m
        S1(i)=max(A(i,:));
        S2(i)=min(A(i,:));
    end
   
    %k=0.5;
    G=(min(S2)+k*max(S1)) ./ (A+k*max(S1));

    G1= G.*repmat(w,m,1); 
    C=sum(G1, 2);                 %./n;  

return