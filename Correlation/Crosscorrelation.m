clc;
close all;
clear all;
x=input('Enter the sequence 1: ');
y=input('Enter the sequence 2: ');
y=xcorr(x,y);
figure;
subplot(2,1,1);
stem(x);
ylabel('Amplitude->');
xlabel('n->');
title('Input sequence');
subplot(2,1,2);
stem(y);
ylabel('amplitude');
xlabel('n->');
title('Output sequence');
disp('the resultant is ');
disp(y)