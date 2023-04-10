% Define the normalized cut-off frequency
wc = 0.45;

% Design a single-stage IIR low-pass filter using Butterworth design
[b1, a1] = butter(1, wc, 'low');

% Design a cascade of four first-order low-pass filters
[b2, a2] = butter(1, wc, 'low');
[b3, a3] = butter(1, wc, 'low');
[b4, a4] = butter(1, wc, 'low');
[b5, a5] = butter(1, wc, 'low');

% Compute the frequency response of the single-stage filter
[H1, w] = freqz(b1, a1);

% Compute the frequency response of the cascade of four filters
[H2, ~] = freqz(b2, a2);
[H3, ~] = freqz(b3, a3);
[H4, ~] = freqz(b4, a4);
[H5, ~] = freqz(b5, a5);

% Plot the gain responses
figure;
subplot(1,2,1);
plot(w/pi, abs(H1), 'b', 'LineWidth', 2);
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude');
legend('Single-stage realization');
title('Gain Responses of Low-Pass Filter');
grid on;
subplot(1,2,2);
plot(w/pi, abs(H2 .* H3 .* H4 .* H5), 'r', 'LineWidth', 2);
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude');
legend( 'Cascade of four first-order filters');
title('Gain Responses of Low-Pass Filter');
grid on;
