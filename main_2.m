%main_2 �����㷨��Ҫ���� 
%xΪ��ʼ���У�DΪ�������TabusizeΪ���ɲ�����SΪ���������,
%KmΪ����������aΪ�ͷ�ϵ����v1��v2�ֱ�Ϊ��ǰ���Ž���������Ž�

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
 

%D = distance(S);
%path = "att48-1.txt";
path = "DJ38.txt";
[S,D] = makemap(path);
n = size(S,1);
a = 0.001;
Km = 5000;
Tabusize = 50;
x = randperm(n);
%x = initial_TS(D);


[v1,v2,X] = TS(x,D,Tabusize,Km,S,a);
min(v2)
xnum = 1:Km;
figure(1);
plot(xnum,v1)
figure(2);
plot(xnum,v2)
TSPplot(X,S,0,min(v2),0)
