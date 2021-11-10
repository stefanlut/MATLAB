%BE 404 HW 4
%% Problem 1
clear, close all, clc
G = tf([20],[1 12 22 20]);
[Y,T] = step(G);
plot(T,Y,'LineWidth',2);
ax = gca;
ax.FontSize = 20;
title('Problem 1c Step Response','FontSize',20);
xlabel('Time (seconds)','FontSize',20);
ylabel('Amplitude','FontSize',20);
grid on;

%% Problem 2
clear,close all,clc
alpha = 5; % good approximation
G1 = tf(2*alpha,[1 2+alpha 2+2*alpha 2+alpha]);
G2 = tf(2*alpha,[1 2 2]);
[Y1,T1] = step(G1);
[Y2,T2] = step(G2);
plot(T1,Y1,'r','LineWidth',2);
hold on;
plot(T2,Y2,'b','LineWidth',2);
title(['$$\alpha = $$' num2str(alpha) ' Step Response'],'interpreter','latex','FontSize',20);
xlabel('Time (seconds)','FontSize',20);
ylabel('Amplitude','FontSize',20);
legend('G(s)','G2(s)','FontSize',20);
grid on;
% good approximation is alpha> 5
%% Problem 3
clear, close all, clc
figure;
    z = 1;
    G = tf([24 24*z],[z 10*z 24*z]);
    [Y,T] = step(G);
    plot(T,Y,'LineWidth',2)
    hold on;
for i = 2:6
    z = i;
    G = tf([24 24*z],[z 10*z 24*z]);
    [Y,T] = step(G);
    plot(T,Y,'LineWidth',2)
end
legend('z = 1','z = 2','z = 3','z = 4','z = 5','z = 6');
grid on;
ax = gca;
ax.FontSize = 20;
title('Problem 3d Step Response','FontSize',20);
xlabel('Time (seconds)','FontSize',20);
ylabel('Amplitude','FontSize',20);
% Problem 3e
figure;
z = -1;
G = tf([24 24*z],[z 10*z 24*z]);
    [Y,T] = step(G);
    plot(T,Y,'LineWidth',2)
    grid on;
ax = gca;
ax.FontSize = 20;
title('Step Response at z = -1 (Problem 3e)','FontSize',20);
xlabel('Time (seconds)','FontSize',20);
ylabel('Amplitude','FontSize',20);