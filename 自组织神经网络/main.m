%main 模拟退火算法主要函数
% E为价值矩阵， Sig为协方差矩阵
%path为坐标文件，alpha为退火系数，T0为终止温度
 

[filename,filepath]=uigetfile('*.txt','Select Input file');
file = [filepath filename];
fid = fopen(file,'rt');
if fid == -1
    ('Error opening the file')
end
%%读取文件
i = 0;
S = [];
while 1
    i = i + 1;
    nextline = fgetl(fid); %读第一行
    if ~ischar(nextline)
        break
    end %读到最后跳出
    s = sscanf(nextline,'%f');
    S = [S;s'];
end
S(:,1) = [];


n = size(S,1);
%S(:,1) = S(:,1) - repmat(min(S(:,1)),n,1);
%S(:,2) = S(:,2) - repmat(min(S(:,2)),n,1);
D = distance(S);
% N为神经元个数
N = 20*n;
nnet = N;
% lr为学习率
lr = 0.9;
%Nmax为最大迭代次数
Nmax = 100000;
net = netinitial(nnet,S);

i = 0;

while i <Nmax
    i = i + 1
    select_city = S(randi(n),:);
    min_dis = inf;
    near_num = 0;
    for j = 1:N
        dis = sqrt(sum((select_city - net(j,:)).^2));
        if dis < min_dis
            min_dis = dis;
            near_num = j;
        end
    end
    net = update_net(net,select_city,near_num,lr,max(1,floor(nnet/10)));
    
    nnet = nnet * 0.9997;
    lr = lr * 0.99997;
    if mod(i,10000) == 0 || i == 10 || i == 100 || i == 1000
        A = zeros(N);
        for j = 1:N-1
            A(j,j+1) = 1;
            A(j+1,j) = 1;
        end
        A(N,1) = 1;
        A(1,N) = 1;
        figure(i);
        plot(S(:,1),S(:,2),'b.')
        hold on;
        gplot(A,net,'-*')
    end
end

x =zeros(n,2);
for i = 1:n
    city = S(i,:);
    nearest_city = 0;
    min_dis = inf;
    for j = 1:size(net,1)
        dis = sqrt(sum((city - net(j,:)).^2));
        if dis < min_dis
            min_dis = dis;
            nearest_city = j;
        end
    end
    x(i,1) = i;
    x(i,2) = nearest_city;
end
x = sortrows(x,2);
x = x(:,1)';
v2 = decoder(x,D);
TSPplot(x,S,0,v2,0)









