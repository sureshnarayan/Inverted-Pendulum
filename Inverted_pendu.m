% Inverted Pendulum Simulation (linearisation at pi) %
clear
clf

Length = 1;
Mass = 15;
g=9.81;

k=g/Length;
theta_init=pi+0.01;

t=0;
tic;

    while t<=10
        t=toc/10;
        theta = (pi/18)*cos(time*sqrt(k));       
        theta=(theta_init-(k*pi*t*t))/(1-k*t*t);   
        
        lx=Length*cos(theta-(pi/2));
        ly=Length*sin(theta-(pi/2));

        plot([0 lx],[0 ly],'b','Linewidth',3);   
        rectangle('Curvature',[1,1],'Position',[lx-0.05,ly-0.05,0.1,0.1],'FaceColor','b');

        axis([-2 2 -2 2])

        pause(0.01);
        
        if theta<pi/2 || theta>3*pi/2
            break;
        end
    end