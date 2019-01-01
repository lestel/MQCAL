%******************************  <MCDM Methods>  **************************
%
%  УMCDM toolsФ contains a set of MatLab functions implementing for rank 
%  methods for task Multi-Criteria Decision Making (MCDM) methods: 
%     SAW, MOORA(RS, RP), COPRAS, VIKOR, MABAC, TOPSIS(Euclidean-CityCab), 
%     DТIDEAL, ORESTE 1-2, PROMETHEE I-II, CODAS, GRA, GRA(T)
%
%-------------------------------------------------------------------------- 
% 
% Main programm: MCDM_tools.m
%
% function: 
%       fun_SAW, fun_MOORA, fun_MOORARP, fun_COPRAS, fun_VIKOR, fun_TOPSIS
%       fun_DIdeal, fun_MABAC, fun_ORESTE, fun_PROMETHEE, fun_CODAS, fun_GRA, 
%       fun_GRAt,  
%
%    fun_DMnorm - normalization of decision matrix DM
%       (1)- Max method; (2)Sum method; (3)- Max-Min method; (4)- Vector method;
%       +(JKN)Juttler's Korth's method
%
%    Weight_Entropy - calculate Weight of Criteria by Entropy technique
%              
%--------------------------------------------------------------------------
%
%   Author: Dr. Irik Z. Mukhametzyanov (e-mail: izmukhametzyanov@gmail.com)
%   
%   Ufa State Petroleum Technological University, Russian Federation
%   10/11/2017 (update 08.03.2018)
%
%--------------------------------------------------------------------------
%
%   INPUT ARGUMENTS:
%   D  - [mxn] Decision Making Matrix, where m are Alternatives
%               considered and n the Criteria
%   w  - [1xn] weights vector of attributes determined by decision-maker
%        
%   MM - [1xn] vector criteriaSign; =1 for benefit (revenue) attributes; 
%   MM=Max/Min                     =-1 for cost attributes (expenditure)
%
%   Others INPUT parameters look in file: GUI_for_MCDM_tools.pdf

%   OUTPUT ARGUMENTS:
%        - C(i)    Integrall Indexm for Alternatives i=1..m
%        - R(i)    Rank for Alternatives i=1..m

% Data Files:
%   Out:       
%        MCDM_Res.xlsx  - save Ci, Ri and save total Rank Ai for all Methods
%

fclose('all')
clear all
tm = clock;

iN=3;   %-- Number of Example (Project) 1 2 3 4 5 ...

%-- Example 1
if iN==1 
    T_Name='The location selection of tri-modal LC and logistical flows '%A1-A8  C1-C11
    Tx={'Logist'}; 
   D =[4	71	4	3	45000	150	1056	2	4	478	4
       4	85	4	4	58000	145	2680	2	5	564	4
       4	76	4	4	56000	135	1230	2	4	620	3
       3	74	3	4	42000	160	1480	4	3	448	5
       5	82	3	5	62000	183	1350	2	4	615	4
       4	81	3	5	60000	178	2065	2	3	580	4
       4	80	3	5	59000	160	1650	3	5	610	4
       4	85	3	5	65000	140	1650	3	5	667 3];
       
    w=[.109 .105 .101 .097 .094 .094 .093 .088 .084 .071 .063];
    MM=[1 1 -1 1 1 1 1 -1 1 1 1];
end



%-- Example 2
if iN==2
     T_Name='The location  of technology' %A1-A8  C1-C12
     Tx={' Technology'};
    D =[1583.76 9064.014    10.650  141.550     13  10  28  120 1   1   117.11  105.50
    1822.86     9003.45     10.820  161.615    18   12  36  100 2   2   686.28  74.43
    1582.214    8692.043    9.905   140.310    13   10  28  100 2   1   334.33  107.29
    1533.993    8261.684    9.266   160.789    13   11  31  100 3   3   484.65  79.93
    1653.284    8253.030    9.671   166.694    19   12  30  110 2   4   312.62  81.42
    1808.817    7910.329    9.147   143.049    13   10  31  120 2   2   420.08  93.49
    1574.663    10045.04    10.904  151.060    13   12  33  120 3   1   313.73  86.40
    1805.434    10179.26    10.657  149.310    18   11  32  120 3   2   374.99  79.42];

    MM=[-1        1          -1       -1       1     1    1   1 1   1    -1     -1];
    
   %-- Altertative method for w: Calculate weight of criteria by entropy technique 
    w=[1 1 1 1 1 1 1 1 1 1 1 1]; 
    [m,n]=size(D);
    [ w ] = Weight_Entropy(D,w,m,n);
    
    % or determined by decision-maker: w=[.109 .105 .101 .097 .094 .094 .093 .088 .084 .071 .063];
