function [X] = initial(N,n)
%initial �Ŵ��㷨_��ʼ����Ⱥ
% NΪ��Ⱥ������nΪ�������еĳ�����Ŀ��XΪ������Ⱥ����
X = zeros(N,n);
for i = 1:N
    X(i,:)= randperm(n);
end

