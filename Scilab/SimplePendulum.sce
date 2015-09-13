//Simple Pendulum
g=9.81
len = 10;
iangle = %pi/6;
time=0
tic()
    c = scf(100002);
da=gda();
    da.auto_clear="on";
    da.data_bounds=[-len,-1-len;len,0.5];
    da.x_location="origin";
    da.y_location="left";
    da.axes_visible="on";
    da.auto_clear = "on";
    da.auto_scale = "off";
    da.isoview = "on";

//axes resets every time it enters the loop
while time<5 //run time of the simulation
    
//^^^^^^Do not disturb^^^^^^
    a=gca();                //to reduce blinking//due to resetting
    a.auto_clear = 'on'     //to clear the graph after calc(time consuming)
//    a.auto_scale = "off";
//    a.axes_visible="off";
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
    
    //a.data_bounds=[-len/2,-1-len;len/2,0.5];
    //a.x_location="origin";
    //a.y_location="left";
//    a.axes_visible="on";
    drawnow();
    
end

