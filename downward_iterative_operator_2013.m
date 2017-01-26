function [C,gap] = downward_iterative_operator_2013(A,dx,dy,h,k,X)

B = downward_operator(A,dx,dy,h,k);

% for i = 1:1
%     Dx = A - upward_operator(B,dx,dy,h,k);
%     D = downward_operator(Dx,dx,dy,h,k);
% 
%     C = B + D;
%     B = C;
% %     myplot(cut(450,450,B))
%     myplot(B);
%     gap(i) = norm(B-X,2)/norm(X)
%     pause(2)
%     i
% end
gap = [];
C = B;
