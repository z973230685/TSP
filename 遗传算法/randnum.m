function [Neb_n] = randnum(Neb,num) 
%randnun 保留指定数目的邻域矩阵，即选出指定数目
%   Neb为邻域矩阵，num为保留的数目,Neb_n为新的邻域矩阵
n = size(Neb,1);
m = n - num;
for i = 1:m
    t = randi(n);
    Neb(t,:) = [];
    n = n - 1; 
end
Neb_n = Neb;
end

