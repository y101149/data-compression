clear
X=[0,0.65, 0.7, 0.7, 0.7, 0.9, 0.9, 1, 1, 1, 1, 1.2, 1.6, 1.8, 1.8, 1.74, 1.75, 1.9, 1.93, 1.94, 2.2,2.2, 2.3, 2.35, 2.37, 2.5, 2.9];
d = [0,1.0,2.0,3]
r = [0.5,1.5,2.5]
index = myquantizer(X,d)
quantized = mydequantizer(index,r)
MSE = mean((quantized-X).^2);
index
quantized
MSE

