clc;
clear all;
close all;
warning off;
perLine = 14;
fmt = [repmat('%8.4f ', 1, perLine), '\n'];
i=1; 
figure;
for n=[21,41] 
    flo=2500; 
    fhi=3000; 
    fs=8000; 
    nr=fs/2; 
    f=[0 flo/nr-0.1 flo/nr fhi/nr fhi/nr+0.1 1]; 
    m=[0 0 1 1 0 0]; 
    b=fir2(n-1,f,m);
    fprintf('1 x ');
    fprintf(string(n));
    fprintf('\n');
    fprintf(fmt, b);
    if mod( length(b), perLine) ~= 0; fprintf('\n'); end
    [h,w]=freqz(b);  
    subplot(2,2,i); 
    i=i+1;
    plot(w/pi,abs(h)); 
    title(["Magnitude response for filter of length ",n]); 
    subplot(2,2,i); 
    plot(w/pi, angle(h)); 
    title(["Phase response for filter of length ",n]); 
    i=i+1; 
end 
