function [u,e,gap]=CG_FFT(b,ig,h,tol,M,N,dx,dy,X)

[m,n] = size(b);

mmax= 8;

u=ig;

r = b - tx_FFT(dx,dy,u,h,M,N);

p = r;
gap(1) = norm(reshape(u,512,512)-X,inf)/norm(X,inf);
e(1)=norm(r,inf);
iter=1;
n=length(b);

while iter < mmax && e(iter)/e(1)>tol,
    temp = tx_FFT(dx,dy,p,h,M,N);
 %  temp=tx(tev,temp);
    temp1=p'*temp;
    alpha=r'*p/temp1;
    u=u+alpha*p;
    r=r-alpha*temp;
    p=r-((r'*temp)/temp1)*p;
  %  max(abs(p))
   % p=p+randn(n,1);
    iter=iter+1
    e(iter)=norm(r,inf);
    e(iter)/e(1)
    gap(iter) = norm(reshape(u,512,512)-X,inf)/norm(X,inf);

    myplot(reshape(u,M,N));
    %pause(0.5)
end
