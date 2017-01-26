clear all; close all; clc

% Main function
% Usage :
%        main_dtdwt
% INPUT :
%        Raw Lena image
% OUTPUT :
%        PSNR value of the denoised image
%
% Load clean image
load Exact1;
s = Ex;
N = 512;

% Noise variance
sigma_n = 3;
n = sigma_n*randn(N);

% Add noise 
x = s + n;

% Run local adaptive image denoising algorithm using dual-tree DWT. 
y = denoising_dtdwt(x);

subplot 131, imagesc(s), axis image;
subplot 132, imagesc(x), axis image;
subplot 133, imagesc(y), axis image;


% Calculate the error 
err = s - y;

% Calculate the PSNR value
PSNR = 20*log10(256/std(err(:)))