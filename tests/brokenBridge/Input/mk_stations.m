sta_coarse=load('station_inc_groundwater.txt');
sta=sta_coarse;
sta(:,1)=(sta(:,1)-1)*4+1;
sta(:,2)=(sta(:,2)-1)*4+1;

fid = fopen('station_subgrid_groundwater.txt', 'wt');
  fprintf(fid, ['%5d','%5d', '\n'], sta');
  fclose(fid);

%save -ASCII station.txt west
