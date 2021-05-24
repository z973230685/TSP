function [n] = Tfuction(x,T,k)
%Tfuction 用来计算内循环的次数函数
%   x为城市数，T为温度，n为内循环次数
n = 10*size(x,2)*(k+1);
end

