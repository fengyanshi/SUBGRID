clear all
fdir='/Volumes/2TB_element/SUBSURFACE/tide/';

nfile=[636:780];

dx=8.0;
dy=8.0;
m=300;
n=632;
x=[0:m-1]*dx;
y=[0:n-1]*dy;


% Set up file and options for creating the movie
vidObj = VideoWriter('movie.avi');  % Set filename to write video file
%vidObj=avifile('movie_add.avi','compression','None');
vidObj.FrameRate=10;  % Define the playback framerate [frames/sec]
open(vidObj);

wid=16;
len=8;
set(gcf,'units','inches','paperunits','inches','papersize', [wid len],'position',[0 0 wid len],'paperposition',[0 0 wid len]);
clf

for num=1:length(nfile)
    
fnum=sprintf('%.4d',nfile(num));
eta=load([fdir 'etagrn_' fnum]);
mask=load([fdir 'mask_' fnum]);

etaw=eta;
etaw(mask<1)=NaN;
etag=eta;
etag(mask==1)=NaN;


%subplot(1,length(nfile), num)
subplot(1,2,1)
pcolor(x,y,etaw),shading flat
colorbar
caxis([-1 1.])
xlabel('x (m)')
ylabel('y (m)')

time = sprintf('%.4d',floor(nfile(num)*10.0/60.0));
title(['Surface Water,  time = '  time  '  hrs'])

subplot(1,2,2)
pcolor(x,y,etag),shading flat
colorbar
caxis([-0 1.])
xlabel('x (m)')
ylabel('y (m)')

title(['GroundWater,  time = '  time  '  hrs'])

pause(0.1);
currframe=getframe(gcf);
writeVideo(vidObj,currframe);  % Get each recorded frame and write it to filename defined above

end

close(vidObj)

