clear all;
close all;

load('data_250_1.mat');
%load('data_0_exact.mat');
%  load('h200');
 load('Exact');

dx = 5100/511;
dy = 5100/511;
h = 250;
[M,N] = size(A);
% A = tx_FFT(dx,dy,Ex,h,M,N);
% [m,n] = size(A);
A = reshape(A,M*N,1);

%%%%%%%%%%%%%%%%%%%%%%
% A = A + 0.018*randn(M*N,1);
%%%%%%%%%%%%%%%%%%%%%%

ig = zeros(M*N,1);

tol = 10^-3;
tic
[u,e,gap]=CG_FFT(A,ig,h,tol,M,N,dx,dy,X);
toc
close all;
figure(1)
hold on
plot(log10(e))
plot(log10(gap))
u = reshape(u,512,512);
U = u(10:500, 10:500);
myplot(u);

