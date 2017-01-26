clear
close all
% load('h200.mat');
% load mag2_h200
% load exact
load h250;
load h50;
A = A/2/pi;
D = D/2/pi;

dx = 5100/511;
dy = 5100/511;
% dx = 10;
% dy = 10;
h = 200;    

% load h
% A = extend_matrix(512,A);
% A = denoising_dwt(A);
[M,N] = size(A);

MV = max(max(A));
noiselevel = 1;

%Ex = A
%A = upward_operator(A,dx,dy,h,'f');
noiselevel = noiselevel/100 * MV;

 A = A + noiselevel*randn(M,N);
%    A = denoising_dwt(A);

tic
[C,gap] = downward_iterative_operator_2013(A,dx,dy,h,'f',D);
toc

% C = cut(500,500,C);
myplot(C)
log10(gap)
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

'RMS'
sqrt(norm(C-D)/(512*512))
'RE2'
norm(C-D)/norm(D)
'REinf'
norm(C-D,inf)/norm(D,inf)

% myplot(cut(450,450,C))
figure(1)
myplot(C)
set(gca,'xticklabel',[1000:1000:5000])
set(gca,'yticklabel',[500:500:5000])
% title('Longitudinal section at y=500m');
ylabel('Northing (m)','fontsize',12,'fontweight','b');
xlabel('Easting (m)','fontsize',12,'fontweight','b');
% set (gca,'position',[0.13,0.12,0.7,0.8] );

h=colorbar;
set(get(h,'Title'),'string','nT','fontsize',12,'fontweight','b');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% plot %%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
myplot(C-D)
set(gca,'xticklabel',[1000:1000:5000])
set(gca,'yticklabel',[500:500:5000])
% title('Longitudinal section at y=500m');
ylabel('Northing (m)','fontsize',12,'fontweight','b');
xlabel('Easting (m)','fontsize',12,'fontweight','b');
% set (gca,'position',[0.13,0.12,0.7,0.8] );

h=colorbar;
set(get(h,'Title'),'string','nT','fontsize',12,'fontweight','b');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%