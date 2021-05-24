function [x] = initial_TS(D)
%initial_TS 按照启发式方法初始化初始点
%   D为距离矩阵,x为返回结果
n = size(D,1);
x = zeros(1,n);
x(1) = randi(n);
for i = 2 : n
    t = -1;
    index = 0;
    for j = 1:n
        if ismember(j,x)~=1
            if D(x(i-1),j)~=0
                if t > 0
                    if D(x(i-1),j) < t
                        index = j;
                        t =  D(x(i-1),j);
                    end
                else
                    index = j;
                    t = D(x(i-1),j);
                end
            end
        end
    end
    x(i) = index;
end
end

