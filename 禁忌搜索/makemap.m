function [S,D] = makemap(path)
%makemap 此为读取文件生成地图函数
%   path为文件路径 S,D分别为坐标矩阵与距离矩阵

S = load(path);
S(:,1) = [];
D = distance(S);

end

