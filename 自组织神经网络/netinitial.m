function [net] = netinitial(n,S)
% netinitial ��Ϊ��Ԫ�����ʼ��
%   nΪ����ڵ������SΪĿ������

max_x = max(S(:,1));
max_y = max(S(:,2));
min_x = min(S(:,1));
min_y = min(S(:,2));

net = zeros(n,2);
for i = 1:n
    net(i,1) = rand()*(max_x - min_x)*2 + min_x;
    net(i,2) = rand()*(max_y - min_y)*2 + max_y;
    
end
end

