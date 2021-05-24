function [x,value,X,v_best] = outtercycle(x,T,D,alpha,T0)
%uttercycle 退火算法外循环函数
%   x为当前编码，T为当前温度，D为距离矩阵，alpha为退火系数 T0为截至温度 X为最优解坐标 v_best为最优解值
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

