clc;
clear all;
close all;
warning off;
Wn=[2500 3000];
fs=8000;
f=fs/2;
M=[21 41];
Wn=Wn/f;
WIN='Rectangular';
figure;
for n=1:2
    window=rectwin(M(n));%hamming(n),hanning(n),blackman(n)
    h=fir1(M(n)-1,Wn,"bandpass",window);
    [H,w]=freqz(h);
    subplot(2,2,2*n-1);
    plot(w/pi,abs(H));
    ylabel('Magnitude');
    xlabel('Frequency');
    title(['Magnitude response of ',WIN,' Window of order= ',n]);
    subplot(2,2,2*n);
    plot(w/pi,angle(H));
    ylabel('Phase');
    xlabel('Frequency');
    title(['Phase response of ',WIN,' Window of order= ',n]);
    clear h H w;
end
