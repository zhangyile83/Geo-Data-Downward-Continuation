function [x1,y1,z1,B]= Pick_data(A,dx,dy)
[ny, nx] = size(A);
rho = 2;

B = zeros(ny,nx);

    for i = 1:ny
        for j = 1:nx
            if mod(j,dx) == 0 && mod(i,dy) == 0
%s                [m,n] = ShakeBox(i,j,nx,ny,rho);
                B(i,j) = 1;
            end
        end
    end

[x1,y1]=find(B==1);

n=length(x1);
%disp(n);
%pause;
z1=zeros(1,n);
for i=1:n
    z1(i)=A(x1(i),y1(i));
%    plot3(x1(i),y1(i),1);
%    hold on
    %disp(i);
end