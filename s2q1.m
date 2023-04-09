clc ;
close all;
clear all;
warning off;
w=0:0.01:2*pi;
A=1;
a=A*ones(1,10);
b=ones(1);
h=freqz(a,b,w);
figure;
subplot(4,2,1);
plot(w/pi,abs(h));
ylabel('Magnitude');
subplot(4,2,2);
plot(w/pi,angle(h));
ylabel('Phase');
N=[10 100 256];
c=3;
for i=1:length(N)
    k=0:N(i)-1;
    x=fft(a,N(i));
    subplot(4,2,c);
    c=c+1;
    stem(k,abs(x));
    ylabel('Magnitude');
    subplot(4,2,c);
    c=c+1;
    stem(k,angle(x));
    ylabel('Phase');
    clear k x;
end

