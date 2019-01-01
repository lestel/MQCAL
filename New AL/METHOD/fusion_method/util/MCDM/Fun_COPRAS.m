function [Q]=Fun_COPRAS(m,n,D,w,MM,par)

%   5/06/2017
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   
%   This Matlab code file is provided for COPRAS implimentation function code  
%   (COmplex PRoportional ASsessment) method for MCDM problems
%    and Additive Ratio Assessment (ARAS) method
%   References:

%-- Ustinovichius, L., Zavadskas, E.K., & Podvezko, V. (2007). Application of 
%      a quantitative multiple criteria decision making (MCDM-1) approach to the analysis 
%      of investments in construction. Control and Cybernetics, 36 (1), 251Ц268. 
%-- Viteikiene, M., & Zavadskas, E.K. (2007). Evaluating the sustainability of 
%      Vilnius city residential areas. Journal of civil engineering and management, 13 (2), 149-155. 


% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%       COPRAS-G method was applied to the selection of the effective walls for a dwelling house
%   for COPRAS-G method Aij=(Lij+Uij)/2
%       ARAS=COPRAS-(cost attributes)
%
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход

    
V=zeros(m,n);
Q=zeros(m,1);
        

%-- COPRAS method 

    %-- Construct the Weighted Normalized Decision Matrix (Standart norm = SUM )
       
    V=Fun_DMnorm(m,n,D,w,MM, par);  %   
    V=V.*repmat(w,m,1);
   
    
    P=zeros(m,1);  R=zeros(m,1); 
    %-------   P, R
    for i=1:m
        for j=1:n
            if MM(j)==1
               P(i)=P(i)+V(i,j);  % sum for beneficial attributes,
            else
               R(i)=R(i)+V(i,j);  % sum for non-beneficial attributes 
            end           
        end
    end

   p1=sum(R); 
   u1=0; 
   for i=1:m             % sum(1/Ri)
       if R(i)~=0
          u1=u1+1/R(i);   
       end
   end
   
   if u1~=0
        for i=1:m
            if R(i)~=0
                Q(i)=P(i)+p1/(R(i)*u1);
            else
                Q(i)=P(i);    %-- ???
            end
        end 
   else   %--ARAS (non cost attributes)
       Q=P;
   end  
   
   %Q1=max(Q);
   %Q=Q/Q1;  %*100;   %-- the utility degree of each alternative
   % maxQ the best alternative

return