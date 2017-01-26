clear
hold on
n = 200
alphatemp = 0:1:1000;
load('RMS0.mat')
plot(alphatemp(n:end), log10(RMS(n:end)),'r','LineWidth',3)
load('RMS2.mat')
plot(alphatemp(n:end), log10(RMS(n:end)),'g','LineWidth',3)
load('RMS4.mat')
plot(alphatemp(n:end), log10(RMS(n:end)),'b','LineWidth',3)
 legend('0% noise', '2% noise', '4% noise')
 xlabel('Regularization parameter \mu');
 ylabel('log_{10}(RMS error)');