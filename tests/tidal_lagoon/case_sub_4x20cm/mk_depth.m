clear all
x=[-2.64:0.02:2.64-0.02]; % 264
y=[-0.12:0.02:0.12];

m=length(x);
n=length(y);


s=0.214+min(0,max(-0.33,0.5*abs(x-1.04)-0.35));
dep=zeros(n,m);
for j=1:n
dep(j,:)=s(:);
end

save -ASCII depth.txt dep
