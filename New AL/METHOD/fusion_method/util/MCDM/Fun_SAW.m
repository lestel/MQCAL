function [C]=Fun_SAW(m,n,D,w,MM,par)

%  05/06/2017 
%  (update 23.02.2018 +  Normalization of decision matrix DM
%  (1)- Max method; (2)Sum method; (3)- Max-Min method; (4)- Vector method;
%      +(JKN)Juttler's Korth's method

%
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   
%   This Matlab code file is provided for SAW implimentation function code  
%   (Simple Additive Weighting))

%   References:
%    Kaklauskas, A., Zavadskas, E.K., Raslanas, S., Ginevicius, R., Komka, A., Malinauskas, P. 
%    Selection of Low-e tribute in retrofit of public buildings by applying multiple criteria method COPRAS: A Lithuanian case. 
%    Energy and buildings, Vol. 38, 2006, pp. 454-462.


% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход

   
%-- SAW method:

    V=zeros(m,n); C=zeros(m,1); 
    
    %-- Construct the Weighted Normalized Decision Matrix    
    %   -1 Max Inverse method;  -2 Sum method; -3 (X-Min)/(Max-Min) method;  -4  Vector method
    
      V=Fun_DMnorm(m,n,D,w,MM, par);  
      V=V.*repmat(w,m,1);
      C=sum(V,2);
   
return