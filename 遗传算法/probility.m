function [p1,p2] = probility(y)
%probility  这里计算函数适应度对应的概率
%   y为输入适应度的数值，p1为所占比例,p2为所占比率
n = size(y,1);
p1 = zeros(n,1);
p2 = zeros(n,1);
%s = 0;
for i = 1:n-1
   % s = s+y(i);
   % p2(i) = s;
    p1(i) = y(i)/sum(y);
    p2(i) = sum(p1);
end
p1(n) = 1-sum(p1);
p2(n) = 1;
end

