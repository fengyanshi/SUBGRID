clear all
fdir='/Users/fengyanshi15/tmp1/';

nfile=[42];

wid=10;
len=3;
set(gcf,'units','inches','paperunits','inches','papersize', [wid len],'position',[1 1 wid len],'paperposition',[0 0 wid len]);
clf

for num=1:length(nfile)
    
fnum=sprintf('%.4d',nfile(num));
eta=load([fdir 'etagrn_' fnum]);
p=load([fdir 'pgrn_' fnum]);
q=load([fdir 'qgrn_' fnum]);

%subplot(1,length(nfile), num)
subplot(1,3,1)
pcolor(eta),shading flat
colorbar
subplot(1,3,2)
pcolor(p),shading flat
colorbar
subplot(1,3,3)
pcolor(q),shading flat
colorbar
end