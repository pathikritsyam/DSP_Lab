clc;
clear all;
close all;
warning off;
L=input("Enter the length:-"); 
A=input("Enter the amplitude:-"); 
w0=input("Enter the angular frequency:-"); 
phi=input("Enter the phase:-"); 
fs=20000; 
n=0:1/fs:L; 
x=A*cos(w0*n+phi); 
stem(n,x); 
title('Plot of the sinusoidal signal.'); 
xlabel("n"); 
ylabel("x[n]"); 
