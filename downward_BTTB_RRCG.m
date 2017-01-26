%this code is written for the different scales of the initial data;
%the result is worked out by using the compact storage without
%preconditioner
clear;
close all
% load mag2_h0
%A = cut(512,512,B);
% A = extend_matrix(512,A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load h250;
load h50;
dx = 5100/511;
dy = 5100/511;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load Exact;

A = A/(2*pi);
MV = max(max(A));
D = D/(2*pi);

% dx = 10;
% dy = 10;


% dx = 10;
% dy = 10;

% h = 100;
% A = Forward_BTTB(Ex,h);

scale=1;
lt=0;
h = 200;
tol = 10^-3;
noiselevel = 5;
noiselevel = noiselevel/100 * MV;
alpha=0.095;

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

Num = 35;
tic;
[u,e] = CG_RR_BTTB(b,ig,tev,tol,alpha,Num);
toc

close all;
figure(1)
hold on
plot(log10(e))
% plot(log10(gap),'r')

K = reshape(u*2*pi,512,512);
figure(2)
myplot(K)
%myplot(reshape(u)
% norm(K-X,inf)/norm(X,inf)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gca,'xticklabel',[1000:1000:5000])
set(gca,'yticklabel',[500:500:5000])
% title('Longitudinal section at y=500m');
ylabel('Northing (m)','fontsize',12,'fontweight','b');
xlabel('Easting (m)','fontsize',12,'fontweight','b');
% set (gca,'position',[0.13,0.12,0.7,0.8] );

h=colorbar;
set(get(h,'Title'),'string','nT','fontsize',12,'fontweight','b');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
myplot(K-D);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gca,'xticklabel',[1000:1000:5000])
set(gca,'yticklabel',[500:500:5000])
% title('Longitudinal section at y=500m');
ylabel('Northing (m)','fontsize',12,'fontweight','b');
xlabel('Easting (m)','fontsize',12,'fontweight','b');
% set (gca,'position',[0.13,0.12,0.7,0.8] );

h=colorbar;
set(get(h,'Title'),'string','nT','fontsize',12,'fontweight','b');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



'RMS'
sqrt(norm(K-D)/(512*512))
'RE2'
norm(K-D)/norm(D)
'REinf'
norm(K-D,inf)/norm(D,inf)

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
