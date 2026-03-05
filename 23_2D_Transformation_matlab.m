2D Combined Transformations (T + R + S) matlab
clc;
clear;
close all;
% Original object (Triangle)
x = [1 4 2 1];
y = [1 1 3 1];
% Homogeneous coordinates
original = [x; y; ones(1,length(x))];
% -------------------------------
% 1 Scaling Parameters
sx = 1.5;
sy = 1.5;
S = [sx 0  0;
     0 sy 0;
     0  0 1];
% -------------------------------
% 2 Rotation Parameters
theta = 45;              % degrees
rad = deg2rad(theta);
R = [cos(rad) -sin(rad) 0;
     sin(rad)  cos(rad) 0;
     0         0        1];
% -------------------------------
% 3 Translation Parameters
tx = 3;
ty = 2;
T = [1 0 tx;
     0 1 ty;
     0 0 1];
% -------------------------------
% Combined Transformation Matrix
% Order: First Scale → Rotate → Translate
CTM = T * R * S;
% Apply transformation
transformed = CTM * original;
xt = transformed(1,:);
yt = transformed(2,:);
% -------------------------------
% Plotting
figure;
% Original object
plot(x, y, 'b-o', 'LineWidth', 2);
hold on;
% Transformed object
plot(xt, yt, 'r-o', 'LineWidth', 2);
grid on;
axis equal;
xlabel('X-axis');
ylabel('Y-axis');
title('Combined Transformation (Scaling + Rotation + Translation)');
legend('Original Object','Transformed Object');

Animation of Combined 2D Transformations (T + R + S) matlab
clc;
clear;
close all;
% Original object (Triangle)
x = [1 4 2 1];
y = [1 1 3 1];
original = [x; y; ones(1,length(x))];
% Final transformation parameters
sx_final = 1.8;
sy_final = 1.8;
theta_final = 90;   % degrees
tx_final = 4;
ty_final = 3;
steps = 60;   % Animation frames
figure;
for k = 1:steps
    % ---------------------------
    % Gradual Scaling
    sx = 1 + (sx_final - 1)*(k/steps);
    sy = 1 + (sy_final - 1)*(k/steps);
    S = [sx 0  0;
         0 sy 0;
         0  0 1];
    % ---------------------------
    % Gradual Rotation
    theta = theta_final * (k/steps);
    rad = deg2rad(theta);
    R = [cos(rad) -sin(rad) 0;
         sin(rad)  cos(rad) 0;
         0         0        1];
    % ---------------------------
    % Gradual Translation
    tx = tx_final * (k/steps);
    ty = ty_final * (k/steps);
    T = [1 0 tx;
         0 1 ty;
         0 0 1];
    % ---------------------------
    % Combined Transformation
    CTM = T * R * S;
    transformed = CTM * original;
    xt = transformed(1,:);
    yt = transformed(2,:);
    % ---------------------------
    % Plot
    plot(x, y, 'b--', 'LineWidth', 1.5);
    hold on;
    plot(xt, yt, 'r-', 'LineWidth', 2);
    grid on;
    axis equal;
    axis([-5 12 -5 12]);
    title('Animation: Scaling + Rotation + Translation');
    legend('Original Object','Transforming Object');
    drawnow;
    pause(0.05);
    hold off;
end

