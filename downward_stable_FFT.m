load('Exact1.mat');
gamma = 1/(2*pi);

dx = 5100/511;
dy = 5100/511;

h =  200

b200 = Forward_FFT(Ex,dx,dy,h);
b200 = reshape(b200, 512, 512);

b400 = Forward_FFT(b200,dx,dy,h);
b400 = reshape(b400, 512, 512);




dx= 5100/511;

temp1 = Second_derivative(b200, 1);

temp2 = Second_derivative(b200, 2);



C = (h^2)/(dx^2);
bE = 2*b200 - b400 - temp1*C - temp2*C;


figure(1)
myplot(bE)

figure(2)
myplot(Ex)

figure(3)
myplot(Ex - bE)