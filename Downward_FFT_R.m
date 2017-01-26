clear
% this temp file is used to test direct frequency domain downward continuation
% using the Tikhnov regularization 
% load h200;
% load Exact;
%%%%%%%%%%%%%%%%%%%%%%
load h250;
load h50;
dx= 5100/511;
dy = 5100/511;
%%%%%%%%%%%%%%%%%%%%%%




noiselevel= 10;


A = A/(2*pi);
D = D/(2*pi);
% load mag2_h200;
% load h_200_Exact

MV = max(max(A));



% dx = 10;
% dy = 10;

h = 200;

[M,N] = size(A);
alpha = 517;

noiselevel = noiselevel/100 * MV;
A = A + noiselevel*randn(M,N,1);

tic
[Thx] = Downward_Direct(dx,dy,A,-h,M,N,alpha);
toc

B = reshape(Thx, 512, 512);
B1 = B(1+12:512-12,1+12:512-12);
figure(1);
myplot(B);
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



figure(2);
myplot(B-D);

K = B;


'RMS'
sqrt(norm(K-D)/(512*512))
'RE2'
norm(K-D)/norm(D)
'REinf'
norm(K-D,inf)/norm(D,inf)

% sqrt(norm(B-X)/(M*N))

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