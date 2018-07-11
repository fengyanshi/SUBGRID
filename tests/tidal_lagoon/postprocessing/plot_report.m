clear all
fdir='/Users/fengyanshi15/tmp1/';

dep=load('depth.txt');

x=[-2.64:0.02:2.64-0.02];

nfile=[1];

wid=10;
len=3;
set(gcf,'units','inches','paperunits','inches','papersize', [wid len],'position',[1 1 wid len],'paperposition',[0 0 wid len]);


for num=1:length(nfile)
    
fnum=sprintf('%.4d',nfile(num));
eta=load([fdir 'etagrn_' fnum]);
%p=load([fdir 'pgrn_' fnum]);
%q=load([fdir 'qgrn_' fnum]);

%subplot(1,length(nfile), num)
clf
plot(x,-dep(2,:)','k','LineWidth',2)
hold on
plot(x,eta(2,:),'r')
axis([-2.64 2.62 -0.214 0.12])
xlabel('x (m)')
ylabel('z (m)')
pause(0.5)
grid
time=num2str(nfile(num)*10);
title([' Time = ' time ' sec '])

end