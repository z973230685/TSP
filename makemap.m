function [S,D] = makemap(path)
%makemap ��Ϊ��ȡ�ļ����ɵ�ͼ����
%   pathΪ�ļ�·�� S,D�ֱ�Ϊ���������������

S = load(path);
S(:,1) = [];
D = distance(S);

end

