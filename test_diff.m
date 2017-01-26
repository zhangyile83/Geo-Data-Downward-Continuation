load('Exact1.mat')
A = diff(Ex,2,1);
figure(1)
myplot(A)
[m,n] = size(Ex);
Ex = Ex + randn(m,n);
B = diff(Ex,2,1);
figure(2)
myplot(B)

C = medfilt2(B);
figure(3)
myplot(C)
