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

for i = 1:8
    r(i) = ((d(i) + d(i+1))/2);
end
for i = 1:size(G,1)
    index(i,:) = myquantizer(G(i,:),d);
end
for i = 1:size(index,1)
    quantized(i,:) = mydequantizer(index(i,:),r);
end
r
E1 = entropy(index)
snr = snr(G,quantized)
imagesc(quantized)
colormap(gray)
MSE = mean(mean((quantized-double(G)).^2))
