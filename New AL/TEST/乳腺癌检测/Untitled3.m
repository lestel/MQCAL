s=[50,100,200,400,850]/5;
t=[1,2,3,6]
block=cell(length(t),length(s));
for i=1:length(s)
    for j=1:length(t)
        w1=round(final{1,t(j)}(1,s(i))*10000)/100;
        w2=round(final{2,t(j)}(1,s(i))*1000000)/10000;
        block{j,i}=[num2str(w1),'¡À',num2str(w2)];
    end
end
