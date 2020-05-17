function v=randFun(v,w)
randLen=size(v,1);%返回矩阵v的行数
 
for i=1:randLen
    if rand>w
        v(i,2)=v(i,1);%保留经验1-w
    end
end    
end

