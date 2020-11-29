clear all;
close all;
clc;

disp("MixRadix 6 point DIT-FFT 2x3");

x = input("Enter a sequence: ");
N = length(x);

X1 = zeros(3,1);
X2 = X1;

for k = 0:2
    for n = 0:2
        X1(k + 1) = X1(k + 1) + x((2 * n) + 1) * twiddleFactor(2*k*n, N);
        X2(k + 1) = X2(k + 1) + x((2 * n + 1) + 1) * twiddleFactor(2*k*n, N);
    end
end

outputStages = [X1; X2];

X = zeros(N, 1);
for k = 0:N-1
    X(k+1) = X1(mod(k,3) + 1) + X2(mod(k,3) + 1) * twiddleFactor(k,6);
end

outputStages = [outputStages X];

disp('Output of stages: ');
disp(outputStages);

disp("Final DFT using Mix Radix DIT FFT 2x3");
disp(X);

disp("DFT calculated using builtin-function: fft():")
disp(fft(x).');