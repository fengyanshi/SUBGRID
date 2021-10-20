clear all

T=readtable('IRIUSGSTides_4_28_5_4.txt');

time=T.Var3;
time_num=datenum(time);
ele=T.Var5;

time_num=(time_num-time_num(1))*24.0*3600;

writeout(:,1)=time_num;
writeout(:,2)=ele*0.3048;

fid = fopen('gauge_data.txt', 'wt');
  fprintf(fid, ['%5f %5f', '\n'], writeout');
fclose(fid);
