clear all
fdir='/Volumes/DISK_2020_5/NGSCOAST_DEM/CUDEM_19resolution/NCEI_ninth_Topobathy_2014_8483/ASC_Inlandbays/';
fcur='/Users/fengyanshi/OUTSIDE_Google/SUBGRID/tests/inlandbays/';

eval(['cd ' fdir]);
load NAVD_38x75_75x25_19s.mat

eval(['cd ' fcur]);

dep1(dep1>20.0)=20.0;
dep1(dep1<-20.0)=-20.0;

m1=5800;
m2=6300;
n1=3400;
n2=3600;
tmp=dep1(n1:n2,m1:m2);

% deep min 25m;
mindep1=25.0;
px1=[127 363 370 125 127]';
py1=[115 132 112 80 115]';
% shallow min 15
mindep2=15.0;
px2=[91 202 222 347 496 496 354 218 203 104 91]';
py2=[135 135 127 137 157 94 98 87 76 65 135]';

figure
pcolor(-tmp),shading flat
hold on
plot(px1,py1,'k','LineWidth',2)
plot(px2,py2,'k--','LineWidth',2)
colorbar
colormap jet
print -djpeg inlet_correct.jpg

[ntmp mtmp]=size(tmp);
for j=1:ntmp
for i=1:mtmp
[in on]=inpolygon(i,j,px1,py1);
if in == 1
if tmp(j,i)<mindep1
tmp(j,i)=mindep1;
end
end
end
end
for j=1:ntmp
for i=1:mtmp
[in on]=inpolygon(i,j,px2,py2);
if in == 1
if tmp(j,i)<mindep2
tmp(j,i)=mindep2;
end
end
end
end

figure(2)
clf
pcolor(-tmp),shading flat
hold on
plot(px1,py1,'k','LineWidth',2)
plot(px2,py2,'k--','LineWidth',2)
colorbar
colormap jet
print -djpeg inlet_corrected.jpg

dep1(n1:n2,m1:m2)=tmp;

mm1=1;
mm2=8000;
nn1=1101;
nn2=7308;
dep=dep1(nn1:nn2,mm1:mm2);

dep2=double(dep);

% filtering
[n m]=size(dep2);
m1=1;
m2=m;
n1=1;
n2=n;
tmp=dep2(n1:n2,m1:m2);

%K = 0.045*ones(5);
K=0.111111*ones(3); %1/9=0.111111
tmp2 = conv2(tmp,K,'same');

wid=5;

dep2(n1+wid:n2-wid,m1+wid:m2-wid)=tmp2(1+wid:end-wid,1+wid:end-wid);
% filtering over

lon=-75.25;
lat=38.75+(nn1-1)/3600.0/9.0;

[n m]=size(dep2);
m1=1;
m2=m;
n1=1;
n2=n;
tmp=dep2(n1:n2,m1:m2);

%K = 0.045*ones(5);
K=0.111111*ones(3); %1/9=0.111111
tmp2 = conv2(tmp,K,'same');

wid=5;

dep2(n1+wid:n2-wid,m1+wid:m2-wid)=tmp2(1+wid:end-wid,1+wid:end-wid);
% filtering over

figure(3)
clf
pcolor(-dep2),shading flat
demcmap(dep2)
%colormap jet
% filtering

print -djpeg domain.jpg
save -ASCII dep_38x7840_75x25_NAVD_8000x6108_fter.txt dep2


