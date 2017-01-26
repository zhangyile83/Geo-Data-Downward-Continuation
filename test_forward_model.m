% This code is written for test the forward model

clear
close all

load('Exact1.mat');
load('data_250_1.mat');

[m,n] = size(A);

i = 1;

for h = 100:100:1000
    
    b = Forward(Ex,h);
    eval(['A',num2str(i),'= b;']);
    eval(['A',num2str(i),'= reshape(','A',num2str(i),',m,n);']);
    eval(['[x',num2str(i),',y',num2str(i),',z',num2str(i),',B',num2str(i),'] = Pick_data(A', num2str(i),',  5,25)']);

    i = i + 1
end
