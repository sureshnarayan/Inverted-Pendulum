
clc

theta_init=pi-0.1;
k=9.81/1;

for t=0:0.01:10
theta=(theta_init-(k*pi*t*t))/(1-k*t*t);
plot(t,theta,'b.')
hold on;
end

