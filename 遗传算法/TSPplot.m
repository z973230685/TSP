function [] = TSPplot(x,S,v1,v2,step)
%TSPplot ����������ǰ��ֵ��ͼ
%   xΪ��ǰ���У�SΪ�����꣬v1Ϊ��ǰ�⣬v2Ϊ���Ž�,stepΪ��ǰ����
n = size(x,2);
A = zeros(n);
for i = 1:n-1
    A(x(i),x(i+1)) = 1;
    A(x(i+1),x(i)) = 1;
end
A(x(n),x(1)) = 1;
A(x(1),x(n)) = 1;
if step == 0
    figure(3);
    gplot(A,S,'-*')
    text(11000,41800,['���Ž�Ϊ' num2str(v2,"%.4f")]);
    %text(0,5,['���Ž�Ϊ' num2str(v2,"%.4f")]);
else
    figure(step);
    gplot(A,S,'-*')
    text(0,5,['��' num2str(step,"%d") '�ε�������ǰ��Ϊ' num2str(v1,"%.4f") '���Ž�Ϊ' num2str(v2,"%.4f")]);
    %text(11000,41800,['��' num2str(step,"%d") '�ε�������ǰ��Ϊ' num2str(v1,"%.4f") '���Ž�Ϊ' num2str(v2,"%.4f")]);
end
end

