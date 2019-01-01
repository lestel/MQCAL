%%%uci TPMI 特例

clc

clear
foldname='letterUV';
name={'Margin','Cluster','IDE','DUAL','QUIRE'};
color={'b','m','c','g','r'};
I=imread([foldname,'.png']);
I1=rgb2gray(I);
imshow(I1,[]);
prompt={'请输入线条数','横坐标最大值的横坐标与纵坐标','纵坐标最大值的横坐标与纵坐标'};
words='请输入描点条件:两点用逗号隔开';
answer = inputdlg(prompt,words,1);
eval(['input_D=[',answer{2},';',answer{3},'];']);
disp('开始导入线条');
a1=str2double(answer(1));
need_colour=nan(1,a1);

for i=1:a1
    tmp=0;
    while (tmp==0)
    str=['标注第',num2str(i),'条线--',name{i}];
    disp(str);
    title(str);
    [y1,x1] = getpts;x=round(x1);y=round(y1);
    hint=[str,'的灰度为',num2str(I1(x,y)),'确定？'];
    H=questdlg(hint,'问题提示','Yes','No','Yes');
    if strcmp(H,'No')==1
       tmp=0;
    else
       tmp=1;
    end
    end
    need_colour(1,i)=I1(x,y);
end
disp('去除legend');
helpdlg('去除legend')
[~,rect]=imcrop(I1);
rect=round(rect);
I2=I1;
I2(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))=255;
imshow(I2);
pos=nan(length(need_colour),size(I2,2));
for j=1:length(need_colour)
I3=I2;
I3(I3~=need_colour(j))=0;    
I3(I3==need_colour(j))=255;    
I3=bwareaopen(I3,4);
for i=1:size(I3,2)
    TT=find(I3(:,i)==1);
    if isempty(TT)==0
    pos(j,i)=median(TT);
    end
end
end
title('请标注能确认横坐标最大值');
disp('请标注能确认横坐标最大值');
[y_h,x_h] = getpts;

disp('请标注能确认纵坐标最大值');
title('请标注能确认纵坐标最大值');
[y_Z,x_Z] = getpts;

xper=(input_D(1,1)-input_D(2,1))/(y_h-y_Z);
yper=(input_D(2,2)-input_D(1,2))/(x_h-x_Z);
O_stand=[x_Z,y_h];
X_new=((1:length(pos))-y_Z)*xper+input_D(2,1);
pos_new=pos;
for i=1:size(pos,1)
    pos_new(i,:)=(x_h-pos(i,:))*yper+input_D(1,2);
end
line=cell(1,size(pos,1));
figure
subplot(1,2,1);
imshow(I);

subplot(1,2,2);
for i=1:size(pos,1)
    pt=find(isnan(pos_new(i,:))~=1);
    line{1,i}=[X_new(1,pt);pos_new(i,pt)];
    plot(line{1,i}(1,:),line{1,i}(2,:),color{i},'Linewidth',2.5);
    hold on 
end
legend('Margin','Cluster','IDE','DUAL','QUIRE');
title(foldname);
save([foldname,'.mat'],'line','name');