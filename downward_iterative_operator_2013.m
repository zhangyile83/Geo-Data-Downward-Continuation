function C = downward_iterative_operator_2013(A,dx,dy,h,k)

B = downward_operator(A,dx,dy,h,k);

for i = 1:100
    Dx = A - upward_operator(B,dx,dy,h,k);
    D = downward_operator(Dx,dx,dy,h,k);
    C = B + D;
    B = C;
    myplot(B)
    pause(2)
    i
end
