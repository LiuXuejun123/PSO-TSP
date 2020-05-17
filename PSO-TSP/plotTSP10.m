function m=plotTSP10(Clist,BSF,bsf,p,f)

CityNum=size(Clist,1);

for i=1:CityNum-1
    axis([0,100,0,100]);
    %绘制点的连线图
    plot([Clist(BSF(i),1),Clist(BSF(i+1),1)],[Clist(BSF(i),2),Clist(BSF(i+1),2)],'rs-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g');
    hold on;%'rs-','LineWidth',3,'MarkerEdgeColor','','MarkerFaceColor','g'-表示线为红色实线线宽为2，点为方形绿点边缘为黑色
    
end
axis([0,100,0,100]);
%绘制最后一个点和起始点的连线
plot([Clist(BSF(CityNum),1),Clist(BSF(1),1)],[Clist(BSF(CityNum),2),Clist(BSF(1),2)],'ms-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g');
%'ms-','LineWidth',3,'MarkerEdgeColor','','MarkerFaceColor','g'-表示线为洋红色实线线宽为2，点为方形绿点边缘为黑色
title([num2str(CityNum),'TSP']);
if f==0
    text(5,5,['迭代次数 ',int2str(p),'  最短距离 ',num2str(bsf)]);
end
hold off;
pause(0.05); 
