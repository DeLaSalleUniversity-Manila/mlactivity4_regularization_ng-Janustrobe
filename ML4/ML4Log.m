clear all; close all; clc

x = load('ex5Logx.dat'); 
y = load('ex5Logy.dat');

figure
pos = find(y); neg = find(y == 0);
plot(x(pos, 1), x(pos, 2), 'k+','LineWidth', 2, 'MarkerSize', 7)
hold on
plot(x(neg, 1), x(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)

x = map_feature(x(:,1), x(:,2));

[m, n] = size(x);

theta = zeros(n, 1);

g = inline('1.0 ./ (1.0 + exp(-z))'); 

MAX_ITR = 15;
J = zeros(MAX_ITR, 1);

lambda = 10;

% Newton's Method
for i = 1:MAX_ITR
    z = x * theta;
    h = g(z);
    
    J(i) =(1/m)*sum(-y.*log(h) - (1-y).*log(1-h))+ ...
    (lambda/(2*m))*norm(theta([2:end]))^2;
    
    G = (lambda/m).*theta; G(1) = 0;
    L = (lambda/m).*eye(n); L(1) = 0;
    grad = ((1/m).*x' * (h-y)) + G;
    H = ((1/m).*x' * diag(h) * diag(1-h) * x) + L;
    
    theta = theta - H\grad;
  
end
J
norm_theta = norm(theta) 
u = linspace(-1, 1.5, 200);
v = linspace(-1, 1.5, 200);

z = zeros(length(u), length(v));
for i = 1:length(u)
    for j = 1:length(v)
        z(i,j) = map_feature(u(i), v(j))*theta;
    end
end
z = z';

contour(u, v, z, [0, 0], 'LineWidth', 2)
legend('y = 1', 'y = 0', 'Decision boundary')
title(sprintf('\\lambda = %g', lambda), 'FontSize', 14)


hold off
