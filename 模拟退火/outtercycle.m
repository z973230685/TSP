function [x,value,X,v_best] = outtercycle(x,T,D,alpha,T0)
%uttercycle �˻��㷨��ѭ������
%   xΪ��ǰ���룬TΪ��ǰ�¶ȣ�DΪ�������alphaΪ�˻�ϵ�� T0Ϊ�����¶� XΪ���Ž����� v_bestΪ���Ž�ֵ
value = [];
i = 0;
X = x;
v_best = -1;
while(T>T0)
    x = innercycle(x,T,D,i);
    v = decoder(x,D);
    if v_best >0
        if v<v_best
            v_best = v;
            X = x;
        end
    else
        v_best = v;
        X = x;
    end
    value = [value;v];
    T = alpha*T;
    i = i + 1
end
end

