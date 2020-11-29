clear all;
close all;
clc;

disp("MixRadix 6 point DIT-FFT 3x2");

x = input("Enter a 6 point sequence: ");
N = length(x);

X1(1) = x(1) + x(4);
X1(2) = x(1) - x(4);
X2(1) = x(2) + x(5);
X2(2) = x(2) - x(5);
X3(1) = x(3) + x(6);
X3(2) = x(3) - x(6);

outputStages = [X1.'; X2.'; X3.'];
X = zeros(N, 1);

for k = 0:N - 1
    l = mod(k, 2) + 1;
    X(k + 1) = X1(l) + X2(l) * twiddleFactor(k, N) + X3(l) * twiddleFactor(2 * k, N);
end

outputStages = [outputStages X];

disp('Output of stages: ');
disp(outputStages);

disp("Final DFT using Mix Radix DIT FFT 3x2");
disp(X);

disp("DFT calculated using builtin-function: fft():")
disp(fft(x).');
