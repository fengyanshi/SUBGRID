clear all
close all
fdir='../model_manning_max0p05_G/';
ll='0157';
hh='0151';
high_g=load([fdir 'etagrn_' hh]);
low_g=load([fdir 'etagrn_' ll]);
high_s=load([fdir 'eta_' hh]);
low_s=load([fdir 'eta_' ll]);
high_mask=load([fdir 'mask_' hh]);
low_mask=load([fdir 'mask_' ll]);

high_s(high_mask<1)=NaN;
high_g(high_mask>0)=NaN;

fig=figure(1);
set(gcf,'units','normalized','position',[0.1 0.05 0.70 0.7]);

m=300;
n=632;

dx = 8.0; dy = 8.0;
x = dx:dx:m*dx;
y = dy:dy:n*dy;

subplot(121)
pcolor(x,y,high_s),shading flat

c = colorbar; 
caxis([-0.5, 1.2])
colormap(jet);
c.Label.String = 'surface elevation(m)';
c.Label.FontSize = 14;
xlabel('Relative Easting, UTM Zone 18 N (m)');
ylabel('Relative Northing, UTM Zone 18 N (m)');
set(gca, 'LineWidth',  1)
axis([1 2400 500 5050])
grid

subplot(122)
pcolor(x,y,high_g),shading flat

c = colorbar; 
caxis([-1.2, 1.2])
colormap(jet);
c.Label.String = 'phreatic surface elevation(m)';
c.Label.FontSize = 14;
xlabel('Relative Easting, UTM Zone 18 N (m)');
ylabel('Relative Northing, UTM Zone 18 N (m)');
set(gca, 'LineWidth',  1)
axis([1 2400 500 5050])
grid
