function B = upward_operator(T,dx,dy,h,k)
%The input u is a matrix containing the original data

[M,N] = size(T);

if k == 'b'
u = reshape(T,M*N,1);
t = fcolrow(M,N,1,dx,dy,h);
tev = gentev(t);
B = 1/(2*pi)*tx (tev, u);
B = reshape(B, M, N);
else if k == 'f'
xstep=dx;
ystep=dy;
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
T2=T1.*exp(-k*h);
% T2=(-1i*kx./k).*T1.*exp(-k*h);
% T3=(-1i*ky./k).*T1.*exp(-k*h);

Thx=ifft(ifft(T2')')';
Thx = real(Thx);
B = Thx';
    end
end
        