function [V]=Fun_DMnorm(m,n,D,w,MM,p)

%   %-- Construct the Weighted Normalized Decision Matrix 
%
%   (update 23.02.2018 )
%    Parameters p: 

%       only BENEFIT attributes
%    p=0 -Max method with Criteria Sign;     p=1- Max method; 
%    p=2- Sum method; p=3- (Max-Min) method; p=4- Vector method;

%       for BENEFIT & COST attributes
%    p=-1 Max method with Inverse; -2 Sum method; 
%      -3 Max-Min method;          -4 Vector method;
%
%   Ufa State Petroleum Technological University
%   Author: Dr. Irik Z. Mukhametzyanov
%   

% - Before executing the function you have to define DMM-Decision Making
%   Matrix [mxn] variable based on size of decision making matrix that 
%   you have.
%   w - the weight of attributes determined by decision-maker [1xn]
%   MM - criteriaSign [1xn] matrix; =1 for benefit (revenue) attributes доход; 
%                                   =-1 for cost attributes (expenditure) расход

   
    
    %-- Construct the Weighted Normalized Decision Matrix 
    
    t1=max(D);     %-- max for benefit attributes
    t2=min(D);     %-- min for cost attributes
    D1=ones(m,n);
    
    for j=1:n
        if t1(j)==0
            if MM(j)==1
               ['Max =0  in Colums',char(num2str(j,'%d')),' in the Decision Matrix']
            else
               ['Min =0  in Colums',char(num2str(j,'%d')),' in the Decision Matrix']
            end
            break
        end
    end
    
    if p==0  %- Max norm method with Criteria Sign
       V=D.*repmat(MM./t1,m,1); 
    end
    
    %--------- Only benefit Group or Only cost Group attributes -----------
    
    if p==1  %- Max norm. method
       '  Max norm.     '
       V=D./repmat(t1,m,1); 
    end
    if p==2  %- Sum norm. method
        '  Sum norm.     '
        t=sum(D);     
        V=D./repmat(t,m,1);
    end   
    if p==3  %- Max-Min norm. method only for benefit atributes 
        '  Max-Min norm.     '
        for j=1:n
            V(:,j)=(D(:,j)-t2(j))./(t1(j)-t2(j));
        end
    end       
    if p==4   %- Vecter norm. method for benefit atributes
        '  Vector norm.     '
        for j=1:n
            t(j)=norm(D(:,j),2); 
            V(:,j)= D(:,j)./t(j);
        end
    end
    
    
    %---------------- For benefit & cost atributes ------------------------
    
    if p==-1   %-- Max norm. method for benefit & inverse for cost atributes
        '  Max norm.     '
        for j=1:n
            if MM(j)==1
               V(:,j)=D(:,j)./t1(j);
            end
            if MM(j)==-1
               V(:,j)=t2(j)./D(:,j);
            end
        end
    end
    
    if p==-2  %- Sum norm. method
        '  Sum norm.     '
        t=sum(D);     
        V=D./repmat(t,m,1);
        for j=1:n
            if MM(j)==-1
               V(:,j)=D1(:,j)-V(:,j);
            end
        end
    end  
    
    if p==-3  %- Max-Min norm. method for benefit & inverse for cost atributes 
        '  Max-Min norm.     '
        for j=1:n
            if MM(j)==1
               V(:,j)=(D(:,j)-t2(j))./(t1(j)-t2(j));
            end
            if MM(j)==-1
               V(:,j)=(t1(j)-D(:,j))./(t1(j)-t2(j));
            end
        end
    end
    
    if p==-4   %- Vecter norm. method for benefit & inverse for cost atributes
        '  Vector norm.     '
        for j=1:n
            t(j)=norm(D(:,j),2); 
            if MM(j)==1
               V(:,j)= D(:,j)./t(j);
            end
            if MM(j)==-1
               V(:,j)= D1(:,j) - D(:,j)./t(j);
            end
        end
    end
 
    if p==-5  %- Max-Min norm. for VIKOR  method for benefit & inverse for cost atributes 
        '  Max-Min norm.     '
        for j=1:n
            if MM(j)==1
               V(:,j)=(t1(j)-D(:,j))./(t1(j)-t2(j));
            end
            if MM(j)==-1
               V(:,j)=(D(:,j)-t2(j))./(t1(j)-t2(j));
            end
        end
    end
    
    if p==-6  %- (JKN)Jutler's Korth's method
        V1=zeros(m,n);
        for j=1:n
            if MM(j)==1
               V1(:,j)=abs( (D(:,j)-t1(j))./t1(j) );
            end
            if MM(j)==-1
               V1(:,j)=abs( (D(:,j)-t2(j))./t1(j) );
            end
        end
        V=D1-V1;
    end
    
    if p==-7  %- Sum norm. method for benefit & inverse for cost atributes        
        for j=1:n
            if MM(j)==-1
               D(:,j)=D1(:,j)./D(:,j);
            end
        end
        t=sum(D);     
        V=D./repmat(t,m,1);
    end
    
return