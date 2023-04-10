clc;
close all;
clear all;
warning off;
load train.mat;
audiowrite("train.wav",y,Fs);
clear y Fs;
[x,Fs]=audioread("train.wav");
for i=1:50
    b(i)=i;
    del=(max(x)-min(x))/(2^i);
    q=round(x/del)*del;
    n=rms(x-q)^2;
    s=rms(x)^2;
    snrq(i)=10*log10(s/n);
end
subplot(1,2,1);
plot(x); 
title('Original speech signal');xlabel('Time');ylabel('Audio Signal');
subplot(1,2,2);
plot(b,snrq,'LineWidth',2);
title('SQNR versus bits per sample.'); 
xlabel('Bits per sample.'); 
ylabel('SQNR(dB).');