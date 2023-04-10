clc;
clear all;
close all;
warning off;
%Moving average filter
n=0:1:100;
s=2*n.*((0.9).^n);
d=-0.5+rand(1,length(n));
x=s+d;
M=5; %size of moving average filter , also check for values 7 and 9
t=ones(1,M);
num=(1/M)*t;
den=[1];
y=filter(num,den,x);
stem(x,'filled');
hold on;
plot(y,'r','linewidth',2);
ylabel('x[n]');
xlabel('n');