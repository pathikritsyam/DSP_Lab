range=[8,16,64];
for i=1:3
   n = -range(i):range(i)-1; % Define the range of n
   figure(i)
   h = sin(0.5 * pi * n) ./ (pi * n) .* (n ~= 0); % Define the impulse response
   h(n==0)=0.5;
   subplot(311)
   stem(n,h)
   grid on
   title("Signal h(n) vs n plot")
   subplot(3,1,2)
   H = fft(h, 512); % Compute the FFT of the impulse response
   % Plot the magnitude response
   plot(linspace(-0.5, 0.5, 512), 20 * log10(abs(fftshift(H))));
   xlabel('Normalized Frequency (cycles/sample)');
   ylabel('Magnitude (dB)');
   title('Magnitude Response of the Discrete-Time System');
   grid on;
   % Plot the phase response
   subplot(3,1,3)
   plot(linspace(-0.5, 0.5, 512), angle(fftshift(H)));
   xlabel('Normalized Frequency (cycles/sample)');
   ylabel('Phase (radians)');
   title('Phase Response of the Discrete-Time System');
   grid on;
end