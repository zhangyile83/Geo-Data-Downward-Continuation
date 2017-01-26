function B = mycut(p,A)
[m,n] = size(A);


B = A(p + 1:m-p,p + 1:n-p);