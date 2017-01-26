clear;
close all;

% load('data_250_1.mat');
% %load('data_0_exact.mat');
 load('Exact1');

dx = 5100/511;
dy = 5100/511;
h = 250;

A = Forward_FFT(dx,dy,Ex,h);
[m,n] = size(A);
alpha = 1;

ig = zeros(m,n);
iter = 1;
u = ig;
e(1) = norm(A, inf)
tol = 10^-4;

tic
while iter < 1000 && e(iter)/e(1) > tol
    iter = iter + 1
    u = u + alpha*(A - Forward_FFT(dx,dy,u,h));
    e(iter) = norm(A - Forward_FFT(dx,dy,u,h), inf);
    e(iter)/e(1)
end
toc
myplot(u)
