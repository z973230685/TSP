function [value] = fitness(X,D,c)
%fitness ����������Ӧ��
% XΪ������Ⱥ���룬DΪ�������cΪ��������valueΪ������Ӧ�ȵ�һ��Ϊ���ֵ���ڶ���Ϊ�����á�
n = size(X,1);
value = zeros(n,2);
for i = 1:n
    value(i,2) =  c/decoder(X(i,:),D);
    value(i,1) =  decoder(X(i,:),D);
end

