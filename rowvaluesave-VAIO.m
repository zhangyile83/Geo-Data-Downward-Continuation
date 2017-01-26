M = 512; 
N = 512;
scale = 8;
m = M/scale;
n = N/scale;
dx = 5100*scale/511;
dy = 5100*scale/511;
h = 200;
tic;
for p = 1:m*n
    a = rowvalue(p,m,n,h,dx,dy);
    filename = ['C:\Users\User\OneDrive\Documents\Codes\Downward_Continuation\Denoise_downward\Row Value\',num2str(p)];
    save(filename,'a');
end
toc;