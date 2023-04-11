x_n = [2 5 -10 4 9];
h_n = [1 4 -2 7 -6];
n = 1:5;
subplot(2,1,1);
stem(n,x_n,'LineWidth',2,'Color','k');
title("First function")
subplot(2,1,2);
stem(n,h_n,'LineWidth',2,'Color','k');
title("Second function")
N=2^nextpow2(max([length(x_n) length(h_n)]));   %gives the closest power of 2 
f_h=[x_n zeros(1,1+N-length(x_n))]; %giving zero padding for FFT
g_h=[h_n zeros(1,1+N-length(h_n))]; %same
dirconv=conv(x_n,h_n);
dftconv=ifft(fft(f_h).*fft(g_h));
figure;
subplot(2,1,1);
stem(dftconv,'LineWidth',2,'Color','k');
title('Convolution of f and g by DFT method')
subplot(2,1,2);
stem(dirconv,'LineWidth',2,'Color','k');
title('Direct Linear Convolution of f and g')