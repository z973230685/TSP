%main 模拟退火算法主要函数
%S为点坐标矩阵 D为距离矩阵
%path为坐标文件，alpha为退火系数，T0为终止温度
 
path = "att48-1.txt";
[S,D] = makemap(path);
n = size(S,1);
x = randperm(n);
alpha = 0.95;
T0 = 0.01;
%T = 300;
T = Tinitial(D);

[x,value,X,v_best] = outtercycle(x,T,D,alpha,T0);

xnum = 1:size(value);
figure(1);
plot(xnum,value(:,1))

TSPplot(X,S,0,v_best,0)
