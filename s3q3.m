clc;
clear all;
close all;
warning off;
i=1; 
figure;
for n=[21,41] 
    fc=2000; 
    fs=8000; 
    nr=fs/2; 
    Wn=fc/nr; 
    f=Wn; 
    m=1; 
    b=fir2(n-1,f,m) 
    [h,w]=freqz(b); 
    subplot(2,2,i); 
    i=i+1;
    plot(w/pi,20*log10(abs(h))); 
    title(["Magnitude response for filter of length ",n]); 
    subplot(2,2,i); 
    i=i+1;
    plot(w/pi, angle(h)); 
    title(["Phase response for filter of length ",n]); 
end 
