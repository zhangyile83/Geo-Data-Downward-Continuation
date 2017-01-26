clear

h = 200;
noiselevel = 2.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load h250;
% load h50;
% dx= 5100/511;
% dy = 5100/511;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('mag2_0_Exact.mat')
load('mag2_h200.mat')
dx= 10;
dy = 10;
%%%%%%%%%%%%%%%%%%%%%%%



x = dx;
y = dy;
A = A/2/pi;
% D = D/2/pi;
[M,N] = size(A);
% alpha = 0.0004;
alpha =  0.0157;
% alpha = 0.08



% Two dimensional upward continuation
% format long
T = reshape(A,M,N);

MV = max(max(T));
noiselevel = noiselevel/100 * MV;
T = T + noiselevel*randn(M,N,1);

xstep=x;
ystep=y;
% % % %--------------

% % % %determining the wavenumber kx and ky

if mod(M,2)==0

    temp1=M/2-1;

    temp2=(temp1+1):(M-1);

    temp2=temp2-M;

    kx=[0:temp1,temp2];

else

    temp1=(M-1)/2;

    temp2=(temp1+1):(M-1);

    temp2=temp2-M;

    kx=[0:temp1,temp2];

end

kx=kx*2*pi/(M)/xstep;

if mod(N,2)==0

    temp1=N/2-1;

    temp2=(temp1+1):(N-1);

    temp2=temp2-N;

    ky=[0:temp1,temp2];

else

    temp1=(N-1)/2;

    temp2=(temp1+1):(N-1);

    temp2=temp2-N;

    ky=[0:temp1,temp2];

end

ky=ky*2*pi/(N)/ystep;


% kx1 = mod( 1/2 + (0:(M-1))/M , 1 ) - 1/2;
% ky1 = mod( 1/2 + (0:(N-1))/N , 1 ) - 1/2;
% kx = kx1*(2*pi/xstep);
% ky = ky1*(2*pi/ystep);
[kx,ky]=meshgrid(kx,ky);
% kx=fftshift(kx);
% ky=fftshift(ky);

% k=zeros(N,M);
% for m=1:M
%     for n=1:N
%         k(n,m)=sqrt(kx(n,m)^2+ky(n,m)^2);
%     end
% end
k=sqrt(kx.^2+ky.^2);

for i=1:M
    for j=1:N
        if k(j,i)==0
            k(j,i)=1e-6;
        end
    end
end
% % % % % % -------------------------------------

T1=fft(fft(T)')';
if mod(M,2)==0
    T1(:,M/2+1)=0;
end
if mod(N,2)==0
    T1(N/2+1,:)=0;
end


filter = exp(-h*k)./(exp(-2*h*k) + alpha);
T11 = T1.*filter;

R1 = T1 - T11.*exp(-h.*k);

for i = 1:2
    
T2 = T11 + R1.*exp(-h*k)./(exp(-2*h*k) + alpha*2^i);
R1 = T1 - T2.*exp(-h.*k);
T11 = T2;
end

Thx=ifft(ifft(T11')')';
Thx = real(Thx);
Thx = Thx';
Thx = reshape(Thx, N*M, 1);

% Thy=ifft(ifft(T3')')';
K = reshape(Thx, 512, 512);
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

myplot(mycut(40, reshape(Thx, 512, 512)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set(gca,'xticklabel',[1000:1000:5000])
set(gca,'xticklabel',[500:500:5000])
set(gca,'yticklabel',[500:500:5000])
% title('Longitudinal section at y=500m');
ylabel('Northing (m)','fontsize',12,'fontweight','b');
xlabel('Easting (m)','fontsize',12,'fontweight','b');
% set (gca,'position',[0.13,0.12,0.7,0.8] );

h=colorbar;
set(get(h,'Title'),'string','nT','fontsize',12,'fontweight','b');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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