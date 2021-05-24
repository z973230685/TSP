function [x2] = select(x,p2)
%select 轮盘赌选择函数
%  x为种群，p1为适应度概率,x2为所选择染色体
n = size(x,1);
r = rand();
for i = 1:n
    if r <= p2(i)
        break
    end
end
x2 = x(i,:);
end

