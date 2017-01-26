function B = extend_matrix(k,A)
[m,n] = size(A);
templr = (k - n)/2;
tempud = (k - m)/2;

Al = fliplr(A(:,1:templr));
Ar = fliplr(A(:,n - templr + 1:n));
Au = flipud(A(1:tempud,:));
Ad = flipud(A(m - tempud + 1:m,:));
Aclu = fliplr(flipud(A(1:tempud,1:templr)));
Acld = fliplr(flipud(A(m - tempud +1:m,1:templr)));
Acru = fliplr(flipud(A(1:tempud,n - tempud +1:n)));
Acrd = fliplr(flipud(A(m - tempud +1:m,n - tempud +1:n)));

 B = [Aclu, Au, Acru; Al, A, Ar; Acld, Ad, Acrd];