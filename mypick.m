function B=mypick(A,m)
[n1,n2]=size(A);
n=n1/m;
B=zeros(n,n);
for p=1:n;
    for q=1:n;
        B(p,q)=A(p*m,q*m);
    end
end