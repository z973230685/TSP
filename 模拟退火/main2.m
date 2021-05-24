%main2 模拟退火算法主要函数
%S为点坐标矩阵 D为距离矩阵
%path为坐标文件，alpha为退火系数，T0为终止温度
%该为30城市的结果

S = [[41 94]
     [37 84]
     [54 67]
     [25 62]
     [ 7 64]
     [ 2 99]
     [68 58]
     [71 44]
     [54 62]
     [83 69]
     [64 60]
     [18 54]
     [22 60]
     [83 46]
     [91 38]
     [25 38]
     [24 42]
     [58 69]
     [71 71]
     [74 78]
     [87 76]
     [18 40]
     [13 40]
     [82  7]
     [62 32]
     [58 35]
     [45 21]
     [41 26]
     [44 35]
     [ 4 50]];

D = distance(S);
%path = "att48-1.txt";
path = "DJ38.txt";
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
