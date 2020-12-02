clear all;
close all;
clc;

disp("MixRadix 9 point DIT-FFT 3x3");


x=input("Enter 9 point sequence:");
N=length(x);

X1(1)=x(1)+x(4)+x(7);
X1(2)=x(1)+x(4)*twiddleFactor(3,9)+x(7)*twiddleFactor(6,9);
X1(3)=x(1)+x(4)*twiddleFactor(6,9)+x(7)*twiddleFactor(12,6);

X2(1)=x(2)+x(5)+x(8);
X2(2)=x(2)+x(5)*twiddleFactor(3,9)+x(8)*twiddleFactor(6,9);
X2(3)=x(2)+x(5)*twiddleFactor(6,9)+x(8)*twiddleFactor(12,6);

X3(1)=x(3)+x(6)+x(9);
X3(2)=x(3)+x(6)*twiddleFactor(3,9)+x(9)*twiddleFactor(6,9);
X3(3)=x(2)+x(6)*twiddleFactor(6,9)+x(9)*twiddleFactor(12,6);

outputStages = [X1.'; X2.'; X3.'];
X = zeros(N, 1);


for k = 0:N - 1
    l = mod(k, 2) + 1;
    X(k + 1) = X1(l) + X2(l) * twiddleFactor(k, N) + X3(l) * twiddleFactor(2 * k, N);
end

outputStages = [outputStages X];

disp('Output of stages: ');
disp(outputStages);

disp("Final DFT using Mix Radix DIT FFT 3x3");
disp(X);

disp("DFT calculated using builtin-function: fft():")
disp(fft(x).');

