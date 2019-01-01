function [ w ] = Weight_Entropy(DM,dWeight,m,n)

 
% ------ This function calculate weight of criteria by entropy technique

% - DM-Decision Making Matrix [mxn] 
% - dWeight - the weight of attributes determined by decision-maker [1xn]


sumDmm=sum(DM);
sumDmmMatrix=repmat(sumDmm,m,1);      %--- 
pij=DM./sumDmmMatrix;                 % Normalizing Decision Making Matrix  


lnm= -1 / log(m); 
lnNormDmm = log(pij);
E=lnm .* sum(pij .* lnNormDmm);
dj=ones(1,size(E,2))-E ;      %  Calculating the information Entropy of Criterion j 
weightEntropy=dj ./sum(dj) ;  %  computing Entropy weight
w=dWeight.*weightEntropy ./sum(dWeight .*weightEntropy);
end

%-------- Test
%D=[4 6 0.9 35 0.5 95 0.4 0.7;
%2 5 0.5 70 0.4 75 0.8 0.5;
%4 5 0.6 65 0.8 85 0.8 0.6;
%6 4 0.8 40 0.9 90 0.7 0.8;
%5 6 0.7 55 0.6 95 0.5 0.9]

%dWeigh=[1 1 1 1 1 1 1 1 1 ];

%Out:
%Wt=[0.2464 0.0482 0.0939 0.1545 0.1922 0.0168 0.1540 0.0939]



