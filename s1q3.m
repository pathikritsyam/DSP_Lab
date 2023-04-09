clc;
clear all;
close all;
warning off;
n=0:1:50;
a=100;
x=a*ones(size(n)+1);
y=zeros(size(n)+1);
y(1)=1;
for i=2:51
    y(i)=0.5*(y(i-1)+x(i)./y(i-1));
end
figure(1);
stem(n,x(2:52),'linewidth',2);
figure(2);
stem(n,y(2:52),'linewidth',2);
