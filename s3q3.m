clc;
clear all;
close all;
warning off;
perLine = 14;
fmt = [repmat('%8.4f ', 1, perLine), '\n'];
i=1; 
figure;
for n=[21,41] 
    fc=2000; 
    fs=8000; 
    nr=fs/2; 
    Wn=fc/nr; 
    f=[0 Wn Wn 1]; 
    m=[1 1 0 0]; 
    b=fir2(n-1,f,m);
    fprintf('1 x ');
    fprintf(string(n));
    fprintf('\n');
    fprintf(fmt, b);
    if mod( length(b), perLine) ~= 0; fprintf('\n'); end
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
