function BasePSOforTSP 
%初始化
w1=0.5; %个体经验保留概率
w2=0.5; %全局经验保留概率 
M=300; %最大迭代次数
m=30;  %微粒数
CityNum=30;  %问题的规模（城市个数）
[dislist,Clist]=tsp(CityNum);%返回dislist可以求出两城市间的距离，Clist表示城市的列表
 
NC=1;%迭代计数器
R_best=zeros(M,CityNum); %各代最佳路线
L_best=inf.*ones(M,1);%各代最佳路线的长度
L_ave=zeros(M,1);%各代路线的平均长度
 
%产生微粒的初始位置
for i=1:m
    x(i,:)=randperm(CityNum);%产生30个微粒要走的30各城市的列表
    L(i)=SumDistance(dislist,x(i,:));%产生这30个微粒各自按上边路径走的总路程
end
p=x; %p为个体最好解
pL=L;%用数组表示每个个体目前的最短路径，也是由于这也是初始化，以后这个距离也要不断更新
[L_best(1,1), n_best]=min(L);%L_best(1,1)表示初始化中30个粒子中最优总距离，n_best表示第几个粒子是最优解
R_best(1,:)=x(n_best,:);%R_best(1,:)表示当前最优微粒所走城市的路径
L_ave(1,1)=mean(L);%L_ave(1,1)，30个微粒走的总路程的平均值
 
%初始交换序
v=ones(CityNum-1,2,m);
 
figure(1);
while NC<=M %停止条件之一：达到最大迭代次数
    for i=1:m
       xnew(i,:)=changeFun(x(i,:),v(:,:,i));%初始化交换后返回的矩阵类型
        A=changeNum(x(i,:),p(i,:));%产生与个体相比较的交换序
        Arand=randFun(A,w1);%用来对个体经验进行保留
        xnew(i,:)=changeFun(xnew(i,:),Arand);%对经验已经保留的进行更新其新的位置。
        B=changeNum(x(i,:),R_best(NC,:));%产生与全局最优相比较的交换序
        Brand=randFun(B,w2);%用来对全局经验进行保留
        xnew(i,:)=changeFun(xnew(i,:),Brand);%对经验已经保留的进行更新其新的位置
        v(:,:,i)=changeNum(x(i,:),xnew(i,:));%记录实际交换序
        L(i)=SumDistance(dislist,xnew(i,:));%产生这30个微粒各自按上边路径走的总路程
        if L(i)<pL(i)%此次更新的总路程比以往更优
            p(i,:)=xnew(i,:);
            pL(i)=L(i);%调整局部最优解
        end
    end
    [L_bestnew, n_best]=min(L);%L_bestnew用来表示当前更新的全局最短路径长度，n_best表示是第n_best个达到最优
    R_bestnew=xnew(n_best,:);%R_bestnew用来得到当前最优路径的线路
    L_ave(NC+1,1)=mean(L);%此次更新30个粒子的所走路程的平均值
    if L_bestnew<L_best(NC,1)%比较此次更新最短路径如果比以前的路径更优
        L_best(NC+1,1)=L_bestnew;
        R_best(NC+1,:)=R_bestnew;%找到更优解，把以前的替换掉，迭代次数加1
    else
        L_best(NC+1,1)=L_best(NC,1);
        R_best(NC+1,:)=R_best(NC,:);%表示此次更新没有比以前更优，保持以前的，迭代次数加1
    end
    x=xnew;
    plotTSP10(Clist,R_best(NC,:),L_best(NC,1),NC,0);%clist是关于城市位置的一个矩阵，并绘制此次路径图
    %pause;
    NC=NC+1;
end
 
%输出结果
Pos=find(L_best==min(L_best));%在迭代完成后找出最终的最短路径的粒子
Shortest_Route=R_best(Pos(1),:);%返回所找到最短路径的粒子所走的路径
Shortest_Length=L_best(Pos(1));%返回最终的最短路径的长度
figure(2);
plot([L_best L_ave]);%绘制每次迭代，最短路径和平均路径的变化，使大家更容易看到次算法的效率
text(85,4.5,['结果：本次搜索最短距离为 ',num2str(Shortest_Length)]);
legend('最短距离','平均距离');%%用来区分最短路径和平均路径
end
 
