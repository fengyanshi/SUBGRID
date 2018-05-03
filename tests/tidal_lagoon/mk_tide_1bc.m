clear all;

fname='tide_1bc.txt';
%delete(fname);
fp=fopen(fname,'w');

%title
fprintf(fp,'tidal boundary conditions\n');

TideStartDate=0;
NumConstituent=1;
fprintf(fp,'%5.1f\n',TideStartDate);
fprintf(fp,'%3d\n',NumConstituent);

for i=1:NumConstituent
    TideFac(i)=1;
    Tideu0(i)=0;
    fprintf(fp,'%10.3f %10.3f\n',TideFac(i),Tideu0(i));
end

Mglob=264;
Nglob=3;

%NumTidePoint=(Mglob+Nglob)*2-4;

NumTidePoint=(Nglob);


fprintf(fp,'%10d\n',NumTidePoint);

TidePeriod=0.0986;
TideAmp=0.06;
TidePha=0;

%South
if(0)
for i=1:Mglob  
    fprintf(fp,'%10d %10d\n',i,1);
    fprintf(fp,'%10.2f %10.2f %10.2f\n',TidePeriod,TideAmp,TidePha);
end
end

if(0)
%East
for j=2:Nglob
    fprintf(fp,'%10d %10d\n',Mglob,j);
    fprintf(fp,'%10.2f %10.2f %10.2f\n',TidePeriod,TideAmp,TidePha);
end
end

%North
if(0)
for i=Mglob-1:-1:1
    fprintf(fp,'%10d %10d\n',i,Nglob);
    fprintf(fp,'%10.2f %10.2f %10.2f\n',TidePeriod,TideAmp,TidePha);
end
end

%West
if(1)
for j=1:Nglob
    fprintf(fp,'%10d %10d\n',1,j);
    fprintf(fp,'%10.5f %10.5f %10.5f\n',TidePeriod,TideAmp,TidePha);
end
end