end


%-- Example 3
if iN==3 
    % D. Stanujkie, B. Dordevie & M. Dordevie (2013), 
    %  Comparative analysis of some prominent MCDM methods: A Case of Ranking Serbian Bank // 
    %  Serbian Journal of Management, 8(2), 213-241.
    
    T_Name='A Case of Ranking Serbian Banks '   % A1-A5  C1-C13
    Tx={'Banks'}; 
   D =[2.50 0.76 0.26 0.49 0.18 5.01  0.012 0.110 0.179 5.36 0.26 4.97 18.7
       1.47 1.02 0.29 0.28 0.22 6.51  0.016 0.101 0.225 2.69 0.48 2.02 29.00
       1.31 1.36 0.18 0.43 0.01 12.65 0.026 0.230 0.338 4.20 0.28 2.57 17.10
       1.34 1.06 0.18 0.43 0.16 24.58 0.043 0.220 0.527 2.20 0.45 2.06 32.00
       1.57 1.50 0.24 0.44 0.13 12.19 0.002 0.010 0.038 3.57 0.34 1.91 25.90];
      
    w=[0.161 0.054 0.161   0.080 0.032 0.013   0.039 0.073 0.014   0.081 0.047 0.062 0.185];
    MM=[1      1     1      -1    -1     1        1     1     1      -1     1    -1     1 ];
end

%-- Example 4
if iN==4 
    % Prasenjit Chatterjee and Shankar Chakraborty (2014).  
    % Investigating the Effect of Normalization Norms in Flexible Manufacturing Sytem Selection 
    % Using Multi-Criteria Decision-Making Methods.  
    % Journal of Engineering Science and Technology Review, 7 (3), 141 Ц 150
     
    T_Name='Flexible Manufacturing Sytem Selection '%A1-A8  C1-C7
    Tx={'Manufacturing'}; 
   D = [30 23  5 0.745 0.745 1500 5000 
        18 13 15 0.745 0.745 1300 6000 
        15 12 10 0.5   0.5    950 7000 
        25 20 13 0.745 0.745 1200 4000 
        14 18 14 0.255 0.745  950 3500 
        17 15  9 0.745 0.5   1250 5250 
        23 18 20 0.5   0.745 1100 3000 
        16  8 14 0.255 0.5   1500 3000];

    % --- RLC    RWP    RSC    IMR    IQ    CMC    FSU   
    w=[0.1129 0.1129 0.0445 0.1129 0.2861 0.2861 0.0445];
    MM=[1      1      1      1       1    -1      -1 ];
end

%-- Example 5
if iN==5 
    T_Name='Test for 15 alternatives '%A1-A15  C1-C11
    Tx={'Test'}; 
   D =[4	71	4	3	45000	150	1056	2	4	478	4
       4	85	4	4	58000	145	2680	2	5	564	4
       4	76	4	4	56000	135	1230	2	4	620	3
       3	74	3	4	42000	160	1480	4	3	448	5
       5	82	3	5	62000	183	1350	2	4	615	4
       4	81	4	5	60000	178	2065	2	3	580	4
       4	80	3	5	59000	160	1650	3	5	610	4
       4	85	3	5	62000	140	1600	3	5	580 3
       3	85	4	4	57000	160	2680	2	5	570	4
       4	76	4	4	56000	135	1230	2	4	620	3
       3	85	3	4	42000	160	1490	4	3	448	5
       5	82	5	5	64000	183	1350	2	4	620	4
       4	85	3	4	61000	175	2065	2	3	587	4
       3	80	4	3	57000	160	1680	3	5	660	4
       4	85	3	5	65000	145	1650	3	3	550 3];
    w=[.109 .105 .101 .097 .094 .094 .093 .088 .084 .071 .063];
    MM=[1 1 -1 1 1 1 1 -1 1 1 1];
