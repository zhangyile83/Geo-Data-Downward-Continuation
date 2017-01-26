function y = kern(k,j,scale,dx,dy,h)
dx= dx*scale;
dy = dy*scale;
%dx= (649290-640570)/437;
%dy = (9349440-9335420)/702;
y = dx*dy*h/((k*dx)^2+(j*dy)^2+h^2)^1.5;