Multiple Objects 2D Animation (T + R + S) matlab
clc;
clear;
close all;
figure;
% -------------------------------
% Object 1 : Triangle
x1 = [1 3 2 1];
y1 = [1 1 3 1];
obj1 = [x1; y1; ones(1,length(x1))];
% -------------------------------
% Object 2 : Square
x2 = [5 7 7 5 5];
y2 = [1 1 3 3 1];
obj2 = [x2; y2; ones(1,length(x2))];
% -------------------------------
% Object 3 : Pentagon
x3 = [3 4 5 4.5 2.5 3];
y3 = [5 6 5 4 4 5];
obj3 = [x3; y3; ones(1,length(x3))];
% -------------------------------
% Final Transformation Values
sx_final = 1.5;
sy_final = 1.5;
theta_final = 120;   % degrees
tx_final = 4;
ty_final = 2;
steps = 70;
for k = 1:steps
    % Gradual Scaling
    sx = 1 + (sx_final-1)*(k/steps);
    sy = 1 + (sy_final-1)*(k/steps);
    S = [sx 0 0;
         0 sy 0;
         0  0 1];
    % Gradual Rotation
    theta = theta_final*(k/steps);
    rad = deg2rad(theta);
    R = [cos(rad) -sin(rad) 0;
         sin(rad)  cos(rad) 0;
         0         0        1];
    % Gradual Translation
    tx = tx_final*(k/steps);
    ty = ty_final*(k/steps);
    T = [1 0 tx;
         0 1 ty;
         0 0 1];
    % Combined Matrix
    CTM = T * R * S;
    % Transform Objects
    t1 = CTM * obj1;
    t2 = CTM * obj2;
    t3 = CTM * obj3;
    % Extract coordinates
    x1t = t1(1,:); y1t = t1(2,:);
    x2t = t2(1,:); y2t = t2(2,:);
    x3t = t3(1,:); y3t = t3(2,:);
    % ---------------- Plot ----------------
    % Original objects
    plot(x1,y1,'b--'); hold on;
    plot(x2,y2,'g--');
    plot(x3,y3,'m--');
    % Transformed objects
    plot(x1t,y1t,'b','LineWidth',2);
    plot(x2t,y2t,'g','LineWidth',2);
    plot(x3t,y3t,'m','LineWidth',2);
    grid on;
    axis equal;
    axis([-5 15 -5 15]);
    title('Multiple Objects: Combined Transformation Animation');
    legend('Tri Original','Sq Original','Pent Original',...
           'Tri Transform','Sq Transform','Pent Transform');
    drawnow;
    pause(0.05);
    hold off;
end

Object-Wise Different 2D Transformations matlab
clc;
clear;
close all;
figure;
% ---------------------------------
% Object 1 : Triangle
x1 = [1 3 2 1];
y1 = [1 1 3 1];
obj1 = [x1; y1; ones(1,length(x1))];
% ---------------------------------
% Object 2 : Square
x2 = [5 7 7 5 5];
y2 = [1 1 3 3 1];
obj2 = [x2; y2; ones(1,length(x2))];
% ---------------------------------
% Object 3 : Pentagon
x3 = [3 4 5 4.5 2.5 3];
y3 = [5 6 5 4 4 5];
obj3 = [x3; y3; ones(1,length(x3))];
% ---------------------------------
% Final transformation values
% Triangle → More rotation
sx1 = 1.5; sy1 = 1.5; theta1 = 120; tx1 = 3; ty1 = 2;
% Square → More scaling
sx2 = 2;   sy2 = 1;   theta2 = 45;  tx2 = -2; ty2 = 3;
% Pentagon → More translation
sx3 = 1;   sy3 = 1;   theta3 = 90;  tx3 = 4;  ty3 = -2;
steps = 70;
for k = 1:steps
    % -------- Object 1 --------
    S1 = [1+(sx1-1)*(k/steps) 0 0;
          0 1+(sy1-1)*(k/steps) 0;
          0 0 1];
    th1 = deg2rad(theta1*(k/steps));
    R1 = [cos(th1) -sin(th1) 0;
          sin(th1)  cos(th1) 0;
          0 0 1];
    T1 = [1 0 tx1*(k/steps);
          0 1 ty1*(k/steps);
          0 0 1];
    CTM1 = T1 * R1 * S1;
    t1 = CTM1 * obj1;
    % -------- Object 2 --------
    S2 = [1+(sx2-1)*(k/steps) 0 0;
          0 1+(sy2-1)*(k/steps) 0;
          0 0 1];
    th2 = deg2rad(theta2*(k/steps));
    R2 = [cos(th2) -sin(th2) 0;
          sin(th2)  cos(th2) 0;
          0 0 1];
    T2 = [1 0 tx2*(k/steps);
          0 1 ty2*(k/steps);
          0 0 1];
    CTM2 = T2 * R2 * S2;
    t2 = CTM2 * obj2;
    % -------- Object 3 --------
    S3 = [1+(sx3-1)*(k/steps) 0 0;
          0 1+(sy3-1)*(k/steps) 0;
          0 0 1];
    th3 = deg2rad(theta3*(k/steps));
    R3 = [cos(th3) -sin(th3) 0;
          sin(th3)  cos(th3) 0;
          0 0 1];
    T3 = [1 0 tx3*(k/steps);
          0 1 ty3*(k/steps);
          0 0 1];
    CTM3 = T3 * R3 * S3;
    t3 = CTM3 * obj3;
    % Extract coordinates
    x1t = t1(1,:); y1t = t1(2,:);
    x2t = t2(1,:); y2t = t2(2,:);
    x3t = t3(1,:); y3t = t3(2,:);
    % ------------- Plot -------------
    % Original objects
    plot(x1,y1,'b--'); hold on;
    plot(x2,y2,'g--');
    plot(x3,y3,'m--');
    % Transformed objects
    plot(x1t,y1t,'b','LineWidth',2);
    plot(x2t,y2t,'g','LineWidth',2);
    plot(x3t,y3t,'m','LineWidth',2);
    grid on;
    axis equal;
    axis([-8 15 -8 15]);
    title('Object-Wise Different Transformations Animation');
    legend('Tri Original','Sq Original','Pent Original',...
           'Tri Transform','Sq Transform','Pent Transform');
    drawnow;
    pause(0.05);
    hold off;
