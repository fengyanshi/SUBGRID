clear all
close all
fdir='../model_manning_max0p05_G/';
maxg=load([fdir 'maxgrn_0254']);
ming=load([fdir 'mingrn_0254']);
mm=maxg-ming;
mm(mm<-1.0)=-1.0;

fig=figure('renderer', 'zbuffer');
set(gcf,'units','normalized','position',[0.1 0.05 0.35 0.85]);

m=300;
n=632;

dx = 8.0; dy = 8.0;
x = dx:dx:m*dx;
y = dy:dy:n*dy;

pcolor(x,y,mm),shading flat

%c = colorbar; 
caxis([-0.2, 0.5])
cmap=jet(10);
colormap(cmap);
%c.Label.String = 'Envelope of phreatic surface (m)';
%c.Label.FontSize = 14;
labels = {' ',' ','<0.05','0.05','0.10','0.15','0.25','0.30','0.40','>0.5' };
lcolorbar(labels,'fontweight','bold');
xlabel('Relative Easting, UTM Zone 18 N (m)');
ylabel('Relative Northing, UTM Zone 18 N (m)');
hold on;
stn = load ('../shawn_figures/station.txt');
stn = 2.0.*stn-1.0;
xstn = stn(:,1);
ystn = stn(:,2);
StationName={'A','B','C','D','E','F','G','H'};
for k=1:7
    plot(xstn(k),ystn(k),'ow','MarkerFaceColor','w');
    hold on;
    text(xstn(k)+45.0,ystn(k),StationName(k),'Color','y','FontSize',14,'FontWeight','bold');
end
set(gca, 'LineWidth',  1)
