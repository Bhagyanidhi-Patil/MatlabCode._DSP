%circular convolution using linear convolution 

x1=input('Enter the first sequence');
x2=input('Enter the second sequence');
N1=length(x1);
N2=length(x2);

N=N1+N2-1;
p=N-N1+1;
y=conv(x1,x2);
disp(y);

z=zeros(1,N1);
for m=p-1:N1-1
    z(m+1)=y(m+1);
end

for n=0:p-2
    z(n+1)=y(n+1)+y(N+n-2);
end

disp(z);
