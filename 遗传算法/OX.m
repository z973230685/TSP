function [x1,y1] = OX(x,y)
%OX ����OX��������Ⱦɫ��Ľ���
%   x,yΪ����ĸ�Ⱦɫ�壬x1,y1Ϊ���ؽ�����
n = size(x,2);
while(1)
    t = randi(n-1,1,2);
    if t(1) ~= t(2)
        break
    end
end
t;
x1 = zeros(1,n);
y1 = zeros(1,n);
x1(min(t)+1:max(t)) = y(min(t)+1:max(t));
y1(min(t)+1:max(t)) = x(min(t)+1:max(t));
z = zeros(1,n);
z(:) = [x(max(t)+1:n) x(1:max(t))];
j = max(t)+1;
for i = 1:n
    if ismember(z(i),x1) ~= 1
        x1(j) = z(i);
        j = j + 1;
        if j > n
            j = 1;
        end
    end
end
z(:) = [y(max(t)+1:n) y(1:max(t))];
j = max(t)+1;
for i = 1:n
    if ismember(z(i),y1) ~= 1
        y1(j) = z(i);
        j = j + 1;
        if j > n
            j = 1;
        end
    end
end
end

