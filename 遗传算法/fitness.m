function [value] = fitness(X,D,c)
%fitness 计算编码的适应度
% X为所有种群编码，D为距离矩阵，c为给定常数value为返回适应度第一列为结果值，第二列为计算用。
n = size(X,1);
value = zeros(n,2);
for i = 1:n
    value(i,2) =  c/decoder(X(i,:),D);
    value(i,1) =  decoder(X(i,:),D);
end

