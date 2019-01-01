function [Qt, Rt]=Fun_VICOR(m,n,D,w,MM,v, par)

%   4/06/2017
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   
%   This Matlab code file is provided for VIKOR implimentation function code  
%   (VI?ekriterijumsko KOmpromisno Rangiranje)

%   References:
%   Opricovic, S., Tzeng, G. H., “Compromise solution by MCDM methods: A comparative analysis of VIKOR and TOPSIS,
%   European Journal of Operational research, Vol. 156, No. 2, pp. 445-455, 2004.

% Si strategy of the maximum group utility
%    
% Ri strategy of "the majority of criteria"
%     
% Qi compromise solution
%    


% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход
%   v  is introduced as weight of the strategy of "the majority of attributes"
%     "Voting by majority rule" (v> 0.5); 
%        or "by consensus" (for v = 0.5); 
%          or "with a veto" (for v <0.5).

    S=zeros(m,1); R=zeros(m,1); C=zeros(m,1);
        
    %-- Construct the Weighted Normalized Decision Matrix  norm(D(:,j),p);   
    
    V=Fun_DMnorm(m,n,D,w,MM, par);  
    V=V.*repmat(w,m,1);
   
%-- VIKOR method
    
    S=sum(V,2);      %-- norm(D(:,j),p=1);
    for i=1:m
        R(i)=max(V(i,:));   %-- norm(D(:,j), p=infinity
    end
    %-------   S+=S1, S-=S2
    S1=min(S);    S2=max(S);     
    R1=min(R);    R2=max(R);
    
    S=(S-S1)./(S2-S1);
    R=(R-R1)./(R2-R1);

    C=v*S+(1-v)*R; 
    
    %========================= Condition ==================================
              
             % C=v*S+(1-v)*R;
                % C1:  C(A2)-C(A1) >= DQ=1/(m-1)    Допустимое преимущество  =>
                % C2:  S(A2)-S(A1) >=DQ  .or. R(A2)-R(A1) >= DQ

                [Q,ix] =sort(C);   % сортировка в порядке возрастания (if 'descend' убывания), ix-индексы
                r=tiedrank(Q); %-------- ранги 1-наименьшее m-наибольшее
                S1=zeros(m,1); R1=zeros(m,1);
                for i=1:m
                     S1(i)=S(ix(i));
                     R1(i)=R(ix(i));
                end
                
                C2=zeros(m,1);
                for i=1:m-1
                     C2(i+1)=Q(i+1)-Q(1);
                end
                DQ=1/(m-1);

                % Qmin if the following two conditions are satisfied:
                %---------------------------------------------------
                Condition1=0; Condition2=0;
                
                if Q(2)-Q(1) >= DQ
                     Condition1=1;
                end
                if S(ix(2))-S(ix(1)) >= DQ |  R(ix(2))-R(ix(1)) >= DQ
                     Condition2=1;
                end
['Condition#1=' num2str(Condition1,'%d')  ', Condition#2=' num2str(Condition2,'%d')]    
                
   
                k=0;
                if (~Condition1 & Condition2) | (~Condition1 & ~Condition2)
                     for i=3:m
                          if Q(i-1)-Q(1) < DQ  &  Q(i)-Q(1) >= DQ
                              k=i;
                              break
                          end 
                     end
                        if k ~= 0 
                            %'A1...Ak'   rank A1..Ak they do not differ (indistinguishable)
                           for i=1:k
                              r(i)=1;
                           end
                        else
                            '.not. Condition#1 & Condition#2 .and. k=m'
                        end
                end
                if Condition1 & ~Condition2
                   'A1 A2'
                end
                %-----------------------------------------------------------
                DQ
                
                '----rank---  index(A) ----Q---- ----S---- ----R----   Q(i)-Q1'

                [r, ix, Q, S1, R1, C2]
                for i=1:m
                    QQ(ix(i))=Q(i);
                    RR(ix(i))=r(i);
                end
                %- r ------- ранги 1- наименьшее  
   
   Qt=QQ';  Rt=RR';
   
return