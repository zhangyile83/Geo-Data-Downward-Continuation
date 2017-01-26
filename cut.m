function B = cut(p,q,A)
[m,n] = size(A);

templr = (m - p)/2;
tempud = (n - q)/2;

B = A(templr + 1:m-templr,tempud + 1:n-tempud);