function [X] = initial(N,n)
%initial 遗传算法_初始化种群
% N为种群数量，n为问题所有的城市数目，X为返回种群矩阵
X = zeros(N,n);
for i = 1:N
    X(i,:)= randperm(n);
end

