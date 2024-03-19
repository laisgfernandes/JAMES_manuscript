%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Calculating the daily                             %                                                %
%                 streamfunction (STRF) anomalies                         %                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean');
%
clc
clear
%
if 1 == 2
cd G:/for_lais
%
ncdisp('be362.jan-dec_dmeans_ts.years1-30.sf200850.nc');
%360-day calendar. The year is made of 12 months, each of which has 30 days  
%10800 days in 30 years (30 * 360 = 10800)
%
STRF = ncread('be362.jan-dec_dmeans_ts.years1-30.sf200850.nc',...
    'atmosphere_horizontal_streamfunction'); 
%
lat = ncread('be362.jan-dec_dmeans_ts.years1-30.sf200850.nc','latitude_2');
%
lon = ncread('be362.jan-dec_dmeans_ts.years1-30.sf200850.nc','longitude_2');
%
%Extracting only the 200 hPa level:
%
STRF = STRF(:,:,2,:); STRF = squeeze(STRF);
%
end
%
cd G:/Lais_jasmin/u-be362/data/STRF_200hPa
%
load STRF_200hPa%data calculated in windspharm by me
%
%Cutting the matrix for the tropics/extratropics region 
%(between 75°S and 75°N): 
%
lat = lat(12:134); lat1 = lat; lon1 = lon;
%
STRF = STRF(:,12:134,:);
%
[I,J,T] = size(STRF);
%
L = 360;%days in a year
%
K = T/L;%years
%Example: Plotting the STRF of the day 10:
%
figure
south = -75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,STRF(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',6,3);
title('STRF day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;
%OK!
%
%STRF zonally assymetric:
STRF_m = nanmean(STRF,1);
for k = 1:T
    STRF(:,:,k) = STRF(:,:,k) - STRF_m(:,:,k);
end

clear STRF_m;

%Calculating the daily STRF climatology:
%
STRF = reshape(STRF,I*J,L,K);
%
STRFC = nanmean(STRF,3);
%
%Applying the 31-day moving mean
%
cd G:/lais_jasmin/functions
%
%Copying the last 15 series values at the beginning and the first 
%15 series values at the end:
%
STRFC = [STRFC(:,346:end) STRFC STRFC(:,1:15)];
%
%Moving mean:
%
STRFC = STRFC';
%
for j = 1:(I*J)
a(:,j) = mediamovel_centrada(STRFC(:,j),31);
end
%
STRFC = a; STRFC = STRFC'; clear a;
%
STRFC = STRFC(:,16:end-15);
%
STRFC = reshape(STRFC,I,J,L);
%
%Example: Plotting the climatology daily STRF of the day 10:
%10th January
%
figure
south = -75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,STRFC(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',6,3);
title('STRFC day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;
%OK!
%
%Calculating the daily STRF anomalies:
%
STRFC = reshape(STRFC,I*J,L);
%
STRFA = STRF*NaN;
%
for k = 1:K
STRFA(:,:,k) = STRF(:,:,k) - STRFC(:,:);
end
%
%Rearranging the data:
%
clear STRF; clear STRFC;
%
STRFA = reshape(STRFA,I*J,T); STRFA = reshape(STRFA,I,J,T);
%
%Example: Plotting the STRF anomaly of day 10:
%
figure
south = -35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,STRFA(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',6,3);
title('STRFA day 10','Fontsize',14,'visible','on','fontweight','bold');
colormap('jet'); colorbar;
%
clearvars -except STRFA lat lon lat1 lon1 I J T K L;
%
%Applying the Lanczos filter:
%
STRFA = reshape(STRFA,I*J,T);
STRFA = STRFA';
%
for j = 1:I*J
[Y(:,j),coef,window,Cx,Ff] = lanczosfilter(STRFA(:,j),1,0.05,211.1,'low');
%removing frequencies greater than 0.05
end
%
for j = 1:I*J
[Z(:,j),coef,window,Cx,Ff] = lanczosfilter(Y(:,j),1,0.01,211.1,'high');
%removing frequencies between 0 and 0.01
end
%
clear Y;
plot(STRFA(:,116));
hold on
plot(Z(:,116));%OK!
%
STRFA = Z; 
clear Z coef window Cx Ff; 
STRFA = STRFA';
%
%Using only DJF for the analyses envolving ERA data and its climatology:
%
%DJF anom:
STRFA = reshape(STRFA,I*J,L,K);
%
STRFA = cat(2,STRFA(:,1:60,:),STRFA(:,331:end,:));
%
%new L:
L = 90;%days in DJF
%
%new T:
T = K*L;
%
STRFA = reshape(STRFA,I,J,T);
%
cd G:/Lais_jasmin/u-be362/data/STRF_200hPa
save('STRFA_200hPa','STRFA','lat','lon','lat1','lon1','I',...
    'J','T','K','L','-v7.3');
cd G:/Lais_jasmin/u-be362/scripts


