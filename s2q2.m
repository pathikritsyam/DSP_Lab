clc;
clear all;
close all;
warning off;
n=-8:7;
n2=-16:15;
n3=-64:63;
c=1;
for i=0:2
    N=length(n(i+1));
    h=sin(0.5*pi*n)./(pi*n);
    h(length(n)/2+1)=0.5;
    H=fftshift(fft(h));
    subplot(3,3,c);
    c=c+1;
    stem(n,h);
    ylabel("h(n)");
    subplot(3,3,c);
    c=c+1;
    stem(n,abs(H));
    ylabel("Magnitude");
    subplot(3,3,c);
    c=c+1;
    plot(n,angle(H));
    ylabel("Magnitude");
    clear N h H;
    if(i==0)
        n=n2;
    else 
        n=n3;
    end
end