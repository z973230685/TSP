function [dis] = fit(Neb,D,Table,a)
%fit �����ڽ����㷨�м���������������ȡֵ
%   NebΪ������� DΪ�������TableΪ���Ϊ�����ӳͷ����ӣ�aΪ���ʣ�disΪ��������ľ���ȡֵ,��һ��Ϊ���룬�ڶ��мӳͷ�
n = size(Neb,1);
m = size(Neb,2);
dis = zeros(n,2);
for i = 1:n
    dis(i,1) = decoder(Neb(i,1:m-2),D);
    dis(i,2) = dis(i) + a*Table(max(Neb(i,m-1),Neb(i,m-2)),min(Neb(i,m-1),Neb(i,m-2)));
end
end

