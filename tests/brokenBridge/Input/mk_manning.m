

fric=load('manning_coarse.txt');
fric(fric>0.1)=0.1;

save -ASCII manning_coarse_max0p1.txt fric