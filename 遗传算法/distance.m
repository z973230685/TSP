function [D] = distance(X)
%distance �������г��м�ľ���
%  XΪ�������꣬DΪ�������
n = size(X,1);
D = zeros(n,n);
for i = 1:n-1
    for j = i+1:n
        D(i,j) = sqrt(((X(i,1)-X(j,1))^2+(X(i,2)-X(j,2))^2));
        D(j,i) = D(i,j);
    end
end
end

