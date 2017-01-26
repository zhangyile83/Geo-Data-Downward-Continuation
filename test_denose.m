load('Exact1.mat')

[m,n] = size(Ex);
A = Ex + randn(m,n);
B = denoise_FFT(A);

subplot(1,3,1)
myplot(A)
subplot(1,3,2)
myplot(B)
subplot(1,3,3)
myplot(A-B)