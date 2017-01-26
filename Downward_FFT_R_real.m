clear
% this temp file is used to test direct frequency domain downward continuation
% using the Tikhnov regularization 
% load h200;
% load Exact;
%%%%%%%%%%%%%%%%%%%%%%
% load h250;
% load h50;
% dx= 5100/511;
% dy = 5100/511;
%%%%%%%%%%%%%%%%%%%%%%
load('mag2_0_Exact.mat')
load('mag2_h200.mat')
dx= 10;
dy = 10;


noiselevel= 2.5;


A = A/(2*pi);
% D = D/(2*pi);
% load mag2_h200;
% load h_200_Exact

MV = max(max(A));



% dx = 10;
% dy = 10;

h = 200;

[M,N] = size(A);
alpha = 600;

noiselevel = noiselevel/100 * MV;
A = A + noiselevel*randn(M,N,1);

[Thx] = Downward_Direct(dx,dy,A,-h,M,N,alpha);

B = reshape(Thx, 512, 512);
B1 = B(1+12:512-12,1+12:512-12);
figure(1);
myplot(mycut(40,B));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set(gca,'xticklabel',[1000:1000:5000])

set(gca,'xticklabel',[500:500:5000])
set(gca,'yticklabel',[500:500:5000])
% title('Longitudinal section at y=500m');
ylabel('Northing (m)','fontsize',12,'fontweight','b');
xlabel('Easting (m)','fontsize',12,'fontweight','b');
% set (gca,'position',[0.13,0.12,0.7,0.8] );

h=colorbar;
set(get(h,'Title'),'string','nT','fontsize',12,'fontweight','b');
K = B;


% 'RMS'
% sqrt(norm(K-D)/(512*512))
% 'RE2'
% norm(K-D)/norm(D)
% 'REinf'
% norm(K-D,inf)/norm(D,inf)

'RMS'
sqrt(norm(mycut(40,K-D))/(432*432))
'RE2'
norm(mycut(40,K-D))/norm(mycut(40,D))
'REinf'
norm(mycut(40,K-D),inf)/norm(mycut(40,D),inf)

figure(2)
myplot(mycut(40,K-D))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set(gca,'xticklabel',[1000:1000:5000])
set(gca,'xticklabel',[500:500:5000])
set(gca,'yticklabel',[500:500:5000])
% title('Longitudinal section at y=500m');
ylabel('Northing (m)','fontsize',12,'fontweight','b');
xlabel('Easting (m)','fontsize',12,'fontweight','b');
% set (gca,'position',[0.13,0.12,0.7,0.8] );

h=colorbar;
set(get(h,'Title'),'string','nT','fontsize',12,'fontweight','b');
