function t = fcolrow(m,n,scale,dx,dy,h)
m1 = 2*m; n1 = 2*n;
t = zeros(m1,n1);
for i = 0:m-1
    for j = 0:n-1
        t(i+1,j+1) = kern(-i,-j,scale,dx,dy,h);
    end
end

for i = m+1:m1-1
    for j = 0:n-1
        t(i+1,j+1) = kern(m1-i,-j,scale,dx,dy,h);
    end
end

for i = 0:m-1
    for j = n+1:n1-1
        t(i+1,j+1) = kern(-i,n1-j,scale,dx,dy,h);
    end
end

for i = m+1:m1-1
    for j = n+1:n1-1
        t(i+1,j+1) = kern(m1-i,n1-j,scale,dx,dy,h);
    end
end

t = t.';