clear all
close all
fdir ='/Volumes/LOVE_2021/InlandBay/bathy_3m/';
fcur='/Users/fengyanshi15/work/NewInlandbayModel/3m_DEM/matlab/';

Dlon=1/3600.0/9.0;
Dlat=1/3600.0/9.0;
Lon0=-75.25-6*Dlon;
Lat0=38.50-6*Dlat;

Lon_batheny_0 = -75.10328;
Lat_batheny_0 = 38.53874;
Lon_batheny_1 = -75.05522;
Lat_batheny_1 = 38.59058;  %  38.58347;

m0=round((Lon_batheny_0-Lon0)/Dlon)+1;
m1=round((Lon_batheny_1-Lon0)/Dlon)+1;
n0=round((Lat_batheny_0-Lat0)/Dlat)+1;
n1=round((Lat_batheny_1-Lat0)/Dlat)+1;

load([fdir 'NAVD_38x75_75x25_19s.mat']);

dep=dep1(n0:n1,m0:m1);
dep(dep>2.5)=2.5;
dep(1620:end,1:1300)=2.0;
writeout=double(dep(1:1680,39:1558));

% -75.10328+38*Dlon = -75.102107160493830

save -ASCII bath_1520x1680_38p53874x75p102107.txt writeout