end

Out_File=['MCDM_Res', num2str(iN,'%d'),'.xlsx'];

[m,n]=size(D);

nM=15;  % -- metods
Metods={'SAW' 'MOORA-RS' 'MOORA-RP' 'COPRAS' 'VIKOR' 'TOPSIS(Eu)' 'TOPSIS(SC)' 'TOPSIS(-Inf)'  'DIdeal' 'MABAC' 'ORESTE' 'PROMETHEE' 'CODAS' 'GRA' 'GRA(T)'};
   
 iM=0;  iJ=0;  iK=60;
 RankMatrix=zeros(m,iK);  %--Save rank for all Methods/Modifier
 RM1=zeros(m,nM-2);  RM2=zeros(m,nM-2); % -ORESTE, -PROMETHEE
 RM3=zeros(m,nM-2);  RM4=zeros(m,nM-2);
 
     %-- pozitions for XLS-print
           i1=1;
           Npos1=num2str(4,'%d'); 
           Npos2=num2str(4+m-1,'%d');   
           Npos3=num2str(6+m,'%d'); 
           Npos4=num2str(6+2*m-1,'%d');
 
           cCol1=char(66);         % 'A'=65 'B'=66 ...'Z=90'
           if m < 25
               cCol2=char(65+m);     % 'Z=90'
           else
               cCol2=char( ['A' char(65+m)]);  % AA, AB, AC, ...
           end
           if m < 24
               cCol3=char(67+m);     % 'Z=90'
           else
               cCol3=char( ['A' char(67+m)]);  % AA, AB, AC, ...
           end
           if 2*m < 25
               cCol4=char(66+2*m);     % 'Z=90'
           elseif 66+2*m < 117
               cCol4=char( ['A' char(65+2*m -90+65)] );  % AA, AB, AC, ...
           else
               cCol4=char( ['B' char(65+2*m-116+65)] );  % BA, BB, BC, ...
           end
               
     %---  A1, A2 ... Am      
     Alter= cell(1,m);
     for i=1:m
          Alter(i)={ ['A' num2str(i,'%d')] };
     end
           

