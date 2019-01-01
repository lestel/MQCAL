function [Q]=Fun_PROMETHEE(m,n,D,w,MM,cH)

%------------------------  <MCDM> Data Analis -----------------------------
%   30/06/2017
%   Ufa State Petroleum Technological University
%
%   Author: Dr. Irik Z. Mukhametzyanov (e-mail: izmukhametzyanov@gmail.com )
%
%--------------------------------------------------------------------------
%   This Matlab code file is provided for PROMETHEE method for MCDM problems
%   (Preference Ranking Organisation METHod for Enrichment Evaluations)  
%
%   References:
%   Brans, J.P., B. Mareschal, and Ph. Vincke. How to select and how to rank projects: The PROMETHEE
%   method. European Journal of Operational Research, 24(2): 228Ц238, 1986.
%
%
%   w - the Rank of kriteria determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход

%   cH - Types of preference functions H(d) with parameters that illustrate   them,       
%        determined by decision-maker [1xn]
%        =1 regular;  x<> 0
%        =2 U-Shape ([p 0]  p>0);              p - indifference threshold
%        =3 V-Shape ([p 0]  p>0);     
%        =4 Level criterion( [p g]);    p,q>0     Two parameters (q-the difference in threshold) 
%        =5 Linear criterion( [p g]);   p,q>0     Two parameters
%        =6 Gaus criterion [p p]) p=sigma;  
% 
%             
%------------------------ PROMETHEE II method -----------------------------
     
   
   V1=zeros(n,m,m); V=zeros(m,m); Fplus=zeros(m,1);  Fminus=zeros(1,m);

   %-- Determine Preference          
        kType=6;
        % Linear: p & q thresholds 
        p=zeros(kType,n); q=zeros(kType,n);
           
        p(2,:)=ceil((max(D)-min(D))/m);   % floor?
        p(3,:)=ceil((max(D)-min(D))/m);
        p(4,:)=ceil((max(D)-min(D))/m);
        p(5,:)=ceil((max(D)-min(D))/m);
             
        q(4,:)=ceil(1.41*(max(D)-min(D))/m);
        q(5,:)=ceil(1.41*(max(D)-min(D))/m);
              
        p(6,:)=(p(5,:)+q(5,:))/2;
   
        for j=1:n
            for i=1:m
                for s=1:m 
                    %-- for each j -> Hj   ?    abs ?
                    d=D(i,j)-D(s,j);
                    H=H_app(d, cH(j), p(cH(j),j), q(cH(j),j), MM(j));
                    V1(j,i,s)=w(j)*H;
                end
            end
        end
        V(:,:)=sum(V1,1);       
        
        Fplus =sum(V,2)-diag(V)  ;
        Fminus=sum(V,1)-diag(V)' ;
 
 %------------------------ version PROMETHEE II (Complete Ranking)
 Q=Fplus-Fminus';
 %R=m+1-tiedrank(Q,2);      %-- rank 
 

 
 %========================= Preference functions H ========================
  
 function H=H_app(X, iType, p, q, sJ)   

        %-- sJ=MM benefit(+1) or cost(-1)
         
        H=0;
        if iType==1  % regular  preference functions         
             if X*sJ>0              
                H=1;
             end
         end        
         if iType==2  % U-shape preference functions
             if X*sJ>0  % ++/ --
                 if abs(X)<=p
                     H=0;
                 else
                   H=1;
                 end
             end
         end
         if iType==3  % V-shape preference functions
             if X*sJ>0  % ++/ --             
                if abs(X)<p
                   H=abs(X)/p;
                else
                   H=1;
                end
             end
         end
         if iType==4  % Level criterion, two parameters p q
             if X*sJ>0  % ++/ --
                if abs(X)<=p 
                    H=0;
                elseif abs(X)<q
                    H=0.5;
                else
                    H=1;     
                end
              end
         end
         if iType==5  % Linear preference functions, two parameters p q
             if X*sJ>0
                if abs(X)<=p
                    H=0; 
                elseif abs(X)<=q
                    H=(abs(X)-p)/(q-p);
                else
                    H=1; 
                end
             end 
         end
         if iType==6  % Gaus preference functions, p=mu
             if sJ*X>0   % ++ /or --
                H=1-exp(-X*X/(2*p^2));
             end
         end
         
return