clear all
fdir1='/Users/fengyanshi15/tmp1/';
fdir2='/Users/fengyanshi15/tmp2/';
fdir3='/Users/fengyanshi15/tmp3/';

sta1=load([fdir1 'sta_0001']);
sta2=load([fdir2 'sta_0001']);
sta3=load([fdir3 'sta_0001']);

lsta1=load([fdir1 'sta_0002']);
lsta2=load([fdir2 'sta_0002']);
lsta3=load([fdir3 'sta_0002']);

wid=5;
len=8;
set(gcf,'units','inches','paperunits','inches','papersize', [wid len],'position',[1 1 wid len],'paperposition',[0 0 wid len]);

clf
subplot(311)
plot(sta1(:,1),sta1(:,2),'r')
hold on
plot(sta2(:,1),sta2(:,2),'k')
plot(sta3(:,1),sta3(:,2),'b')
grid
%legend('subgrid dx=4x20cm','nonsub dx=20cm','nosub dx=80cm')
axis([0 1000 -0.1 0.1])
xlabel('t (sec)')
ylabel ('\eta (m)')
title ('basin')

subplot(312)
plot(lsta1(:,1),lsta1(:,2),'r')
hold on
plot(lsta2(:,1),lsta2(:,2),'k')
plot(lsta3(:,1),lsta3(:,2),'b')
grid
%legend('subgrid dx=4x20cm','nonsub dx=20cm','nosub dx=80cm')
axis([0 1000 -0.01 0.03])
xlabel('t (sec)')
ylabel ('\eta (m)')
title ('lagoon')

subplot(313)
plot(sta1(:,1),sta1(:,3),'r')
hold on
plot(sta2(:,1),sta2(:,3),'k')
plot(sta3(:,1),sta3(:,3),'b')
grid
legend('subgrid dx=4x20cm','nonsub dx=20cm','nosub dx=80cm')
axis([0 1000 -0.02 0.03])
xlabel('t (sec)')
ylabel ('u (m/s)')
title ('basin')

