function [Q]=Fun_CODAS(m,n,D,w,MM,u,par)

%   6/02/2018
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   
%   This Matlab code file is provided for CODAS implimentation function code  
%   (COmbinative Distance-based ASsessment) method

%   References:
%   Kechavarz Ghorabaee, M., Zavadskas, E.K., Turskis, Z. & Antucheviciene,
%   J. (2016). A new COmbinative Distance-based ASsessment (CODAS) method
%   for Multi Criteria  Decision-Making. Economics Computation & Economicc
%   Cybernetics Studies & Research, 50.


% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход

        
    %-- Construct the Weighted Normalized Decision Matrix  
    %-- Construct the Weighted Normalized Decision Matrix  norm(D(:,j),p);   
    
    V=Fun_DMnorm(m,n,D,w,MM, par);     
    V=V.*repmat(w,m,1);
    
 %-- CODAS method
 
    r=min(V);
    D3=V-repmat(r,m,1);
    for i=1:m
        E1=D3(i,:);
        E(i)=norm(E1,2);
        T(i)=norm(E1,1);
    end
    
    for i=1:m
        for k=1:m
            s=0;
            if abs(E(i)-E(k))>=u
                s=1;
            end
            H(i,k)=(E(i)-E(k))+s*(T(i)-T(k));
        end
    end
    
    Q=sum(H,2);    %  sum rows
                   %  max- the best alternatives
   
return