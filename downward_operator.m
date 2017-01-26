function B = downward_operator(A,dx,dy,h,k)
% this is a single downward continuation based on the paper in 2013;
% if k = 'f', then use fft
% if k = 'b', then use BTTB
[m,n] = size(A);

Upward = upward_operator(A,dx,dy,h,k);
Upward = reshape(Upward, m, n);

temp1 = Second_derivative(A, 1);
temp2 = Second_derivative(A, 2);

C = (h^2)/(dx^2);
B = 2*A - Upward - temp1*C - temp2*C;