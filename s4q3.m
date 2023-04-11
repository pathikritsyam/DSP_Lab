% Input parameters
FS = 80e3; % Sampling frequency (Hz)
FP = 4e3; % Pass-band edge frequency (Hz)
FSB = 20e3; % Stop-band edge frequency (Hz)
DELTAP = 0.5; % Maximum pass-band ripple (dB)
DELTAS = 45; % Minimum stop-band attenuation (dB)

% Determine the order of the analog prototype filter
wp = 2*pi*FP/FS; % Pass-band edge frequency (rad/s)
ws = 2*pi*FSB/FS; % Stop-band edge frequency (rad/s)
[n, wn] = buttord(wp, ws, DELTAP, DELTAS, 's');

% Design the analog prototype filter
[b, a] = butter(n, wn, 's');

% Perform bilinear transformation
[num, den] = bilinear(b, a, FS);

% Plot the gain response of the designed filter
f = 0:0.1:FS/2; % Frequency vector (Hz)
w = 2*pi*f/FS; % Frequency vector (rad/s)
[h, w] = freqz(num, den, w);
gain = 20*log10(abs(h));
phase = angle(h);
subplot(2,1,1);
plot(f, gain);
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
title('Butterworth Low-Pass Filter - Gain Response (Bilinear Transformation)');
grid on;

% Plot the phase response of the designed filter
subplot(2,1,2);
plot(f, phase);
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');
title('Butterworth Low-Pass Filter - Phase Response (Bilinear Transformation)');
grid on;
