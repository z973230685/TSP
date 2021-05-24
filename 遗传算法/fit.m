function [dis] = fit(Neb,D,Table,a)
%fit 用来在紧急算法中计算所有邻域距离的取值
%   Neb为邻域矩阵， D为距离矩阵，Table为表格为了增加惩罚因子，a为倍率，dis为所有邻域的距离取值,第一列为距离，第二列加惩罚
n = size(Neb,1);
m = size(Neb,2);
dis = zeros(n,2);
for i = 1:n
    dis(i,1) = decoder(Neb(i,1:m-2),D);
    dis(i,2) = dis(i) + a*Table(max(Neb(i,m-1),Neb(i,m-2)),min(Neb(i,m-1),Neb(i,m-2)));
end
end

