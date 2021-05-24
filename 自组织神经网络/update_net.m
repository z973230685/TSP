function [net] = update_net(net,select_city,near_num,lr,radix)
% update_net 更新网络神经元状态
%   net为当前网络 select_city为所选城市， near_num为优胜神经元 lr为学习率 nnet为高斯分布辐射半径
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

