clear all
fdir='/Users/fengyanshi15/tmp2/';

nfile=[289];

wid=10;
len=4;
set(gcf,'units','inches','paperunits','inches','papersize', [wid len],'position',[1 1 wid len],'paperposition',[0 0 wid len]);
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
pcolor(etaw),shading flat
colorbar
subplot(1,2,2)
pcolor(etag),shading flat
colorbar

end