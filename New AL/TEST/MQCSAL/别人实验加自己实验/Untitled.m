zm={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
load('zm.mat')
f1=21;
f2=22;


pos1=find(data(:,1)==f1);
pos2=find(data(:,1)==f2);
tmp=[pos1;pos2];
a=data(tmp,:);
b=a(:,1);
b(b==f1)=1;
b(b==f2)=-1;
a(:,1)=b;
c=(1:length(tmp))';
data=[c,a];