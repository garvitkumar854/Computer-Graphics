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

% Object-Wise Different 2D Transformations (short version)
clc;
clear;
close all;
figure;
objs = {
     [1 3 2 1; 1 1 3 1; ones(1,4)], ...
     [5 7 7 5 5; 1 1 3 3 1; ones(1,5)], ...
     [3 4 5 4.5 2.5 3; 5 6 5 4 4 5; ones(1,6)]
};
colors = {'b','g','m'};
params = [
     1.5 1.5 120  3  2;
     2.0 1.0  45 -2  3;
     1.0 1.0  90  4 -2
];
steps = 70;

for k = 1:steps
     hold on;
     for i = 1:3
          p = params(i,:);
          s = 1 + (p(1:2) - 1) * (k/steps);
          th = deg2rad(p(3) * (k/steps));
          t = p(4:5) * (k/steps);

          S = [s(1) 0 0; 0 s(2) 0; 0 0 1];
          R = [cos(th) -sin(th) 0; sin(th) cos(th) 0; 0 0 1];
          T = [1 0 t(1); 0 1 t(2); 0 0 1];

          tr = (T * R * S) * objs{i};
          plot(objs{i}(1,:), objs{i}(2,:), [colors{i} '--']);
          plot(tr(1,:), tr(2,:), colors{i}, 'LineWidth', 2);
     end
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

% Composite 2D Transformation (MATLAB short version)
clc;
clear;
close all;
x = [1 4 2 1];
y = [1 1 3 1];
original = [x; y; ones(1,length(x))];

sx = 1.5; sy = 1.5; theta = 30; tx = 3; ty = 2;
r = deg2rad(theta);
CTM = [1 0 tx; 0 1 ty; 0 0 1] * ...
       [cos(r) -sin(r) 0; sin(r) cos(r) 0; 0 0 1] * ...
       [sx 0 0; 0 sy 0; 0 0 1];

t = CTM * original;
plot(x, y, 'b-o', 'LineWidth', 2);
hold on;
plot(t(1,:), t(2,:), 'r-o', 'LineWidth', 2);
grid on;
axis equal;
title('Composite Transformation');
legend('Original','Composite Transformed');