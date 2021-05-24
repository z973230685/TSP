function [net] = update_net(net,select_city,near_num,lr,radix)
% update_net ����������Ԫ״̬
%   netΪ��ǰ���� select_cityΪ��ѡ���У� near_numΪ��ʤ��Ԫ lrΪѧϰ�� nnetΪ��˹�ֲ�����뾶
n = size(net,1);
domain = 1:1:n;
deltas = abs(near_num - domain);
distances = zeros(1,n);
%for i = 1:n
    %distances(i) = min(deltas(i),domain(i) - deltas(i));
%end

%distances(:) = min(deltas(:), domain(:) - deltas(:));
gaussian = exp(-(deltas.*deltas) / (2*(radix*radix)));
gaussian = repmat(gaussian',1,2);
%size(gaussian)
%size(repmat(select_city,n,1) - net)
net = net + lr .* gaussian .* (repmat(select_city,n,1) - net);
end

