function [Q,R]=Fun_ORESTE(m,n,D,w,MM,a,beta,gamma,Lp, iPlot)


%****************  <MCDM> Data Analis -------------------------------------
%   25/06/2017
%   Ufa State Petroleum Technological University
%
%   Author: Dr. Irik Z. Mukhametzyanov (e-mail: izmukhametzyanov@gmail.com )
%
%--------------------------------------------------------------------------
%   This Matlab code file is provided for ORESTE implimentation function code  
%   "Organisazion, RangEment ot SynTEze de donnecs relationnelles" method
%   for MCDM problems

%      References:

%   Brans, J. P. Vincke, Ph. Mareschal, B. (1986). 
%   How to select and how to rank projects: The ORESTE method. 
%   European Journal of Operational Research, 24: 228?38. 

% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.

%   w - the Rank of kriteria determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes дохо? 
%                                   =-1 for cost attributes (expenditure) расход
%   beta - Indifference, Preference coefficient
%   gamma - Preference relation coefficient
%   a -  the coefficient from (0;1) is given by the decision maker; 
%        Determines to what extent the rank of the criterion or 
%        the ranks of the options for each criterion  

                       
    
%----------------------------- ORESTE method ------------------------------
alfa=beta*(1+gamma);   

r=zeros(m,n); Rd=zeros(m,n);  
R=zeros(m,1); 
rc= zeros(1,n); 

    %  D -> r (rank); highest Rank=1; lowest Rank = m
    
    for j=1:n
          if MM(j)==1
               r(:,j)=tiedrank(-D(:,j));  % descend for beneficial attributes, ?по?дк?убыван? 
          else
               r(:,j)=tiedrank(D(:,j));  % ascend for non-beneficial attributes сортировка
          end 
    end
    rc=tiedrank(w);   % ranks of criteria
    
    %-- Projections of ranks  
    %-- Linear projection  (orthogonal linear projection for a=0.5)
   
    
    %-- non Linear projection
    % p=1 Average (mean); -1 Medium harmonic; 2-Mean square; inf  -max(R,w)
           % -inf  min(R,w)
    if Lp==Inf
        d=max((1-a)*r, a*repmat(rc,m,1));
    elseif Lp==-Inf
        d=min((1-a)*r, a*repmat(rc,m,1));
    elseif Lp==-1
        d=2./ ( 1./(1-a)*r + 1./a*repmat(rc,m,1) );
    else
        d= ( (1-a)*r.^Lp+a*(repmat(rc,m,1)).^Lp ).^(1/Lp);     
    end
               
    
    %-- Ranking projection; Total rank
    
    d1=zeros(1,m*n);
    for i=1:m
        d1(1,n*(i-1)+1:n*i)=d(i,1:n);
    end
    Rd1=tiedrank(d1);
    for i=1:m
        Rd(i,1:n)=Rd1(1,n*(i-1)+1:n*i);
    end
    
    Q=sum(Rd,2);
   
    %-- OutRank
    R=tiedrank(Q);
 
    
   %--------------- Stage  ORESTE I completed 
   %-- Total rank  (min = the Best Alternatives)
       
   %'-----------------  ORESTE I -------------------'
   %'Preference relation: '
  

   
   %--------------- Stage 2: Calculation of preference coefficients C(mxm), C(Ai>Aj)
   
   C=zeros(m,m);
   for i=1:m  
   for p=1:m
        for j=1:n
             C(i,p)=C(i,p)+ Rd(i,j)-Rd(p,j) + abs(Rd(i,j)-Rd(p,j));
        end
   end
   end
   C=C'./(2*n*n*(m-1));
    
   %'-----------------  ORESTE II -------------------'
   Tx=char('GIA for ORESTE II');
   ['---- ORESTE II']
          
   %--------- Preference relation
 
   P=zeros(m,m);      
   for i=1:m
        for s=1:m
             if abs(C(i,s)-C(s,i)) <=beta & C(i,s)< alfa & C(s,i)<=alfa
                 P(i,s)=0;         % -- 1) Indifference ~     "0"
             elseif abs(C(i,s)-C(s,i)) > beta & (C(i,s)/abs(C(i,s)-C(s,i)) )>=gamma
                 P(i,s)=1;     % -- 2) Preference relation >  "1"
             elseif abs(C(i,s)-C(s,i)) > beta & (C(s,i)/abs(C(i,s)-C(s,i)) )>=gamma
                 P(i,s)=-1;    % -- 2) Preference relation <  "-1"
             else
                 P(i,s)=1/0;       % -- 3) Incomparable       "Inf"
             end          
        end
   end
   


