function [x2] = select(x,p2)
%select ���̶�ѡ����
%  xΪ��Ⱥ��p1Ϊ��Ӧ�ȸ���,x2Ϊ��ѡ��Ⱦɫ��
n = size(x,1);
r = rand();
for i = 1:n
    if r <= p2(i)
        break
    end
end
x2 = x(i,:);
end

