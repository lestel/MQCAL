function [C]=Fun_MOORA(m,n,D,w,MM,par)

%   5/06/2017
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   
%   (update 08.03.2018 :   +Normalization of decision matrix DM
%   (1)- Max method; (2)Sum method; (3)- Max-Min method; (4)- Vector
%   method;

%   This Matlab code file is provided for MOORA implimentation function code  
%   (MultiObjective Optimization on the basis of Ratio Analysis)

%   References:

% Brauers, W. K. M., and Zavadskas, E. K., (2006). The MOORA method and its
%    application to privatization in a transition economy, Control and Cybernetics, Systems
%    Research Institute of the Polish Academy of Sciences, 35(2), pp. 445–469.
% Brauers, W. K. M., (2008). Multiobjective contractor’s ranking by applying the
%    MOORA method, Journal of Business Economics and Management, 4, pp. 245–255.
% Brauers, W. K. M., Zavadskas, E. K., Peldschus, F., and Turskis, Z., (2008). Multiobjective
%    optimization of road design alternatives with an application of the MOORA
%    method, Proceedings of the 25 th International Symposium on Automation and
%    Robotics in Construction, Vilnius Gediminas Technical University, Lithuania, June
%    26-29,541-548.

% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes äîõîä; 
%                                   =-1 for cost attributes (expenditure) ðàñõîä

    
%-- MOORA Ratio System (RS) approch:

        
    %-- Construct the Weighted Normalized Decision Matrix   
    %   1 Max method; 2 Sum method; 3 (Max-Min) method;  4 Vector method
    
    V=Fun_DMnorm(m,n,D,w,MM,par);  
    V=V.*repmat(MM.*w,m,1);     
 
    C=sum(V,2);
    
return