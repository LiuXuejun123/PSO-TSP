function C=changeNum(x,y)
CityNum=size(x,2);%返回矩阵x的列数
C=ones(CityNum-1,2);%初始化一个交换序
for i=1:CityNum-1
    pos=find(x==y(i));%找到x中第i个元素和y中元素相同的位置形成一个交换子
    C(i,:)=[i pos];%交换子的产生
    %x=changeFun(x,C(i,:));
end
end
 
