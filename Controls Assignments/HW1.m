% BE 404 HW 1
% Stefan Lütschg
%% Problem 3 Part D
clear,clc,close all
numerator = [3 22];
denominator = [1 12 20];
H = tf(numerator,denominator);
t = 0:0.1:3;
y = impulse(H,t);
plot(t,y,'LineWidth',2);
xlabel('t','FontSize',20);
ylabel('y(t)','FontSize',20);
grid on;
ax = gca;
ax.FontSize = 20;