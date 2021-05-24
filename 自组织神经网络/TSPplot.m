function [] = TSPplot(x,S,v1,v2,step)
%TSPplot 用来画出当前解值的图
%   x为当前排列，S为点坐标，v1为当前解，v2为最优解,step为当前步长
n = size(x,2);
A = zeros(n);
for i = 1:n-1
    A(x(i),x(i+1)) = 1;
    A(x(i+1),x(i)) = 1;
end
A(x(n),x(1)) = 1;
A(x(1),x(n)) = 1;
if step == 0
    figure(3);
    gplot(A,S,'-*')
    text(11000,41800,['最优解为' num2str(v2,"%.4f")]);
else
    figure(step);
    gplot(A,S,'-*')
    text(0,5,['第' num2str(step,"%d") '次迭代，当前解为' num2str(v1,"%.4f") '最优解为' num2str(v2,"%.4f")]);
end
end

