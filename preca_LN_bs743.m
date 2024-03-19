%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Calculating the daily rainfall anomalies over SA           %                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily climatology only in LN years
path(path,'C:/Users/Laís/Desktop/tese/scripts/Plot');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_geral');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_ocean');
%
clc
clear
%
cd G:/for_lais;
%
ncdisp('bs743.jan-dec_dmeans_ts.years1-60.precip.nc');
%360-day calendar. The year is made of 12 months, each of which has 30 days  
%21600 days in 60 years (60 * 360 = 21600)
%
startLoc = [147 23 1]; 
count  = [32 68 21600];
%
precf = ncread('bs743.jan-dec_dmeans_ts.years1-60.precip.nc',...
    'UM_m01s05i216_vn1003',startLoc,count); 
%
lat = ncread('bs743.jan-dec_dmeans_ts.years1-60.precip.nc','latitude'); 
%
lon = ncread('bs743.jan-dec_dmeans_ts.years1-60.precip.nc','longitude'); 
%
lat = lat(23:90); lat1 = lat;
lon = lon(147:178); lon1 = lon;
%
%Example: Plotting the daily rainfall flux for the day 10 only in SA:
%
figure
south = -60 ; north = 20 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,precf(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',3,9);
title('prec flux day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;
%OK!
%
[I,J,T] = size(precf);
%
L = 360;%days in a year
%
K = T/L;%years
%
%Converting precipitation flux (kg/m^2/s or mm/s) in mm/day:
%Multiplying by 86400 to calculate mm/day
%
precf = reshape(precf,I*J,T);
%
for i = 1:T
    prec(:,i) = precf(:,i)*86400;
end
%
clear precf

%Calculating the daily precipitation climatology in LN:
%
prec = reshape(prec,I*J,L,K);
%
cd G:/Lais_jasmin/u-bs743/data/ENSO

load ENSO

%Next year:
LN2 = LN+1; 

%for year 0:
prec_LN = NaN(I*J,L,length(LN));

for i = 1:length(LN)
    prec_LN(:,:,i) = prec(:,:,LN(i));
    prec_LN(:,1:180,i) = NaN;
end

%for year +1:
prec_LN2 = NaN(I*J,L,length(LN2));

for i = 1:length(LN2)
    prec_LN2(:,:,i) = prec(:,:,LN2(i));
    prec_LN2(:,181:end,i) = NaN;
end

prec_LN = cat(3,prec_LN,prec_LN2); clear prec_LN2;
precc_LN = nanmean(prec_LN,3); clear prec_LN;
%
%Applying the 31-day moving mean
%
cd G:/Lais_jasmin/functions
%
%Copying the last 15 series values at the beginning and the first 
%15 series values at the end:
%
precc_LN = [precc_LN(:,346:end) precc_LN precc_LN(:,1:15)];
%
%Moving mean:
%
precc_LN = precc_LN';
%
for j = 1:(I*J)
a(:,j) = mediamovel_centrada(precc_LN(:,j),31);
end
%
precc_LN = a; precc_LN = precc_LN'; clear a;
%
precc_LN = precc_LN(:,16:end-15);
%
precc_LN = reshape(precc_LN,I,J,L);
%
%Example: Plotting the climatology daily rainfall of the day 10 only in SA:
%10th January
%
figure
south = -60 ; north = 20 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,precc_LN(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',3,9);
title('prec clim day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;%OK!
%
%Calculating the daily prec anomalies:
%
precc_LN = reshape(precc_LN,I*J,L);
%
preca = prec*NaN;
%
for k = 1:K
preca(:,:,k) = prec(:,:,k) - precc_LN(:,:);
end
%
%Rearranging the data:
%
clear prec; clear precc_LN;
%
preca = reshape(preca,I*J,T); preca = reshape(preca,I,J,T);
%
%Example: Plotting the daily rainfall anomaly of the day 10 only in SA:
%10th January
%
figure
south = -60 ; north = 20 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca(:,:,10)'); shading interp; hold on;
cmin = -15; cmax = 15; maplength = 30; caxis([cmin cmax])
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',3,9);
title('prec anom day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;%OK!
%
clearvars -except preca lat lon lat1 lon1 I J T K L;
%
%Applying the Lanczos filter:
%
preca = reshape(preca,I*J,T);
preca = preca';
%
for j = 1:I*J
[Y(:,j),coef,window,Cx,Ff] = lanczosfilter(preca(:,j),1,0.05,211.1,'low');
%removing frequencies greater than 0.05
end
%
for j = 1:I*J
[Z(:,j),coef,window,Cx,Ff] = lanczosfilter(Y(:,j),1,0.01,211.1,'high');
%removing frequencies between 0 and 0.01
end
%
clear Y;
plot(preca(:,116));
hold on
plot(Z(:,116));%OK!
%
preca = Z; 
clear Z coef window Cx Ff; 
preca = preca';
%
%Using only DJF for the analyses:
%
%DJF anom:
%
preca = reshape(preca,I*J,L,K);
%
preca = cat(2,preca(:,1:60,:),preca(:,331:end,:));
%
%new L:
L = 90;%days in DJF
%
%new T:
T = K*L;
%
preca = reshape(preca,I,J,T);
%
cd G:/Lais_jasmin/u-bs743/data/prec
save('preca_LN','preca','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
cd G:/Lais_jasmin/u-bs743/scripts/prec