% Simple Pendulum Simulation (Linearised at 0) %
clear
clf

Length = 1;
Mass = 15;
g=9.81;
c=1;

%specific solution constants
k=g/Length;
theta_init=pi/18;

%specific solution parameters 
p=[1 c k];
r=roots(p);
A=[r(1) r(2);1 1];
B=[0;theta_init];
C=linsolve(A,B);


t=0;
tic;

    while t<=10
        t=toc;
        
        %angle as a function of time
        theta_i = C(1)*exp(r(1)*t)+C(2)*exp(r(2)*t);  %for damped systems        
        %theta = (theta_init)*cos(t*sqrt(k));  %for undamped system  
        theta= real(theta_i);
        
        %plotting 
        lx=Length*cos(theta-(pi/2));
        ly=Length*sin(theta-(pi/2));

        plot([0 lx],[0 ly],'b','Linewidth',1);  
        viscircles([lx,ly],Length/12,'EdgeColor','b','LineWidth',1);
        axis([-Length-1 Length+1 -Length-1 Length+1])

        pause(0.01);
    end




