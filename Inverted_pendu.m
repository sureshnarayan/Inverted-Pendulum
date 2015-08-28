% Inverted Pendulum Simulation (linearisation at pi) %
clear
clf

Length = 10;
Mass = 15;
g=9.81;
vp_init=0;

%system constants
k=g/Length;
%rk=sqrt(k); %used when undamped
theta_init=0.01;
c=0;

%specific solution parameters 
p=[1 c -k];
r=roots(p);
A=[r(1) r(2);1 1];
B=[0;theta_init];
C=linsolve(A,B);

t=0;
%motion of the platform
motion=0;
prev_time=0;
tic;

    while t<=15
        t=toc;
        dt=t-prev_time;
        vp = 0*t+vp_init;
        motion = motion + vp*t;
        
      
        theta_i = C(1)*exp(r(1)*t)+C(2)*exp(r(2)*t);  %for damped systems    
        %theta=theta_init/2*(exp(rk*t)+exp(-rk*t));  %for undamped system
        theta= real(theta_i);
        
        %plotting 
        lx=Length*cos(theta+(pi/2))+motion;
        ly=Length*sin(theta+(pi/2));

        plot([motion lx],[0 ly],'b','Linewidth',1);   
        viscircles([lx,ly],Length/20,'EdgeColor','b','LineWidth',1);
        
        axis([-Length-1+motion Length+1+motion -Length-1 Length+1])

        pause(0.01);
        
        if theta>pi/2 || theta<-pi/2
            break;
        end
        prev_time=t;
    end