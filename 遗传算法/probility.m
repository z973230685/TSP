function [p1,p2] = probility(y)
%probility  ������㺯����Ӧ�ȶ�Ӧ�ĸ���
%   yΪ������Ӧ�ȵ���ֵ��p1Ϊ��ռ����,p2Ϊ��ռ����
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

