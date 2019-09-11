clc; clear all;
%% field data
load ('./field/etaField');
load ('./field/dateField');
load ('./field/Site1');
% A.fld = load('data_siteA.txt');
A.fld = etaField(:,1); B.fld = etaField(:,2);
C.fld = etaField(:,3); D.fld = etaField(:,4);
E.fld = etaField(:,5); F.fld = etaField(:,6);
dtime.fld = dateField; dtime.site1 = Site1.date;
G.fld = Site1.eta;

%% subgrid 2m
s1 = load('Out1-1/sta_0001');
s2 = load('Out1-1/sta_0002');
s3 = load('Out1-1/sta_0003');
s4 = load('Out1-1/sta_0004');
s5 = load('Out1-1/sta_0005');
s6 = load('Out1-1/sta_0006');
s7 = load('Out1-1/sta_0007');
A.sub10 = s1(:,2);B.sub10 = s2(:,2);C.sub10 = s3(:,2);
D.sub10 = s4(:,2);E.sub10 = s5(:,2);F.sub10 = s6(:,2);G.sub10 = s7(:,2);
t_beg=datenum(2013,3,24,5,15,00);
dtime.sub10 = t_beg + s1(:,1)/3600./24.;

% s1 = load('../Subgrid/Out1-1_new/sta_0001');
% s2 = load('../Subgrid/Out1-1_new/sta_0002');
% s3 = load('../Subgrid/Out1-1_new/sta_0003');
% s4 = load('../Subgrid/Out1-1_new/sta_0004');
% s5 = load('../Subgrid/Out1-1_new/sta_0005');
% s6 = load('../Subgrid/Out1-1_new/sta_0006');
% s7 = load('../Subgrid/Out1-1_new/sta_0007');
% A.sub1 = s1(:,2);B.sub1 = s2(:,2);C.sub1 = s3(:,2);
% D.sub1 = s4(:,2);E.sub1 = s5(:,2);F.sub1 = s6(:,2);G.sub1 = s7(:,2);
% t_beg=datenum(2013,3,24,5,15,00);
% dtime.sub1 = t_beg + s1(:,1)/3600./24.;

% % %% subgrid 2, 0.5-0.075-0.04
% s1 = load('../Subgrid/out_inlet2/sta_0001');
% s2 = load('../Subgrid/out_inlet2/sta_0002');
% s3 = load('../Subgrid/out_inlet2/sta_0003');
% s4 = load('../Subgrid/out_inlet2/sta_0004');
% s5 = load('../Subgrid/out_inlet2/sta_0005');
% s6 = load('../Subgrid/out_inlet2/sta_0006');
% s7 = load('../Subgrid/out_inlet2/sta_0007');
% s8 = load('../Subgrid/out_inlet2/sta_0008');
% A.sub2 = s1(:,2);B.sub2 = s2(:,2);C.sub2 = 0.5*(s3(:,2)+s4(:,2));
% D.sub2 = s5(:,2);E.sub2 = s6(:,2);F.sub2 = s7(:,2);G.sub2 = s8(:,2);
% dtime.sub2 = t_beg + s1(:,1)/3600./24.;

% % %% subgrid 3,0.5-0.03-0.03
% s1 = load('../Subgrid/out_inlet3/sta_0001');
% s2 = load('../Subgrid/out_inlet3/sta_0002');
% s3 = load('../Subgrid/out_inlet3/sta_0003');
% s4 = load('../Subgrid/out_inlet3/sta_0004');
% s5 = load('../Subgrid/out_inlet3/sta_0005');
% s6 = load('../Subgrid/out_inlet3/sta_0006');
% s7 = load('../Subgrid/out_inlet3/sta_0007');
% s8 = load('../Subgrid/out_inlet3/sta_0008');
% A.sub3 = s1(:,2);B.sub3 = s2(:,2);C.sub3 = 0.5*(s3(:,2)+s4(:,2));
% D.sub3 = s5(:,2);E.sub3 = s6(:,2);F.sub3 = s7(:,2);G.sub3 = s8(:,2);
% dtime.sub3 = t_beg + s1(:,1)/3600./24.;
% 
% % %% subgrid 4
% s1 = load('../Subgrid/out_inlet4/sta_0001');
% s2 = load('../Subgrid/out_inlet4/sta_0002');
% s3 = load('../Subgrid/out_inlet4/sta_0003');
% s4 = load('../Subgrid/out_inlet4/sta_0004');
% s5 = load('../Subgrid/out_inlet4/sta_0005');
% s6 = load('../Subgrid/out_inlet4/sta_0006');
% s7 = load('../Subgrid/out_inlet4/sta_0007');
% s8 = load('../Subgrid/out_inlet4/sta_0008');
% A.sub4 = s1(:,2);B.sub4 = s2(:,2);C.sub4 = 0.5*(s3(:,2)+s4(:,2));
% D.sub4 = s5(:,2);E.sub4 = s6(:,2);F.sub4 = s7(:,2);G.sub4 = s8(:,2);
% dtime.sub4 = t_beg + s1(:,1)/3600./24.;

