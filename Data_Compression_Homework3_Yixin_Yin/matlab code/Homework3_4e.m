clear;
[I,map] = imread('River.gif');
G = ind2gray(I,map);
rownum = size(G,1);
colnum = size(G,2);
pararow = [];
paracol = [];
for i = 1 : rownum/8
    pararow = [pararow,8];
end
for i = 1 : colnum/8
    paracol = [paracol,8];
end
%divide it to 79*106 cell
C = mat2cell(G,pararow,paracol);
for i = 1 : size(C,1)
    for j = 1 : size(C,2)
        D{i,j} = dct2(C{i,j});
    end
end
DCterm = [];
% processing DC
for i = 1 : size(C,1)
    for j = 1 : size(C,2)
        DCterm = [DCterm,D{i,j}(1,1)];
    end
end
% [hehe,pad] = vec2mat(DCterm,106);
largest = max(DCterm)
smallest = min(DCterm)
d0 = smallest;
d64 = largest + 0.001;
interval = (d64 - d0)/64;
d = [d0];
r = [];
for i = 1:63
    d = [d,d0 + i*interval];
end
d = [d,d64];
for i = 1:64
    r(i) = ((d(i) + d(i+1))/2);
end
DCindex = myquantizer(DCterm,d);
DCquantized = mydequantizer(DCindex,r);
[quantizeddc,pad] = vec2mat(DCquantized,106);
for i = 1 : size(C,1)
    for j = 1 : size(C,2)
        E{i,j} = zeros(8);
    end
end
for i = 1 : size(C,1)
    for j = 1 : size(C,2)
        E{i,j}(1,1) = quantizeddc(i,j);
    end
end
% processing 9 AC term

for i = 1 : size(E,1)
    for j = 1 : size(E,2)
        F{i,j} = idct2(E{i,j});
    end
end
G10 = cell2mat(F);
imagesc(G10)
colormap(gray);
SNR = snr(G,G10)
        







