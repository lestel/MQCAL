function [C]=Fun_TOPSIS(m,n,D,w,MM, DS, par)

%   8/03/2017   (update 8/03/2018  + distance method)
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   
%   This Matlab code file is provided for TOPSIS implimentation function code  
%   (Technique for Order of Preference by Similarity to Ideal Solution)

%   References:
%   Hwang, C.L., & Yoon, K. (1981). Multiple attribute decision making: Methods and applications.
%   Heidelberg: Springer. http://dx.doi.org/10.1007/978-3-642-48318-9

% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit attributes; =-1 for cost attributes

    Aup=zeros(1,n); Alow=zeros(1,n);
    V=zeros(m,n); D1=ones(m,n);
    V1=zeros(m,1); V2=zeros(m,1); 
    S1=zeros(m,1); S2=zeros(m,1); 
    C=zeros(m,1);  
    
%=========================================================================    
    %-- 1) normalization: Vector method
    
    %-- Construct the Weighted Normalized Decision Matrix
    %   1 Max method; 2 Sum method; 3 (Max-Min) method;  4 Vector method
    
    V=Fun_DMnorm(m,n,D,w,MM,par);  
    V=V.*repmat(w,m,1);     

   %-- Determine Ideal (Aup) and Negative-Ideal (Alow) Solutions

   for j=1:n
       if MM(j)==1
           Aup(j) =max(V(:,j));
           Alow(j)=min(V(:,j));
       else
           Aup(j) =min(V(:,j));
           Alow(j)=max(V(:,j));  
       end
   end
   
   dV1=repmat(Aup, m,1) - V;
   dV2=repmat(Alow,m,1) - V;
   
   %-------   S+=S1, S-=S2 ---- 
   if DS==1   % 1) Euclidean Distance  (Average mean)
       V1=sum(dV1.^2, 2);
       V2=sum(dV2.^2, 2);
       S1=sqrt(V1);
       S2=sqrt(V2);
       C=S2./(S1+S2);
   end
   if DS==2   % 2) Sity Cab Distance   (Mean square)
       V1=sum(abs(dV1), 2);
       V2=sum(abs(dV2), 2);
       C=V2./(V1+V2);
   end
   
   a=0.5;          %  threshold of indifference    
   
   if DS==-1      % Medium harmonic;   d=2./ ( 1./(1-a)*r + 1./a*repmat(rc,m,1) );
      % eV1=zeros(m,1); eV2=zeros(m,1);
      % eV1=1./dV1; eV2=1./dV2;
      % V1=sum(1./dV1, 2);
      % V2=sum(1./dV2, 2);
      %  C=V2./(V1+V2);
   end
   if DS==Inf       % max(,);    d=max((1-a)*r, a*repmat(rc,m,1));
        for i=1:m  
             V1(i)=max( abs(dV1(i,:)) );
             V2(i)=max( abs(dV2(i,:)) );
        end
        C=V2./(V1+V2);
   end
   if DS==-Inf      % min(,);    d=min((1-a)*r, a*repmat(rc,m,1));
        for i=1:m  
             V1(i)=min( dV1(i,:) );
             V2(i)=min( dV2(i,:) );
        end
        
        C=V2./(V1+V2); 
        for i=1:m
            if C(i)== Inf  | C(i)==-Inf
                C(i)=0;
            end
        end     
   end
            
return

