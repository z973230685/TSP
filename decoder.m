function [dis] = decoder(x,D)
%decoder ���������Ⱥת��Ϊ����
% xΪ��ǰ���룬DΪ���зֲ���dis���ض�Ӧ�ľ���
dis = 0;
n = size(x,2);
for i = 1:n-1
    dis = dis + D(x(i),x(i+1));
end
dis = dis + D(x(1),x(n));
end


