function myplot(A)
% [m,n]=size(A);
% if m==n
% else
%     A=reshape(A,sqrt(m),sqrt(m));
% end
pcolor(A);shading flat;
colorbar('eastoutside');