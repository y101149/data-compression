clear;
[I,map] = imread('River.gif');
G = ind2gray(I,map);
a1 = 1;
b1 = 0;
c1 = 0;
a2 = 0;
b2 = 0;
c2 = 1;
a3 = 0.5;
b3 = 0;
c3 = 0.5;
a4 = 1.0;
b4 = -1.0;
c4 = 1.0;
a5 = 0.75;
b5= -0.5;
c5 = 0.75;

R1 = (MyDPCM(G,a1,b1,c1));
R2 = (MyDPCM(G,a2,b2,c2));
R3 = (MyDPCM(G,a3,b3,c3));
R4 = (MyDPCM(G,a4,b4,c4));
R5 = (MyDPCM(G,a5,b5,c5));
E1 = entropy(R1)
E2 = entropy(R2)
E3 = entropy(R3)
E4 = entropy(R4)
E5 = entropy(R5)
minE = min([E1,E2,E3,E4,E5])
% imagesc(R1);
% colormap(gray);
largest = double(max(max(R4)))
smallest = double(min(min(R4)))
myvec = double(reshape(R4,1,[]));
[d,r] = lloyds(myvec,128);
d = [smallest,d,largest+0.001];
for i = 1:size(R1,1)
    index(i,:) = myquantizer(R4(i,:),d);
end
Eprime = reshape(index',1,[]);%make sure it is rowwise, we need transpose index
% need to do runlength////////////////
[numbers,times] = MyRLE(Eprime);
rle = [];

rle = [times,numbers];
e = entropy(rle)
for i = 1:size(index,1)
    quantized(i,:) = mydequantizer(index(i,:),r);
end
ReG = MyReconstruction(quantized,a4,b4,c4);
imagesc(ReG);
colormap(gray);

