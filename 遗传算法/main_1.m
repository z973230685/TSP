%main_1 遗传算法主要函数
%S为点坐标矩阵 NP为每次种群数目 N为初始种群数目 D为距离矩阵
%Km为最大迭代次数 Pm为变异概率 Pc为交叉概率 c为常值参数
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

NP = 5000;
N = 10000;
Km = 5000;
Pm = 0.02;
Pc = 0.3;
c = 10000;
Value = zeros(Km,2);

D = distance(S);
path = "att48-1.txt";
path = "DJ38.txt";
[S,D] = makemap(path);
X = initial(N,size(S,1));
X_best = zeros(1,size(S,1));
%X(size(X,1),:)=[2 2 4 7 4 7 8] 
value = fitness(X,D,c);
[p1,p2] = probility(value(:,2));
for i = 1:Km
    z = zeros(NP,size(X,2));
    for j = 1:NP
        z(j,:) = select(X,p2);
    end
    for j = ceil(NP*Pm)+1:2:ceil(NP*Pc+NP*Pm)
        [z(j,:),z(j+1,:)]=OX(z(j,:),z(j+1,:));
    end
    for j = 1:ceil(NP*Pm)
        z(j,:) = mutation(z(j,:));
    end
    value = fitness(z,D,c);
    [p1,p2] = probility(value(:,2));
    Value(i,1) = mean(value(:,1));
    Value(i,2) = min(value(:,1));
    index = find(value(:,1)==min(value(:,1)),1);
    X = z;
    i
    if Value(i,2)<=min(Value(1:i,2))
        X_best(1,:) = z(index,:);
    end
    if i == 10||i == 50||i == 100||i == 200||i == 500||i == 1000||i == 2000||i == 5000
        %X(index,:)
        TSPplot(X(index,:),S,Value(i,2),min(Value(1:i,2)),i);
    end
end
min(Value(:,2))
xnum = 1:Km;
figure(1);
plot(xnum,Value(:,1))
figure(2);
plot(xnum,Value(:,2))
TSPplot(X_best,S,0,min(Value(:,2)),0)
