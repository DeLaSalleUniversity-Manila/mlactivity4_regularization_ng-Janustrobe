clear all; close all;

clear all; close all; clc
x = load('ex5Linx.dat'); y = load('ex5Liny.dat');

m = length(y);
figure;
plot(x, y, 'o', 'MarkerFacecolor', 'r', 'MarkerSize', 8);

x = [ones(m, 1), x, x.^2, x.^3, x.^4, x.^5];
theta = zeros(size(x(1,:)))';
lambda = 0;

L = lambda.*eye(6);
L(1) = 0;
theta = (x' * x + L)\x' * y
norm_theta = norm(theta)

hold on;
x_vals = (-1:0.05:1)';
features = [ones(size(x_vals)), x_vals, x_vals.^2, x_vals.^3,...
          x_vals.^4, x_vals.^5];
plot(x_vals, features*theta, '--', 'LineWidth', 2)
legend('Training data', '5th order fit')
hold off


