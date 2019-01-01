a=load('vehicle.txt');
a1=2;
a2=3;


pos=[find(a(:,19)==a1);find(a(:,19)==a2)];
a=a(pos,:);
[M,N]=size(a);data=[(1:M)',a(:,N),a(:,1:N-1)];
I2=data(:,2);
I2(I2==a1)=1;
I2(I2==a2)=-1;
data(:,2)=I2;
sample_num=size(data,1);
xl=randperm(sample_num);
[data_re,ps] = mapminmax(data(:,3:end)',0,1);
data(:,3:end)=data_re';
test=data(xl(1:round(sample_num*0.3)),:);
train=data(xl(round(sample_num*0.3)+1:round(sample_num*0.3)+round(sample_num*0.3)),:);

[net,need_type,options_out]=svm_building(train,[2,0,1,1]);
[test_result,diff1,need_type] = svm_application(test,net,need_type);







