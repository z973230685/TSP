function [T] = Tinitial(D)
%Tinitial ��ʼ���˻��¶�
%   DΪ�������
n = size(D,1);
fv = zeros(n,1);
for i = 1:100
    route = randperm(n);
    fv(i,1) = decoder(route,D);
end
T = -(max(fv)-min(fv))/log(0.9);
end

