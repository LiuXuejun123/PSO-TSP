function F=SumDistance(dislist,s)
 
DistanV=0;
n=size(s,2);
for i=1:(n-1)
    
DistanV=DistanV+dislist(s(i),s(i+1));%此函数用来计算总路程

end

DistanV=DistanV+dislist(s(n),s(1));

F=DistanV;
