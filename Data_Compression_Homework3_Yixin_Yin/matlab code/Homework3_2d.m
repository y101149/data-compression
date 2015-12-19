clear;
[I,map] = imread('River.gif');
G = ind2gray(I,map);
E = entropy(G);
largest = double(max(max(G)));
smallest = double(min(min(G)));
myvec = double(reshape(G,1,[]));
[d,r] = lloyds(myvec,8);
d = [smallest,d,largest+0.001];
for i = 1:size(G,1)
    index(i,:) = myquantizer(G(i,:),d);
end
for i = 1:size(index,1)
    quantized(i,:) = mydequantizer(index(i,:),r);
end
d
r
E1 = entropy(index)
snr = snr(G,quantized)
imagesc(quantized)
colormap(gray);
MSE = mean(mean((quantized-double(G)).^2))
