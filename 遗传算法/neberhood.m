function [Neb] = neberhood(x)
%neberhood ���㵱ǰ���е���������
%   xΪ��ǰ����, NebΪ������������У����к�����Ϊ�������
n = size(x,2);
Neb = [];
y = zeros(1,n+2);
for i = 2:n-1
    for j = i+1:n
        y(1,1:n) = x;
        t = y(i);
        y(i) = y(j);
        y(j) = t;
        y(1,n+1) = x(i);
        y(1,n+2) = x(j);
        Neb = [Neb;y];
    end
end
end

