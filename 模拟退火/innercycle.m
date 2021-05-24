function [x] = innercycle(x,T,D,k)
%inner cycle 其为内循环函数
%   x为当前编码，T为当前温度,D为城市距离矩阵,k为循环次数
n = 0;
n_t = Tfuction(x,T,k);
while n<=n_t
    x2 = mutation(x);
    f1 = decoder(x,D);
    f2 = decoder(x2,D);
    t = exp(-(f2-f1)/T);
    if t>1
        x = x2;
    else
        if min(1,t)>rand(1)
            x = x2;
        end
    end
    n = n + 1;
end

end

