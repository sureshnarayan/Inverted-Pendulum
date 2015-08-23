% Simple Pendulum Simulation (Linearised at 0) %
clear
clf

Length = 1;
Mass = 15;
g=9.81;

k=g/Length;
theta_init=pi/18;

t=0;
tic;

    while t<=5
        t=toc;
        theta = (theta_init)*cos(t*sqrt(k));         
        
        lx=Length*cos(theta-(pi/2));
        ly=Length*sin(theta-(pi/2));

        plot([0 lx],[0 ly],'b','Linewidth',1);   
        %rectangle('Curvature',[1,1],'Position',[lx-0.05,ly-0.05,0.1,0.1],'FaceColor','b');
        viscircles([lx,ly],Length/12,'EdgeColor','b','LineWidth',1);
        axis([-Length-1 Length+1 -Length-1 Length+1])

        pause(0.01);
    end




