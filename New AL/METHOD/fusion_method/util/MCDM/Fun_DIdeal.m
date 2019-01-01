function [C0]=Fun_DIdeal(m,n,D,w,MM,Lp,kDel,par)

%****************  <MCDM> Data Analis -------------------------------------
%   12/10/2017
%   Ufa State Petroleum Technological University
%
%   Author: Dr. Irik Z. Mukhametzyanov (e-mail: izmukhametzyanov@gmail.com )
%
%--------------------------------------------------------------------------
%                     Displaced Ideal Method  (Метод смещенного идеала)
%--------------------------------------------------------------------------
%   
%   This Matlab code file is designed to solve MCDM problems
%
%   References:
% 

% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.

%   w - the Rank of kriteria determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход
%   kDel -  Delete poor Alternatives for 1 iteration
             
    
%----------------------- Displaced Ideal Method  --------------------------

Aup=zeros(1,n); Alow=zeros(1,n); C0=zeros(m,1);
 

%-- Delete parameters for 1 iteration (kDel=) Delete Alternatives
minK=3;                    % min Аlternatives 
m1=floor((m-minK)/kDel);   % step for kDel 

m0=m;   
A=zeros(m,1);  %  Numbers Alternatives
for i=1:m
     A(i)=i;
end

D0=D; A0=A; 

for ii=1:m1      %--  extract 'kDel' poor Alternatives in 'm1' iterations
    
   V=zeros(m,n); V1=zeros(m,1);      
   
   %-- Construct the Weighted Normalized Decision Matrix
   %-- with Determine Positive and Negative Solution 
   
   V=Fun_DMnorm(m,n,D,w,MM, par);  
   V=V.*repmat(w,m,1);

   %-- Lp-norm for Alternatives p={list}
   s=length(Lp);
   L=zeros(m,s); L1=zeros(m,s); ; C=zeros(m,s);
   for i=1:m
       V1=V(i,:);
       for k=1:s
           p=Lp(k);
           L(i,k)=norm(V1,p);
       end
   end
   
   %-- The rank the Alternatives (min -good; max -poor)
   Lmax=max(L);  % max for i=1..m for each p 
   for j=1:s
       C(:,j)=L(:,j)/Lmax(j);  % norm p-cols
   end
   C1=sum(C,2)/s;
   if ii==1
       C0=C1;
   end
   
   L1=(m+1)-tiedrank(L,1);  %  rank of Alternatives for each p 
   sumL1=sum(L1,2);         %  sum ranks for p
  
     
   %-- Extract poor Alternatives
   for ik=1:kDel
        sL1=sum(L1,2);
        [s1,ix]=max(sL1) ;
        % Tx=char(['Delete alternative is A', num2str(A(ix),'%d'), ' ; sum ranks for p-Norm is: ',num2str(s1,'%5.2f')])
        C0(A(ix))=C1(ix);  % save C1(ix) - deletet alternatives
        D=zeros(m-1,n); A=zeros(m-1,1); L2=zeros(m-1,s); C2=zeros(m-1,1);

        if ix==1
            D=D0([2:m],:);
            A=A0([2:m]);
            L2=L1([2:m],:);
            C2=C1([2:m]);
        elseif  ix==m
            D=D0([1:m-1],:);
            A=A0([1:m-1]);
            L2=L1([1:m-1],:);
            C2=C1([1:m-1]);
        else
            %  Concatenate arrays after delete "ix" rows
            D =cat(1,D0([1:ix-1],:),D0([ix+1:m],:)) ;
            A =cat(1,A0([1:ix-1]),  A0([ix+1:m])  ) ;
            L2=cat(1,L1([1:ix-1],:),L1([ix+1:m],:)) ;
            C2 =cat(1,C1([1:ix-1]),  C1([ix+1:m])  );
        end
        m=m-1;
        D0=zeros(m,n); A0=zeros(m,1); L1=zeros(m,s); sL1=zeros(m); C1=zeros(m);
        D0=D; A0=A; L1=L2; C1=C2;
   end
   nr=m0-m1*kDel;
   for i=1:nr
       C0(A(i))=C1(i);
   end 
end

% ------------------ table result Q: -------------

sL1=sum(L1,2);
[s1,ix]=min(sL1) ;

ip1=cat(2,Lp,[0]);      %  Concatenate arrays 2='Cols'
ip2=cat(2,[0],ip1);

L3=cat(2, L1,sL1);
L4=cat(2, A,L3);

Q=cat(1,ip2,L4);

% table result Q:
%    |  p1  p2 ...     sum
% Ai |                  -
% As |   Rank(i,p)      -
% Aq |                  - 

% Tx=char(['The best alternative is A', num2str(A(ix),'%d'), ' ; Sum rank for p-Norm is: ',num2str(s1,'%5.2f')])               


  return