% % %% subgrid 5
% s1 = load('../Subgrid/out_site1/sta_0001');
% s2 = load('../Subgrid/out_site1/sta_0002');
% s3 = load('../Subgrid/out_site1/sta_0003');
% s4 = load('../Subgrid/out_site1/sta_0004');
% s5 = load('../Subgrid/out_site1/sta_0005');
% s6 = load('../Subgrid/out_site1/sta_0006');
% s7 = load('../Subgrid/out_site1/sta_0007');
% s8 = load('../Subgrid/out_site1/sta_0008');
% A.sub5 = s1(:,2);B.sub5 = s2(:,2);C.sub5 = 0.5*(s3(:,2)+s4(:,2));
% D.sub5 = s5(:,2);E.sub5 = s6(:,2);F.sub5 = s7(:,2);G.sub5 = s8(:,2);
% dtime.sub5 = t_beg + s1(:,1)/3600./24.;

% %% subgrid 6, final valiation
% s1 = load('out_ditch/sta_0001');
% s2 = load('out_ditch/sta_0002');
% s3 = load('out_ditch/sta_0003');
% s4 = load('out_ditch/sta_0004');
% s5 = load('out_ditch/sta_0005');
% s6 = load('out_ditch/sta_0006');
% s7 = load('out_ditch/sta_0007');
% s8 = load('out_ditch/sta_0008');

fdir='../model_manning_max0p05_G/';

s1 = load([fdir 'sta_0001']);
s2 = load([fdir 'sta_0002']);
s3 = load([fdir 'sta_0003']);
s4 = load([fdir 'sta_0004']);
s5 = load([fdir 'sta_0005']);
s6 = load([fdir 'sta_0006']);
s7 = load([fdir 'sta_0007']);
s8 = load([fdir 'sta_0008']);

A.sub6 = s1(:,2);B.sub6 = s2(:,2);C.sub6 = 0.5*(s3(:,2)+s4(:,2));
D.sub6 = s5(:,2);E.sub6 = s6(:,2);F.sub6 = s7(:,2);G.sub6 = s8(:,2);
dtime.sub6 = t_beg + s1(:,1)/3600./24.;

%% 8m coarse grid
s1 = load('Out8m_new/sta_0001');
s2 = load('Out8m_new/sta_0002');
s3 = load('Out8m_new/sta_0003');
s4 = load('Out8m_new/sta_0004');
s5 = load('Out8m_new/sta_0005');
s6 = load('Out8m_new/sta_0006');
s7 = load('Out8m_new/sta_0007');
s8 = load('Out8m_new/sta_0008');
s9 = load('Out8m_new/sta_0009');
s10 = load('Out8m_new/sta_0010');
s11 = load('Out8m_new/sta_0011');
A.coarse8m = s1(:,2);B.coarse8m = 0.5*(s3(:,2)+s4(:,2));C.coarse8m =0.5*(s5(:,2)+s6(:,2));
D.coarse8m = 0.5*(s7(:,2)+s8(:,2));E.coarse8m = s9(:,2);F.coarse8m = s10(:,2);G.coarse8m = s11(:,2);
dtime.coarse8m = t_beg + s1(:,1)/3600./24.;

%% plot
var={A,B,C,D,E,F,G};
stnname={'A','B','C','D','E','F','G'};

t_end=max(dtime.sub6);
minx = t_beg; maxx = t_end;
datexis=ceil(minx):1:maxx;
datelst=datestr(datexis,6);  %% 23

% fig=figure('renderer', 'zbuffer');
figure;
set(gcf,'units','normalized','position',[0.2 0.00 0.60 0.95]);

subplot1(7,1, 'Gap', [.05 .036], 'Min',[0.10 0.13],'Max',[0.95 1.00], ...
               'XTickL', 'Margin', 'YTickL', 'All');
darkgreen=[0 0.3906 0];
for i=1:7
    
    subplot1(i)
% subplot(7,1,i)
    if i~=7
        plot(dtime.fld, var{1,i}.fld,  '-k','linewidth',1.5);
    else
        plot( dtime.site1, var{1,i}.fld,'-k','linewidth',1.5);
    end
    hold on;
    plot(dtime.sub10, var{1,i}.sub10, '-.b','linewidth',1.5);
    hold on;
    plot(dtime.sub6, var{1,i}.sub6, '-.r','linewidth',1.5);
    hold on;
    plot(dtime.coarse8m, var{1,i}.coarse8m,'-.','color',darkgreen,'linewidth',1.5);
%     hold on;
%     plot(dtime.sub2, var{1,i}.sub2, '-.r','linewidth',2);
%     hold on;    
%     plot(dtime.sub3, var{1,i}.sub3, '-.y','linewidth',2);
%     hold on;
%     plot(dtime.sub4, var{1,i}.sub4, '-.g','linewidth',2);
%     hold on;
%     plot(dtime.sub5, var{1,i}.sub5,'-.','color',darkgreen,'linewidth',2);
%     hold on;    
%     plot(dtime.sub6, var{1,i}.sub6, '-.r','linewidth',1.5);
%     hold on;
    
    %title(['Station ',stnname{i}]);
    ylabel('/eta(t) (m)');
    set(gca,'XTick',datexis);
    set(gca,'XTickLabel', datelst);
    if i~=7
        axis([ minx maxx -1.2 1.2]);
    else
        axis([ minx maxx -0.2 1.0]);
    end
    
    if i==7 %|| i==6
        xlabel('Days in 2013');
    end
    
    yt = 0.1+(i-1)*0.12;
    title(stnname{i},'units','normalized','position',[0.035,0.7]);
end
% legend('Measurements','2m regular grid','subgrid');%'site1','0.5-0.075-0.04','0.5-0.1-0.03','0.5-0.1-0.04','0.5-0.1-0.05','0.5-0.1-0.06');



