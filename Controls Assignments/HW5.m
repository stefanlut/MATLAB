%% Problem 1
clear, clc, close all

subplot(211);
P = tf(1,[1 1 4]);
[Y,T1] = step(P);
plot(T1,Y,'LineWidth',2);
grid on;
title('Problem 1d: Step Response of Plant without Feedback','FontSize',14);
xlabel('Time (s)','FontSize',14);
ylabel('Amplitude','FontSize',14);
ax = gca;
ax.FontSize = 14;
subplot(212);
k = (16/15)*pi^2 - 4;
H = tf(k,[1 1 4 + k]);
[Y,T1] = step(H);
plot(T1,Y,'LineWidth',2);
grid on;
title(['Problem 1d: Step Response of Plant with Feedback and controller k = ' num2str(k)],'FontSize',14);
xlabel('Time (s)','FontSize',14);
ylabel('Amplitude','FontSize',14);
ax = gca;
ax.FontSize = 14;
%% Problem 4
clear,clc,close all

H1 = tf(25,[1 1 25]);
[Y1,T1] = step(H1);
plot(T1,Y1,'LineWidth',2);
grid on;
title('Problem 4c: Step Response of Position Control System','FontSize',14);
xlabel('Time (s)','FontSize',14);
ylabel('Amplitude','FontSize',14);
ax = gca;
ax.FontSize = 14;
hold on;

alpha = 48.39;
beta = 0.59;
H2 = tf(25*alpha,[1 (1+(25*beta)) 25*alpha]);
[Y2,T2] = step(H2);
plot(T2,Y2,'LineWidth',2);
grid on;
title('Problem 4c: Step Response of Position Control with Tachometer System','FontSize',14);
xlabel('Time (s)','FontSize',14);
ylabel('Amplitude','FontSize',14);
ax = gca;
ax.FontSize = 14;
