clear all;
close all;
clc;

% load('data_250_1.mat');
% %load('data_0_exact.mat');
load('h200');
% load mag2_h200;
%load mag2_h0
 %load h50;
  load('Exact');
  
 A = extend4(A);
 X = extend4(X);


%  dx = 10;
%  dy = 10;
 
 dx = 5100/511;
 dy = 5100/511;

h = 200;
[M,N] = size(A);
% A = tx_FFT(dx,dy,Ex,h,M,N);
% [m,n] = size(A);
A = reshape(A,M*N,1);

%%%%%%%%%%%%%%%%%%%%%%
A = A +0*randn(M*N,1);
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
%myplot(reshape(u))

