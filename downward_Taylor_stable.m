clear
close all
load('h200.mat');

dx = 5100/511;
dy = 5100/511;
h = 200;

%load('real_data_gravity2.mat')
[M,N] = size(A);

%Ex = A
%A = upward_operator(A,dx,dy,h,'f');
A = A + 0.018*randn(M,N);
A = denoising_dwt(A);


C = downward_iterative_operator_2013(A,dx,dy,h,'f');

% tol = 10^-2;
% ig = zeros(M*N,1);
% D = CG_FFT(reshape(A,M*N,1),ig,h,tol,M,N,dx,dy);
% 
% 
% t = fcolrow(M,N,1,dx,dy,h);
% tev = gentev(t);
% E = CG_BTTB(reshape(A,M*N,1),ig,tev,tol)

% 
% figure(1)
% myplot(C)
% 
% figure(2)
% myplot(D)
% 
% figure(3)
% myplot(E)
% 
% figure(4)
% myplot(Ex)
% 
% figure(5)
% myplot(A)