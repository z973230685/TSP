function [dis] = decoder(x,D)
%decoder 将编码的种群转化为距离
% x为当前编码，D为城市分布，dis返回对应的距离
dis = 0;
n = size(x,2);
for i = 1:n-1
    dis = dis + D(x(i),x(i+1));
end
dis = dis + D(x(1),x(n));
end


