clear
close all
load('Exact.mat')

dx = 5100/511;
dy = 5100/511;

h = 200;

Xtemp = extend4(X);
B1 = upward_operator(Xtemp,dx,dy,h,'f');
B1 = reshape(B1,512*2, 512*2);
B1 = B1(1:512,1:512);
% B1 = B1';
B2 = upward_operator(X,dx,dy,h,'b');


figure(1);
subplot(1,2,1)
myplot(B1);
subplot(1,2,2)
myplot(B2);

figure(2);
myplot(B1 - B2)