for num_Method=1:nM
    '--------------------------------------------------------------------------'
    Metods(num_Method)


         % Norm: C1- Max; C2- Sum; C3- Max-Min; C4-Vector
         %-----------------------------------------------
         
         if  num_Method==1  %--- SAW 
             [C1]=Fun_SAW(m,n,D,w,MM, -1);
             [C2]=Fun_SAW(m,n,D,w,MM, -2);
             [C3]=Fun_SAW(m,n,D,w,MM, -3);
             [C4]=Fun_SAW(m,n,D,w,MM, -4);
             
             %-------- rank 1- max(C) 
             R1=tiedrank(-C1);  R2=tiedrank(-C2);
             R3=tiedrank(-C3);  R4=tiedrank(-C4);                         
         end     
         if  num_Method==2  %--- MOORA Ratio System (RS) approch
             [C1]=Fun_MOORA(m,n,D,w,MM,1);
             [C2]=Fun_MOORA(m,n,D,w,MM,2);
             [C3]=Fun_MOORA(m,n,D,w,MM,3);
             [C4]=Fun_MOORA(m,n,D,w,MM,4);
             
             %-------- rank 1- max(C) 
             R1=tiedrank(-C1);  R2=tiedrank(-C2);
             R3=tiedrank(-C3);  R4=tiedrank(-C4);
         end
         if  num_Method==3  %--- MOORA-RP,   Standart norm = VECTOR

             [C1]=Fun_MOORARP(m,n,D,w,MM, 1);
             [C2]=Fun_MOORARP(m,n,D,w,MM, 2 );
             [C3]=Fun_MOORARP(m,n,D,w,MM, 3);
             [C4]=Fun_MOORARP(m,n,D,w,MM, 4);
             
             %-------- rank 1- min(C) 
             R1=tiedrank(C1);  R2=tiedrank(C2);
             R3=tiedrank(C3);  R4=tiedrank(C4);          
         end        
         if num_Method==4  %--- COPRAS,       Standart norm = SUM
             [C1]=Fun_COPRAS(m,n,D,w,MM, 1);  % 1- Max; 2- Sum; 3- Max-Min; 4-Vector 
             [C2]=Fun_COPRAS(m,n,D,w,MM, 2);
             [C3]=Fun_COPRAS(m,n,D,w,MM, 3);
             [C4]=Fun_COPRAS(m,n,D,w,MM, 4);
             
             %-------- rank 1- max(C) 
             R1=tiedrank(-C1);  R2=tiedrank(-C2);
             R3=tiedrank(-C3);  R4=tiedrank(-C4);  
         end
         if num_Method==5  %--- VIKOR,        Standart norm = Max-Min
             % v is introduced as weight of the strategy  
             % of Д the majority of attributes?
             v=0.5;
             [C1,R1]=Fun_VIKOR(m,n,D,w,MM,v, -1);
             [C2,R2]=Fun_VIKOR(m,n,D,w,MM,v, -2);
             [C3,R3]=Fun_VIKOR(m,n,D,w,MM,v, -5);
             [C4,R4]=Fun_VIKOR(m,n,D,w,MM,v, -4);
         end
         %-----------------------------------------------------------------
         if num_Method==6  %--- TOPSIS(Eu) Euclidean Distance(DS), Standart norm = VECTOR
             DS=1;
             [C1]=Fun_TOPSIS(m,n,D,w,MM,DS,1);
             [C2]=Fun_TOPSIS(m,n,D,w,MM,DS,2);
             [C3]=Fun_TOPSIS(m,n,D,w,MM,DS,3);
             [C4]=Fun_TOPSIS(m,n,D,w,MM,DS,4);
             
             %-------- rank 1- max(C) 
             R1=tiedrank(-C1);  R2=tiedrank(-C2);
             R3=tiedrank(-C3);  R4=tiedrank(-C4);
         end
         if num_Method==7  %--- TOPSIS(SC) Sity Cab Distance, Standart norm = VECTOR
             DS=2;
             [C1]=Fun_TOPSIS(m,n,D,w,MM,DS,1);
             [C2]=Fun_TOPSIS(m,n,D,w,MM,DS,2);
             [C3]=Fun_TOPSIS(m,n,D,w,MM,DS,3);
             [C4]=Fun_TOPSIS(m,n,D,w,MM,DS,4);
             
             %-------- rank 1- max(C) 
             R1=tiedrank(-C1);  R2=tiedrank(-C2);
             R3=tiedrank(-C3);  R4=tiedrank(-C4);
         end
         if num_Method==8  %--- TOPSIS(-Inf) Min Distance
             DS=-Inf;
             [C1]=Fun_TOPSIS(m,n,D,w,MM,DS,1);
             [C2]=Fun_TOPSIS(m,n,D,w,MM,DS,2);
             [C3]=Fun_TOPSIS(m,n,D,w,MM,DS,3);
             [C4]=Fun_TOPSIS(m,n,D,w,MM,DS,4);
             
             %-------- rank 1- max(C) 
             R1=tiedrank(-C1);  R2=tiedrank(-C2);
             R3=tiedrank(-C3);  R4=tiedrank(-C4);
         end
         if num_Method==9  %--- 'DIdeal' 
            %-- Lp-norm for Alternatives p={list}
            Lp=[2 1 Inf];           % [3 2 1 0.5 0.3 Inf];
            kDel=2;  %  -  Delete poor Alternatives for 1 iteration
            [C1]=Fun_DIdeal(m,n,D,w,MM,Lp,kDel,-1);
            [C2]=Fun_DIdeal(m,n,D,w,MM,Lp,kDel,-2);
            [C3]=Fun_DIdeal(m,n,D,w,MM,Lp,kDel,-3);
            [C4]=Fun_DIdeal(m,n,D,w,MM,Lp,kDel,-4);
            
            %-------- rank 1- max(C) 
            R1=tiedrank(-C1);  R2=tiedrank(-C2);
            R3=tiedrank(-C3);  R4=tiedrank(-C4);     
         end
         if num_Method==10  %--- 'MABAC', Standart norm =
             [C1]=Fun_MABAC(m,n,D,w,MM,-1);
             [C2]=Fun_MABAC(m,n,D,w,MM,-2);
             [C3]=Fun_MABAC(m,n,D,w,MM,-3);
             [C4]=Fun_MABAC(m,n,D,w,MM,-4);
             
            %-------- rank 1- max(C) 
            R1=tiedrank(-C1);  R2=tiedrank(-C2);
            R3=tiedrank(-C3);  R4=tiedrank(-C4);
         end
         if num_Method==11  %---  'ORESTE' 
            a=0.5;          %  threshold of indifference
            beta=0.05;
            gamma=1.4;      %  threshold of preference   %   >1
            
            Lp=1;   %-- non Linear projection
                    %   Lp=1 Average (Mean); =-1 Medium Harmonic; =2-Mean Square; 
                    %    =inf  max(R,w);  =-inf  min(R,w) 
            
            iPlot=1;  %  print GIA: 1-Yes, 0-No 
            
            [C1]=Fun_ORESTE(m,n,D,w,MM,a,beta,gamma,Lp, iPlot );
            
            Lp=2;
            [C2]=Fun_ORESTE(m,n,D,w,MM,a,beta,gamma,Lp, iPlot);
            
            Lp=Inf;
            [C3]=Fun_ORESTE(m,n,D,w,MM,a,beta,gamma,Lp, iPlot); 
            
            Lp=-1;
            [C4]=Fun_ORESTE(m,n,D,w,MM,a,beta,gamma,Lp, iPlot);
            
            %-- Total rank  (min = the Best Alternatives)
            R1=tiedrank(C1);  R2=tiedrank(C2); 
            R3=tiedrank(C3);  R4=tiedrank(C4);               
         end
         if num_Method==12  %-- PROMETHEE(II)          
            kType=6;
            % Choise types of preference functions H(d)
            % Type= 1 regular; 2 U-Shape; 3 V-Shape; 4 Level; 5 Linear; 6 Gaus
 
            cH=repmat(3, 1,n);  % for j criteria one from kType, example=3 ; 
            [C1]=Fun_PROMETHEE(m,n,D,w,MM,cH);
            cH=repmat(5, 1,n);  % for j criteria one from kType, example=5 ; 
            [C2]=Fun_PROMETHEE(m,n,D,w,MM,cH); 
            cH=repmat(6, 1,n);  % for j criteria one from kType, example=6 ; 
            [C3]=Fun_PROMETHEE(m,n,D,w,MM,cH);
            
            cH=repmat(5, 1,n);  % for j criteria 5-6 Type; 
            ik=2;
            for j=1:n
                if j==ik
                   cH(j)=6; 
                   ik=ik+2;
                end
            end
            [C4]=Fun_PROMETHEE(m,n,D,w,MM,cH);
            
            %-------- rank 1- max(C) 
            R1=tiedrank(-C1);  R2=tiedrank(-C2);
            R3=tiedrank(-C3);  R4=tiedrank(-C4);          
         end
         if num_Method==13  %--- 'CODAS'
             % v  is the threshold parameter that can be set by the decision maker.
             % It is suggested to set this parameter v as a value between 0.01 and 0.05. 
             % If the difference between the Euclidean distances of  two  alternatives is less that v , 
             % there two alternatives are also compared by the Taxicab distance.
             v=0.02;
             [C1]=Fun_CODAS(m,n,D,w,MM,v,-1);
             [C2]=Fun_CODAS(m,n,D,w,MM,v,-2);
             [C3]=Fun_CODAS(m,n,D,w,MM,v,-3);
             [C4]=Fun_CODAS(m,n,D,w,MM,v,-4);
             
            %-------- rank 1- max(C) 
            R1=tiedrank(-C1);  R2=tiedrank(-C2);
            R3=tiedrank(-C3);  R4=tiedrank(-C4);          
         end
         if num_Method==14  %--- 'GRA'
            v=0.5;
            [C1]=Fun_GRA(m,n,D,w,MM,v,-1);
            [C2]=Fun_GRA(m,n,D,w,MM,v,-2);
            [C3]=Fun_GRA(m,n,D,w,MM,v,-3);
            [C4]=Fun_GRA(m,n,D,w,MM,v,-4);
            
             %-------- rank 1- max(C) 
            R1=tiedrank(-C1);  R2=tiedrank(-C2);
            R3=tiedrank(-C3);  R4=tiedrank(-C4); 
         end
         if num_Method==15  %--- 'GRA(T)'
             v=0.5; 
             [C1]=Fun_GRAt(m,n,D,w,MM,v,1);  %--- 'GRA(T)'
             [C2]=Fun_GRAt(m,n,D,w,MM,v,2); 
             [C3]=Fun_GRAt(m,n,D,w,MM,v,3); 
             [C4]=Fun_GRAt(m,n,D,w,MM,v,4); 
             
             %-------- rank 1- min(C) 
            R1=tiedrank(C1);  R2=tiedrank(C2);
            R3=tiedrank(C3);  R4=tiedrank(C4);
         end
         
         %---------------- save to xls-File -------------------------------
         %if  num_Method <=7
             if  num_Method==1
                 xlswrite(Out_File,{T_Name},'B1:B1');  
             end

             Npos1=3+5*(i1-1);  Npos2=3+5*(i1-1) ;    %   'A1 A2 ...Am'
             Npos3=4+5*(i1-1);  Npos4=4+5*i1 - 2;     %    C  R
             
             
             PosOut1=[cCol1, num2str(Npos1,'%d'), char(':'), cCol2, num2str(Npos2,'%d')];
             PosOut2=[cCol3, num2str(Npos1,'%d'), char(':'), cCol4, num2str(Npos2,'%d')];
             
             PosOut3=[cCol1, num2str(Npos3,'%d'), char(':'), cCol2, num2str(Npos4,'%d')];
             PosOut4=[cCol3, num2str(Npos3,'%d'), char(':'), cCol4, num2str(Npos4,'%d')];
             
             xlswrite(Out_File,Alter,PosOut1);
             xlswrite(Out_File,Alter,PosOut2);
             
             xlswrite(Out_File,[C1 C2 C3 C4]', PosOut3);
             xlswrite(Out_File,[R1 R2 R3 R4]', PosOut4);    
             
             i1=i1+1;
             if num_Method~=11 & num_Method~=12
                iJ=iJ+1;
                RM1(:,iJ)=R1; RM2(:,iJ)=R2; RM3(:,iJ)=R3; RM4(:,iJ)=R4; 
             end
             
             RankMatrix(:,(iM+1):(iM+4))=[R1 R2 R3 R4] ;
             iM=iM+4;  
         %end
         
end

k_int=0;
Sum_Rank=zeros(m,m);  % rows(i)- Alternatives; Cols(j) Score Ranks (1...m)
SR1=zeros(m,m); SR2=zeros(m,m); SR3=zeros(m,m); SR4=zeros(m,m);

    for j=1:iM          
        for i=1:m
            is=round(RankMatrix(i,j));  % т.к tiedrank может=1.5
            if floor(RankMatrix(i,j))~=ceil(RankMatrix(i,j))     % integer
                k_int=k_int+1;    % not integer   1.5
            end           
            Sum_Rank(i,is)=Sum_Rank(i,is) + 1;
        end
    end
    for j=1:nM-2          
        for i=1:m
            is1=round(RM1(i,j)); is2=round(RM2(i,j)); 
            is3=round(RM3(i,j)); is4=round(RM4(i,j));          
            SR1(i,is1)=SR1(i,is1) + 1;  SR2(i,is1)=SR2(i,is1) + 1;
            SR3(i,is1)=SR3(i,is1) + 1;  SR4(i,is1)=SR4(i,is1) + 1;
        end
    end
    
%  Example 3
%  Sum_Rank =

%       I     II   III   IV     V
%---------------------------------
% A1    1     0     2    10    11
% A2   10    12     1     1     0
% A3    1     0     7     5    11
% A4   13    11     0     0     0
% A5    1     0    13     8     2

% (A4,I)=13 is 13 раз из 24 (24 Methods/Modifications) альтернатива A4
% имела I ранг

'----- Save Data to xls. File -----'
%----------------------------- Sum_Rank (all) -----------------------------
LGND = cell(1,m);
for i=1:m
    H=[ num2str(i,'%d') ' rank' ];
    LGND(i)={H};
end

Npos1=Npos4+1;                     %   'A1 A2 ...Am'
Npos3=Npos4+2;  Npos4=Npos3+m-1;   %    C  R

PosOut4=['A', num2str(Npos3,'%d'), char(':A'), num2str(Npos4,'%d')];
xlswrite(Out_File,LGND', PosOut4);

PosOut2=[cCol3, num2str(Npos1,'%d'), char(':'), cCol4, num2str(Npos1,'%d')];
xlswrite(Out_File, Alter, PosOut2);

PosOut4=[cCol3, num2str(Npos3,'%d'), char(':'), cCol4, num2str(Npos4,'%d')];
xlswrite(Out_File, Sum_Rank', PosOut4); 

%--------------- Sum_Rank  for Max, Sum, Max-Min, Vector norm -------------

LGND1 = cell(1,m+1);
for i=2:m+1
    H=[ num2str(i-1,'%d') ' rank' ];
    LGND1(i)={H};
end
%-- sum ranks for norm(Max)
H=['   Max'];
LGND1(1)={H};

Npos3=Npos4+2; Npos4=Npos3+m-1; 

PosOut4=['A', num2str(Npos3-1,'%d'), char(':A'), num2str(Npos4,'%d')];
xlswrite(Out_File,LGND1', PosOut4);

PosOut4=[cCol3, num2str(Npos3,'%d'), char(':'), cCol4, num2str(Npos4,'%d')];
xlswrite(Out_File, SR1', PosOut4);

%-- sum ranks for norm(Sum)
H=['   Sum' ];
LGND1(1)={H};

Npos3=Npos4+2; Npos4=Npos3+m-1; 

PosOut4=['A', num2str(Npos3-1,'%d'), char(':A'), num2str(Npos4,'%d')];
xlswrite(Out_File,LGND1', PosOut4);

PosOut4=[cCol3, num2str(Npos3,'%d'), char(':'), cCol4, num2str(Npos4,'%d')];
xlswrite(Out_File, SR2', PosOut4);

%-- sum ranks for norm(Max-Min)
H=['   Max-Min' ];
LGND1(1)={H};

Npos3=Npos4+2; Npos4=Npos3+m-1; 

PosOut4=['A', num2str(Npos3-1,'%d'), char(':A'), num2str(Npos4,'%d')];
xlswrite(Out_File,LGND1', PosOut4);

PosOut4=[cCol3, num2str(Npos3,'%d'), char(':'), cCol4, num2str(Npos4,'%d')];
xlswrite(Out_File, SR3', PosOut4);

%-- sum ranks for norm(Vector)
H=['   Vector' ];
LGND1(1)={H};

Npos3=Npos4+2; Npos4=Npos3+m-1; 

PosOut4=['A', num2str(Npos3-1,'%d'), char(':A'), num2str(Npos4,'%d')];
xlswrite(Out_File,LGND1', PosOut4);

PosOut4=[cCol3, num2str(Npos3,'%d'), char(':'), cCol4, num2str(Npos4,'%d')];
xlswrite(Out_File, SR4', PosOut4);


%--------------------- Bar diagramm for Sum_Ranks -------------------------
Sum_Rank

'------- The best alternatives --------'
[s3,ix]=max(Sum_Rank); %-- find Max  & index Alternatives , for all Score

SP=Sum_Rank./iM.*100;

T1=char(T_Name);

figure('Name',T1,'NumberTitle','off');
bar(1:m,SP,'group')

T2=['Statistics Ranks of the Alternatives'];
T3=['in ', num2str(iM,'%d'),' Methods and Modifications'];    
title({T2;T3},'FontSize',11);
ylabel('Rank score, %','FontSize',11)
xlabel('Alternatives','FontSize',11)
%set(axes_handle,'YGrid','on')
legend(LGND)
set(gca,'XTickLabel',Alter,'FontSize',10)


    %---------------------------------------------------------------------
    %  variant:  отсортирован 1 столбец соот-й 1 рангу
    %-- I rank (1),(2),(3) score (1 col)
    [sc3 inx]= sort( (Sum_Rank(:,1)./iM)*100, 'descend');     %--
    
    '-- Rank Alternatives (A1, A2,..., Am) for all Methods/Modifications --'

RankMatrix'

'--------------------------------------------------------------------'
'Result File: MCDM_Res1-4.xlsx'

%- Total Time (s)
total_Time=etime(clock,tm)
fclose('all')






    

