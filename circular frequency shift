clear all;
close all;
clc

s = input("Enter the sequence: ");
m = input("Enter the number of shifts: ");

N = length(s);

n = 1:N;
k = n;
k1 = n - 1;
widthOfLine = 1;

x(n) = s;

DFT(k) = fft(x(n));
disp("Input Sequence:");
disp(s);
disp("DFT of the input sequence is:");
disp(DFT(k));

shiftedDFT(k) = fft(x(circshift(n, m)));
disp("Circularly Shifted Signal:");
disp(x(circshift(n, m)));
disp("DFT of circularly shifted signal:");
disp(shiftedDFT);

shiftedUsingProperty(k) = DFT * (exp(-i * 2 * pi * (k - 1) * m / N) .* eye(N));
disp("DFT of circularly shifted signal using property:");
disp(shiftedUsingProperty);

% DFT of signal

subplot(3, 2, 1);
localY = abs(DFT.');
stem(k1, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n) $$");
grid on;

subplot(3, 2, 2);
localY = angle(round(DFT.', 5)) * 180 / pi;
stem(k1, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n) $$");
grid on;

% DFT of shifted signal

subplot(3, 2, 3);
localY = abs(shiftedDFT.');
stem(k1, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n+m) $$");
grid on;

subplot(3, 2, 4);
localY = angle(round(shiftedDFT.', 5)) * 180 / pi;
stem(k1, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n+m) $$");
grid on;

% DFT of shifted signal using property

subplot(3, 2, 5);
localY = abs(shiftedUsingProperty.');
stem(k1, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n+m) $$ using property");
grid on;

subplot(3, 2, 6);
localY = angle(round(shiftedUsingProperty.', 5)) * 180 / pi;
stem(k1, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n+m) $$ using property");
grid on;