if iPlot==1     %---------- GIA for alfa, beta, gamma ---------------------
  figure('Name',Tx,'NumberTitle','off');
  
  kA=(m-1)*m/2;
  X=zeros(kA,1); Y=zeros(kA,1);
  j=0;
  Uc=char('');
  for i=1:m  
      for p=i+1:m
          j=j+1;
          X(j)=C(i,p);
          Y(j)=C(p,i);
          if j==1
              Uc=cellstr( [num2str(i,'%d'),',' num2str(p,'%d')] );
          else
              Uc=[char(Uc),cellstr( [num2str(i,'%d'), ',', num2str(p,'%d')] ) ];
          end
      end
  end
  Tc = strvcat(Uc);   %[9x3] matrix array
  
  %xA=(gamma-1)/(2*gamma-1);  yA=gamma/(2*gamma-1);
  xA=gamma/(2*gamma+1);  yA=(gamma+1)/(2*gamma+1);
  
  xB=(gamma+1)/(2*gamma+1);  yB=gamma/(2*gamma+1);
  xC=beta*(gamma+1);         yC=beta*gamma;
 % xD=beta*(gamma-1);         yD=beta*gamma;
  xD=beta*gamma;                   yD=alfa;
  
  xE=beta; yE=0;          xF=0; yF=beta;     xG=alfa-beta; yG=alfa; 
  xH=alfa; yH=alfa-beta;  xO=alfa; yO=alfa;
  
  line([0 1],[1 0]   ,'Marker','.','LineStyle','-')
  line([0 0],[0 beta],'Marker','.','LineStyle','-')
  line([0 beta],[0,0],'Marker','.','LineStyle','-')
  line([xF xG],[yF yG],'Marker','.','LineStyle','-')
  line([xE xH],[yE yH],'Marker','.','LineStyle','-')
  line([xG xO],[yG yO],'Marker','.','LineStyle','-')
  line([xH xO],[yH yO],'Marker','.','LineStyle','-')
  
  
  line([xD xA],[yD yA],'Marker','.','LineStyle','-','Color',[1 0 0])
  line([xC xB],[yC yB],'Marker','.','LineStyle','-','Color',[1 0 0])
  line([xC xH],[yC yH],'Marker','.','LineStyle','-','Color',[1 0 0])
  line([xA xB],[yA yB],'Marker','.','LineStyle','-','Color',[1 0 0])
  %line([xA xB],[yA yB],'Marker','.','LineStyle','-','LineWidth',4,'Color',[1 0 0])
  
  axis([0 1 0 1])
  text(0.6,alfa,' A_i<A_k ','FontSize',13)   % ,'BackgroundColor',[.7 .9 .7]
  text(beta,0.6,' A_i>A_k ','FontSize',13)
  text(0.38,0.4,' \color{red}Inf ','FontSize',14)
  text(beta,beta,'\color{blue}\bf~','FontSize',16)
 
  %grid on
  
  text(.81,.82,['\alpha=' num2str(a,'%4.2f')],'FontSize',11 ,'Color',[0 0 1]);
  text(.81,.77,['\beta=' num2str(beta,'%4.2f')],'FontSize',11,'Color',[0 0 1] );
  text(.81,.72,['\gamma=' num2str(gamma,'%4.2f')],'FontSize',11,'Color',[0 0 1] );
  
  hold on
   
  plot(X,Y,'og','MarkerFaceColor',[0.5 0.5 0])
  %for i=1:kA
  %    text(X(i)+0.012,Y(i)+0.015,Tc(i,:),'FontSize',10)
  %end
  ylabel('Preference Coefficients C(p,i)','FontSize',11)
  xlabel('Preference Coefficients C(i,p)','FontSize',11)
  
  title(['Preferences for alternatives. ORESTE II, Lp=' num2str(Lp,'%d')],'FontSize',11);

  %------------ FRAGMENT---------------------------------------------------
  figure('Name',Tx,'NumberTitle','off');
  
  xx=max(max(X), max(Y));  xx=max(xx, 0.2);
  u=str2num(num2str(xx,'%3.1f'));
  if u < xx
      u=u+0.05;
  end
  
  axis([0 u 0 u])
  line([0 1],[1 0],'Marker','.','LineStyle','-')
  line([0 0],[0 beta],'Marker','.','LineStyle','-')
  line([0 beta],[0,0],'Marker','.','LineStyle','-')
  line([xF xG],[yF yG],'Marker','.','LineStyle','-')
  line([xE xH],[yE yH],'Marker','.','LineStyle','-')
  line([xG xO],[yG yO],'Marker','.','LineStyle','-')
  line([xH xO],[yH yO],'Marker','.','LineStyle','-')
  
  
  line([xD xA],[yD yA],'Marker','.','LineStyle','-','Color',[1 0 0])
  line([xC xB],[yC yB],'Marker','.','LineStyle','-','Color',[1 0 0])
  line([xC xH],[yC yH],'Marker','.','LineStyle','-','Color',[1 0 0])
  line([xA xB],[yA yB],'Marker','.','LineStyle','-','Color',[1 0 0])
  %line([xA xB],[yA yB],'Marker','.','LineStyle','-','LineWidth',4,'Color',[1 0 0])
  
  
  %grid on 
  hold on
  
  text(0.82*u,0.92*u, ['\alpha=' num2str(a,'%4.2f')],'FontSize',11,'Color',[0 0 1]);
  text(0.82*u,0.87*u, ['\beta=' num2str(beta,'%4.2f')],'FontSize',11,'Color',[0 0 1]);
  text(0.82*u,0.82*u,['\gamma=' num2str(gamma,'%4.2f')],'FontSize',11,'Color',[0 0 1]);
  
  plot(X,Y,'og','MarkerFaceColor',[0.5 0.5 0])
  for i=1:kA
      %    text(X(i)+0.012,Y(i)+0.015,Tc(i,:),'FontSize',10)
      text(X(i)+0.004,Y(i)+0.005,Tc(i,:),'FontSize',10)
  end
  ylabel('Preference Coefficients C(p,i)','FontSize',11)
  xlabel('Preference Coefficients C(i,p)','FontSize',11)
  
  % a=0.5; beta=0.05; gamma=1.4; 
 % title(['Preferences for alternatives. ORESTE II. (Fragment)'  ...
 %       ' \alpha=' num2str(a,'%4.2f') ', \beta=' num2str(beta,'%4.2f')  ... 
 %      ', \gamma=' num2str(gamma,'%4.2f') ', Lp=' num2str(Lp,'%d') ] ,'FontSize',11); 
  
  title(['Preferences for alternatives. ORESTE II. (Fragment), Lp=' num2str(Lp,'%d')],'FontSize',11);

  hold off    
end

return