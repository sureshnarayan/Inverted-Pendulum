// This GUI file is generated by guibuilder version 3.0
//////////
f=figure('figure_position',[400,50],'figure_size',[656,582],'auto_resize','on','background',[33],'figure_name','Graphic window number %d');
//////////
delmenu(f.figure_id,gettext('File'))
delmenu(f.figure_id,gettext('?'))
delmenu(f.figure_id,gettext('Tools'))
toolbar(f.figure_id,'off')
handles.dummy = 0;
handles.motion=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','left','ListboxTop',[],'Max',[2],'Min',[-2],'Position',[0.096875,0.1020833,0.803125,0.0979167],'Relief','default','SliderStep',[0.02,0.1],'String','motion','Style','slider','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','motion','Callback','motion_callback(handles)')

global('data');
data=[0,0,0,0];
//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////

function motion_callback(handles)
//Write your callback for  motion  here
global data;
motion=handles.motion.value;
t=toc();
dt=t-data(1);
vp=(motion-data(2))/dt;
ap=(vp-data(3))/dt;
data=[t,motion,vp,ap];//storing actual time,position,velocity,acceleration
//disp(ap);
plot(t,motion,'b.');
xsegs(


endfunction

funcprot(0);
tic();