function [v1,v2,X] = TS(x,D,Tabusize,Km,S,a)
%TS �����㷨��������ֵ
%   xΪ��ʼ���У�DΪ�������TabusizeΪ���ɲ�����SΪ���������,KmΪ����������aΪ�ͷ�ϵ����v1��v2�ֱ�Ϊ��ǰ���Ž���������Ž�,XΪ���Ž�����
n = size(x,2);
Table = zeros(n);
v1 = zeros(Km,1);
v2 = zeros(Km,1);
v = -1;
%v_2 = -1;
X = zeros(1,n);
for i = 1:Km
    Neb = neberhood(x);
    %Neb = randnum(Neb,200);
    dis = fit(Neb,D,Table,a);
    flag = size(Neb,1);
    while(1)
        index = find(dis(:,1)==min(dis(:,1)),1);
        if Table(min(Neb(index,n+1),Neb(index,n+2)),max(Neb(index,n+1),Neb(index,n+2))) == 0
            Table(min(Neb(index,n+1),Neb(index,n+2)),max(Neb(index,n+1),Neb(index,n+2))) = Tabusize;
            if v>0
                if v > dis(index,1)
                    v = dis(index,1);
                    X = Neb(index,1:n);
                    v1(i) = v;
                    v2(i) = v;
                   % v_2 = dis(index,2);
                else
                    v1(i) = dis(index,1);
                    v2(i) = v;
                end
            else
                X = Neb(index,1:n);
                v = dis(index,1);
                %v_2 = dis(index,2);
                v1(i) = v;
                v2(i) = v;
            end
            Table(max(Neb(index,n+1),Neb(index,n+2)),min(Neb(index,n+1),Neb(index,n+2))) = Table(max(Neb(index,n+1),Neb(index,n+2)),min(Neb(index,n+1),Neb(index,n+2)))+1;
            break;
        else
            if dis(index,2) < v
                X = Neb(index,1:n);
                Table(min(Neb(index,n+1),Neb(index,n+2)),max(Neb(index,n+1),Neb(index,n+2))) = Tabusize;
                v = dis(index,1);
                v1(i) = v;
                v2(i) = v;
                %v_2 = dis(index,2);
                Table(max(Neb(index,n+1),Neb(index,n+2)),min(Neb(index,n+1),Neb(index,n+2))) = Table(max(Neb(index,n+1),Neb(index,n+2)),min(Neb(index,n+1),Neb(index,n+2)))+1;
                break
            else
                if flag ~= 1
                    dis(index,:) = [];
                    Neb(index,:) = [];
                    flag = flag - 1;
                else
                    Table(min(Neb(index,n+1),Neb(index,n+2)),max(Neb(index,n+1),Neb(index,n+2))) = Tabusize;
                    if v>0
                        if v > dis(index,2)
                            v = dis(index,1);
                            v1(i) = v;
                            v2(i) = v;
                        else
                            v1(i) = dis(index,1);
                            v2(i) = v;
                        end
                    else
                        v = dis(index,1);
                        v1(i) = v;
                        v2(i) = v;
                    end
                    Table(max(Neb(index,n+1),Neb(index,n+2)),min(Neb(index,n+1),Neb(index,n+2))) = Table(max(Neb(index,n+1),Neb(index,n+2)),min(Neb(index,n+1),Neb(index,n+2)))+1;
                    break;
                end
            end
        end
    end
    for o = 1:n-1
        for p = o+1:n
            if Table(o,p) ~= 0
                Table(o,p) = Table(o,p)-1;
            end
        end
    end
    x = Neb(index,1:n);
    i
    if i == 10||i == 50||i == 100||i == 200||i == 500||i == 1000||i == 2000||i == 5000
        TSPplot(x,S,v1(i),v2(i),i);
    end
end
end


