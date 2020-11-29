%IDFT using DIT

clc;
clear all;
close all;
x=input('enter x[n]:');
N=length(x);
x=conj(x)
l1=nextpow2(N);          %it returns smallest power
xn=[x,zeros(1,(2^l1)-N)];
x=bitrevorder(xn)
N=length(xn);                      
tw=cos(2*pi*(1/N)*(0:N/2-1))-j*sin(2*pi*(1/N)*(0:N/2-1));
for l2=1:l1;               %for no of stages
    L=2^l2;
    twlvl=tw(1:N/L:N/2);      %twiddle factor for each level
    for k=0:L:N-L;           %for butterfly dig
        for n=0:L/2-1;
            A=x(n+k+1);
            B=x(n+k+(L/2)+1)*twlvl(n+1);
            x(n+k+1)=A+B;          %top node
            x(n+k+(L/2)+1)=A-B;    %bottom node
        end  
    end
    x
end
XK=conj(x)/N;
disp(XK);

