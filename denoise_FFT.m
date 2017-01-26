function B = denoise_FFT(A)
[m,n]=size(A);

w = 5;

s=fft2(A);
cutfun=ones(m,n);
cutfun(w:m-w-1,w:n-w-1)=0;%
ss=s.*cutfun;
%s(find(s>14))=0;% problem is how to decide the threshold
f=ifft2(ss);
B = real(f);