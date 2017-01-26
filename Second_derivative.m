function B = Second_derivative(A, d)
% if d = 1, then the derivative is taken vertically
% if d = 2, then the derivative is taken horizontally
[m,n] = size(A);

if d == 1;
A1 = diff(A,2,1);
% upd = 3*A(1,:) - 4*A(2,:) + A(3,:);
upd = A1(1,:);
% downd = 3*A(m,:) - 4*A(m-1,:) + A(m-2,:);
downd = A1(m-2,:);
B = [upd;A1;downd];
else if d == 2;
    A1 = diff(A,2,2);
%     leftd = 3*A(:,1) - 4*A(:,2) + A(:,3);
%     rightd = 3*A(:,n) - 4*A(:,n-1) + A(:,n-2);
    leftd = A1(:,1);
    rightd = A1(:,n-2);
    B = [leftd,A1,rightd];
    end
end
    
