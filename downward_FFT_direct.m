clear
close all
% load('Exact1.mat')
% load('data_250_1.mat')
load h200;

dx = 5100/511;
dy = 5100/511;

h = 200

%B2 = Forward_FFT(dx, dy, Ex, h);


X = Forward_FFT(A,dx,dy,-h);
%subplot(1,2,1)
myplot(X)
% subplot(1,2,2)
% myplot(Ex-X)