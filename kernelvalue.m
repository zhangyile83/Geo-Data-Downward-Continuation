function y = kernelvalue(i,j,m,n,h,dx,dy)

% m is the row number, n is the column number
% i is the row index, j is the column index

y = dx*dy*h/(((i-m)*dx)^2+((j-n)*dy)^2+h^2)^1.5;