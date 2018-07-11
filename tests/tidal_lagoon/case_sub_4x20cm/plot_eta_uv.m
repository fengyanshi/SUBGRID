clear all
fdir='/Users/fengyanshi15/tmp1/';

dep=load('depth.txt');

nfile=[1:30];

wid=10;
len=3;
%set(gcf,'units','inches','paperunits','inches','papersize', [wid len],'position',[1 1 wid len],'paperposition',[0 0 wid len]);


for num=1:length(nfile)
    
fnum=sprintf('%.4d',nfile(num));
%eta=load([fdir 'etagrn_' fnum]);
eta=load([fdir 'eta_' fnum]);
%p=load([fdir 'pgrn_' fnum]);
p=load([fdir 'P_' fnum]);
u=load([fdir 'u_' fnum]);
%q=load([fdir 'qgrn_' fnum]);

%subplot(1,length(nfile), num)
clf
%plot(-dep','k')
hold on
plot(eta','r')
plot(u','b')
axis([0 264 -0.214 0.12])
pause(0.5)
grid

end