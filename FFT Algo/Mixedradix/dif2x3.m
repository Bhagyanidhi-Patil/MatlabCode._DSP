clc;
clear all;
close all;

disp("MixRadix N=6 point DIF-FFT 2x3");

x = input("Enter 6 point sequence: ");
N = length(x);
X = zeros(1,N);
for k = 0:2
    for n = 0:2
        X(2*k + 1) = X(2*k + 1) + (x(n+1)+x(n+4)) * twiddleFactor(2*k*n, N);
    end
end
disp(X);
for k=0:2
    for n=0:2
        
        X(2*k + 2) = X(2*k + 2) + (x(n+1)-x(n+4)) * twiddleFactor(2*k*n, N)*twiddleFactor(n, N);
    end
end

disp("Final DFT of x(n) using Mix Radix DIF FFT 2x3");
disp(X);

disp("DFT of x(n) calculated using builtin-function: fft():")
disp(fft(x));