end

Composite 2D Transformation
clc;
clear;
close all;
% Original object (Triangle)
x = [1 4 2 1];
y = [1 1 3 1];
original = [x; y; ones(1,length(x))];
% Scaling
sx = 1.5;
sy = 1.5;
S = [sx 0 0;
     0 sy 0;
     0  0 1];
% Rotation
theta = 30;
rad = deg2rad(theta);
R = [cos(rad) -sin(rad) 0;
     sin(rad)  cos(rad) 0;
     0         0        1];
% Translation
tx = 3;
ty = 2;
T = [1 0 tx;
     0 1 ty;
     0 0 1];
% Composite Matrix
CTM = T * R * S;
% Apply transformation
transformed = CTM * original;
xt = transformed(1,:);
yt = transformed(2,:);
% Plot
plot(x,y,'b-o','LineWidth',2);
hold on;
plot(xt,yt,'r-o','LineWidth',2);
grid on;
axis equal;
title('Composite Transformation');
legend('Original','Composite Transformed');

Composite 2D Transformation
#include <graphics.h>
#include <math.h>
#include <iostream>
int main()
{
    int gd = DETECT, gm;
    initgraph(&gd,&gm,"");
    // Triangle
    float x[4] = {100,150,125,100};
    float y[4] = {100,100,150,100};
    // Parameters
    float sx=1.5, sy=1.5;
    float theta=45;
    float tx=100, ty=50;
    float rad = theta * M_PI/180;
    int X[4], Y[4];
    for(int i=0;i<4;i++)
    {
        // Scaling
        float xs = x[i]*sx;
        float ys = y[i]*sy;
        // Rotation
        float xr = xs*cos(rad) - ys*sin(rad);
        float yr = xs*sin(rad) + ys*cos(rad);
        // Translation
        X[i] = xr + tx;
        Y[i] = yr + ty;
    }
    // Draw original
    setcolor(WHITE);
    for(int i=0;i<3;i++)
        line(x[i],y[i],x[i+1],y[i+1]);
    // Draw transformed
    setcolor(RED);
    for(int i=0;i<3;i++)
        line(X[i],Y[i],X[i+1],Y[i+1]);
    getch();
    closegraph();
}