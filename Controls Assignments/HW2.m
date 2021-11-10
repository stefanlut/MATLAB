% Homework 2 
% Stefan Lütschg
%% Problem 1
clear,clc, close all
H = tf([1],[10 20 50]);
% Problem 1c
subplot(311);
impulse(H);
grid on;
ax = gca;
ax.FontSize = 20;
% Problem 1d
subplot(312);
step(5*H);
grid on;
ax = gca;
ax.FontSize = 20;
% Problem 1e
subplot(313);
t = 0:0.01:10;
fx = sin(t);
Y = lsim(H,fx,t);
plot(t,Y);
title('Response to sinusoid','FontSize',20);
ylabel('Amplitude','FontSize',20);
xlabel('Time (seconds)','FontSize',20);
grid on;
ax = gca;
ax.FontSize = 20;

%% Problem 4
clear,clc,close all
H = tf([1 1],[1 3 3]);
t = 0:0.01:30;
v = sin(t);
I = lsim(H,v,t);
plot(t,I,'LineWidth',2);
xlabel('Time (seconds)','FontSize',20);
ylabel('Current (Amps)','FontSize',20);
title('Circuit Response to Sinusoid','FontSize',20);
grid on;
ax = gca;
ax.FontSize = 20;