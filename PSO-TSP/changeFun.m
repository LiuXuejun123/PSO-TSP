function xnew=changeFun(x,C)
changeLen=size(C,1);%返回矩阵c的行数
xnew=x;
for i=1:changeLen
    a=xnew(C(i,1));
    xnew(C(i,1))=xnew(C(i,2));%通过c这个交换序对当前粒子进行更新
    xnew(C(i,2))=a;%逐个交换位置
end
end
