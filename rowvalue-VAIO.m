function a = rowvalue(p,m,n,h,dx,dy)

[i, j] = findposition(p,m,n);

a = zeros(m*n,1);

iter = 1;
for CC = 1:n
    for RR = 1:m
%         CC
%         RR
%         i
%         j
        y = kernelvalue(i,j,RR,CC,h,dx,dy);
        a(iter) = y;
        iter = iter + 1;
    end
end

a = a';