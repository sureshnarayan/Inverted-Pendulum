//Simple Pendulum
Length = 1;
Mass = 1;
g=9.81;
vp_init=1;
t=0

//system parameters
k=g/Length;
//rk=sqrt(k); //used when undamped
theta_init=0.01;
c=1;

//specific solution parameters 
p=[1 c -k];
r=roots(p);
A=[r(1) r(2);1 1];
B=[0;theta_init];
C=linsolve(A,B);
//motion of the platform
motion=0;
prev_time=0;

c = scf(100002);
    c.figure_position = [200,200]
    c.figure_size = [626,587]
    c.axes_size = [610,460]
da=gda();
    da.auto_clear="on";
    da.data_bounds=[-2*Length+motion,-Length-1;2*Length+motion,Length+1];
    da.x_location="bottom";
    da.y_location="left";
    da.axes_visible="on";
    da.auto_clear = "on"
    da.box="off";
    da.grid=[2,2];
    da.grid_style=[9,9]
    da.grid_thickness=[1,1];
    da.auto_scale = "off";
    da.isoview = "on";
    
tic()

//axes resets every time it enters the loop
//------------------------------------------------------------------
while t<10 //run time of the simulation
        dt=t-prev_time;
        vp = 0*t+vp_init;
        motion = motion + vp*t;
//^^^^^^Do not disturb^^^^^^
    a=gca();                //to reduce blinking//due to resetting
    a.auto_clear = 'on'     //to clear the graph after calc(time consuming)
//^^^^^^^^^^^^^^^^^^^^^^^^^^
    t=toc();

//Equation comes here
        //angle as a function of time
        theta_im = C(1)*exp(r(1)*t)+C(2)*exp(r(2)*t);  //for damped systems    
        //theta=theta_init/2*(exp(rk*t)+exp(-rk*t));  //for undamped system
        theta= real(theta_im);

//Getting coordinates of points
        lx=Length*cos(theta+(%pi/2))+motion;
        ly=Length*sin(theta+(%pi/2));
    
//Plotting starts here
    xpoly([0,0],[0,0]);//in order to erase the previous plot(autoclear)
    drawlater();
    a.auto_clear = 'off'//hold on
    //+++++++++Add here+++++++++++
    //dont use 'plot' anywhere as it tries to rescale the axis
    
    //----------------------------
    xpoly([motion,lx],[0,ly]);
    xpoly([lx,lx],[ly,ly]);//coincident line:bob
    bob=gce();
    bob.mark_style=9;
    bob.mark_size=5;//max size--use rad for larger size
    //rad=0.1;
    //rad=rad*2;
    //xarc(lx-rad/2,ly+rad/2,rad,rad,0,360*64);
    ////xfarc(lx-rad/2,ly+rad/2,rad,rad,0,360*64);
    

    drawnow();
        if theta>%pi/2|theta<-1*%pi/2 then
            break
        end;
        prev_time=t;
    sleep(20)
end

