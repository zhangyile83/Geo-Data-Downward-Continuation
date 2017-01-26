%this code is written for the different scales of the initial data;
%the result is worked out by using the compact storage without
%preconditioner
clear;
close all
% load mag2_h0
%A = cut(512,512,B);
% A = extend_matrix(512,A);
load h_200_Exact
% load h200
% load mag2_h200
load Exact;

% A = B;

% dx = 10;
% dy = 10;
dx = 5100/511;
dy = 5100/511;

% h = 100;
% A = Forward_BTTB(Ex,h);

scale=1;
lt=0;
h = 200;
tol = 10^-3;
noiselevel = 0;
alpha=0.001;

T=reshape(A,512,512);
B=mypick(T,scale);
[n,n]=size(B);
b=reshape(B,n*n,1);
temp=noiselevel*randn(n*n,1);
temp1=norm(b);
ccc1=norm(temp)/temp1
b1=b;
b=b+temp;

b = reshape(b,512,512);
% b = denoising_dwt(b);
b = reshape(b,512*512,1);

m = 512/scale;
n = 512/scale;

ig = zeros(m*n,1);
%b = data(:,3);%ones(m*n,1);
t = fcolrow(m,n,scale,dx,dy,h);
tev = gentev(t);
%{
temp11=tx(tev,temp);
temp12=tx(tev,b1);
ccc2=norm(temp11)/norm(temp12)
ccc3=ccc2/ccc1
pause(4);
%}

tic;
[u,e,gap] = CG_BTTB(b,ig,tev,tol,X);
toc

close all;
figure(1)
hold on
plot(log10(e))
plot(log10(gap),'r')

figure(2)
myplot(reshape(u,512,512))
%myplot(reshape(u))


% myplot(u);
% %plot(log10(e))
% Ex=reshape(Ex,512*512,1);
% ccc2=norm(u-Ex)/norm(Ex)
% ccc3=norm(u-Ex,inf)/norm(Ex,inf)
% 
% u=reshape(u,512,512);
% X=reshape(Ex,512,512);
% u=u(lt+1:512-lt,lt+1:512-lt);
% X=X(lt+1:512-lt,lt+1:512-lt);
%mesh(u-X)
%ccc3=norm(u-X)/norm(X);
