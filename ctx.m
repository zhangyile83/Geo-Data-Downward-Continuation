function y = ctx(ev,d)

[n,m]=size(ev);
rex= reshape(d,n,m);
rex = fft2(rex);
rex = rex.*ev;
rex = ifft2(rex);
y = reshape(rex,n*m,1);