function [x1] = mutation(x)
%mutation ����Ⱦɫ���㷨  ����ֻ����һ�ν���
%xΪ����ǰȾɫ�壬x1Ϊ�������
n = size(x,2);
x1 = zeros(1,n);
while(1)
    t = randi(n-1,1,2);
    if t(1) ~= t(2)
        break
    end
end
x1(:) = x;
x1(t(1)) = x(t(2));
x1(t(2)) = x(t(1));
end

