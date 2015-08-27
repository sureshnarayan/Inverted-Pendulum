% Inverted Pendulum Simulation (linearisation at pi) %
clear
clf

Length = 1;
Mass = 15;
g=9.81;
vp_init=0;

k=g/Length;
rk=sqrt(k);
theta_init=0.01;

t=0;

motion=0;
prev_time=0;
tic;

    while t<=5
        time=toc;
        t=time;
        dt=t-prev_time;
        vp = 0*t+vp_init;
        motion = motion + vp*t;
        
      
        %theta=(theta_init-(k*pi*t*t)+vp*t/Length-vp_init*t/Length)/(1-k*t*t);   
        theta=theta_init/2*(exp(rk*t)+exp(-rk*t));
        
        lx=Length*cos(theta+(pi/2))+motion;
        ly=Length*sin(theta+(pi/2));

        plot([motion lx],[0 ly],'b','Linewidth',1);   
        %rectangle('Curvature',[1,1],'Position',[lx-0.05,ly-0.05,0.1,0.1],'FaceColor','b');
        viscircles([lx,ly],Length/20,'EdgeColor','b','LineWidth',1);
        
        axis([-Length-1+motion Length+1+motion -Length-1 Length+1])

        pause(0.01);
        
        if theta>pi/2 || theta<-pi/2
            break;
        end
        prev_time=t;
    end