clear
X=[0,0.65, 0.7, 0.7, 0.7, 0.9, 0.9, 1, 1, 1, 1, 1.2, 1.6, 1.8, 1.8, 1.74, 1.75, 1.9, 1.93, 1.94, 2.2,2.2, 2.3, 2.35, 2.37, 2.5, 2.9];
[d,r] = lloyds(X,4)
d = [0,d,3]%include the d0 and dn
index = myquantizer(X,d)
quantized = mydequantizer(index,r)
MSE = mean((quantized-X).^2);
d
r
index
quantized
MSE

