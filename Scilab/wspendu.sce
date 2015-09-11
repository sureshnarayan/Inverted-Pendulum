//Simple Pendulum
g=9.81
len = 10;
iangle = %pi/6;
time=0
tic()
    c = scf(100002);
da=gda();
    da.auto_clear="on";
    da.data_bounds=[-len/2,-1-len;len/2,0.5];
    da.x_location="bottom";
    da.y_location="left";
    da.axes_visible="on";
    da.auto_clear = "on"
    da.box="off";
    da.grid=[2,2];
    da.grid_style=[9,9]
    da.grid_thickness=[1,1]

//axes resets every time it enters the loop
while time<5 //run time of the simulation
    
//^^^^^^Do not disturb^^^^^^
    a=gca();                //to reduce blinking//due to resetting
    a.auto_clear = 'on'     //to clear the graph after calc(time consuming)
//^^^^^^^^^^^^^^^^^^^^^^^^^^
    time=toc();

//Equation comes here
    angle=iangle*cos(sqrt(g/len)*time)

//Getting coordinates of points
    x=len*cos(-1*%pi/2+angle);
    y=len*sin(-1*%pi/2+angle);
    
//Plotting starts here
    xpoly([0,0],[0,0]);//in order to ease the previous plot(autoclear)
    drawlater();
    a.auto_clear = 'off'//hold on
    //+++++++++Add here+++++++++++
    //dont use 'plot' anywhere as it tris to rescale the axis
    
    //----------------------------
    xpoly([0,x],[0,y]);
    xpoly([x,x],[y,y]);//coincident line:bob
    bob=gce();
    bob.mark_style=9;
    bob.mark_size=5;//max size--use rad for larger size
    //rad=0.1;
    //rad=rad*2;
    //xarc(x-rad/2,y+rad/2,rad,rad,0,360*64);
    ////xfarc(x-rad/2,y+rad/2,rad,rad,0,360*64);
    

    drawnow();
    sleep(20)
end

