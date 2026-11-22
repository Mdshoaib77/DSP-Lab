clc;
clear;
close all;

Fs = 1000;
T = 1;
N = Fs*T;

t = (0:N-1)/Fs;

f1 = 50;
f2 = 120;

x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);

subplot(2,1,1);
plot(t,x);
xlabel('Time (second)');
ylabel('Amplitude');
title('Time Domain Signal');
grid on;

Y = fft(x);

P2 = abs(Y/N);
P1 = P2(1:N/2+1);

P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:N/2)/N;

subplot(2,1,2);
plot(f,P1);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Single-sided Amplitude Spectrum');
grid on;