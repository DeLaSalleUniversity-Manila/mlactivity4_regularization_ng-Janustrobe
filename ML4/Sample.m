clear all; close all;


clear all; close all; clc
x = load('ex5linx.dat'); 
y = load('ex5liny.dat');

m = length(y); 

figure; plot(x, y, 'o', 'MarkerFacecolor', 'r', 'MarkerSize', 8);
