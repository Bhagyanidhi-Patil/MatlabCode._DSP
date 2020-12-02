clear all;
close all;
clc;

disp("MixRadix N=6 point DIF-FFT 3x2");

x = input("Enter 6 point sequence: ");
N = length(x);
X = zeros(1,N);

for k=0:1
    for n=0:1
         X(3*k + 1) = X(3*k + 1) + (x(n+1)+x(n+3)+x(n+5)) * twiddleFactor(3*k*n, N);
    end
end

for k=0:1
    for n=0:1
        
         X(3*k + 2) = X(3*k + 2) + (x(n+1)+twiddleFactor(2, N)*x(n+3)+twiddleFactor(4, N)*x(n+5)) * twiddleFactor(3*k*n, N)*twiddleFactor(n, N);
    end
end

for k=0:1
    for n=0:1
         X(3*k + 3) = X(3*k + 3) + (x(n+1)+twiddleFactor(4, N)*x(n+3)+twiddleFactor(8, N)*x(n+5)) * twiddleFactor(3*k*n, N)*twiddleFactor(2*n, N);
    end
end

disp("Final DFT of x(n) using Mix Radix DIF FFT 3x2");
disp(X);

disp("DFT of x(n) calculated using builtin-function: fft():")
disp(fft(x));