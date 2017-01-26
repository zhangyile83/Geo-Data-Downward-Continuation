function [i, j] = findposition(k,m,n)
% m is the row number, n is the column number
% i is the row index, j is the column index

j = floor(k/m) + 1;
i = mod(k,m);
