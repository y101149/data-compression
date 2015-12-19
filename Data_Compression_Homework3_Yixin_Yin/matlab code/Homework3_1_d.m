clear
X=[0,0.65, 0.7, 0.7, 0.7, 0.9, 0.9, 1, 1, 1, 1, 1.2, 1.6, 1.8, 1.8, 1.74, 1.75, 1.9, 1.93, 1.94, 2.2,2.2, 2.3, 2.35, 2.37, 2.5, 2.9];
d = [0,3/4,6/4,9/4,3]
r0array = []
r1array = []
r2array = []
r3array = []
for i = 1:length(X)
    if (X(i) < d(2) && X(i) >= d(1))
        r0array = [r0array,X(i)]
    elseif(X(i)>=d(2) && X(i)<d(3))
        r1array = [r1array,X(i)]
    elseif (X(i)>=d(3) && X(i)<d(4))
        r2array = [r2array,X(i)]
    else
        r3array = [r3array,X(i)]
    end
end


r0 = mean(r0array)
r1 = mean(r1array)
r2 = mean(r2array)
r3 = mean(r3array)
r = [r0,r1,r2,r3]
    
index = myquantizer(X,d)
quantized = mydequantizer(index,r)
MSE = mean((quantized-X).^2);
index
quantized
MSE