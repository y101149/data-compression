clear;
[I,map] = imread('River.gif');
G = ind2gray(I,map);
E = entropy(G);
largest = double(max(max(G)));
smallest = double(min(min(G)));
d0 = smallest;
d8 = largest + 0.001;
interval = (d8 - d0)/8;
d = [d0];
for i = 1:7
    d = [d,d0 + i * interval];
end
d = [d,d8]
r0array = [];
r1array = [];
r2array = [];
r3array = [];
r4array = [];
r5array = [];
r6array = [];
r7array = [];
r = [];

for i = 1:size(G,1)
    index(i,:) = myquantizer(G(i,:),d);
end
for i = 1:size(index,1)
    for j = 1:size(index,2)
        if(index(i,j) == 0)
            r0array = [r0array,G(i,j)];
        elseif (index(i,j) == 1)
            r1array = [r1array,G(i,j)];
        elseif (index(i,j) == 2)
            r2array = [r2array,G(i,j)];
        elseif (index(i,j) == 3)
            r3array = [r3array,G(i,j)];
        elseif (index(i,j) == 4)
            r4array = [r4array,G(i,j)];
        elseif (index(i,j) == 5)
            r5array = [r5array,G(i,j)];
        elseif (index(i,j) == 6)
            r6array = [r6array,G(i,j)];
        elseif (index(i,j) == 7)
            r7array = [r7array,G(i,j)];
        end
    end
end
r(1) = (mean(r0array));
r(2) = (mean(r1array));
r(3) = (mean(r2array));
r(4) = (mean(r3array));
r(5) = (mean(r4array));
r(6) = (mean(r5array));
r(7) = (mean(r6array));
r(8) = (mean(r7array));
r = (r);          
for i = 1:size(index,1)
    quantized(i,:) = mydequantizer(index(i,:),r);
end
r
E1 = entropy(index)
snr = snr(G,quantized)
imagesc(quantized)
colormap(gray)
MSE = mean(mean((quantized-double(G)).^2))

