function [Neb_n] = randnum(Neb,num) 
%randnun ����ָ����Ŀ��������󣬼�ѡ��ָ����Ŀ
%   NebΪ�������numΪ��������Ŀ,Neb_nΪ�µ��������
n = size(Neb,1);
m = n - num;
for i = 1:m
    t = randi(n);
    Neb(t,:) = [];
    n = n - 1; 
end
Neb_n = Neb;
end

