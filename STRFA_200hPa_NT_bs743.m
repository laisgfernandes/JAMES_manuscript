%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Calculating the daily                             %                                                %
%                 streamfunction (STRF) anomalies                         %                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily climatology only in NT years
path(path,'C:\Users\La�s\Desktop\tese\scripts\Plot');
path(path,'C:\Users\La�s\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\La�s\Desktop\tese\scripts\toolbox_ocean');
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/STRF_200hPa
%
load STRF_200hPa%data calculated in windspharm by me
%
%Cutting the matrix for the tropics/extratropics region 
%(between 75�S and 75�N): 
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

%Calculating the daily STRF climatology in NT:
%
STRF = reshape(STRF,I*J,L,K);
%
cd G:/Lais_jasmin/u-bs743/data/ENSO

load ENSO

%Next year:
NT2 = NT+1; NT2(end)=[];

%for year 0:
STRF_NT = NaN(I*J,L,length(NT));

for i = 1:length(NT)
    STRF_NT(:,:,i) = STRF(:,:,NT(i));
    STRF_NT(:,1:180,i) = NaN;
end

%for year +1:
STRF_NT2 = NaN(I*J,L,length(NT2));

for i = 1:length(NT2)
    STRF_NT2(:,:,i) = STRF(:,:,NT2(i));
    STRF_NT2(:,181:end,i) = NaN;
end

STRF_NT = cat(3,STRF_NT,STRF_NT2); clear STRF_NT2;
STRFC_NT = nanmean(STRF_NT,3); clear STRF_NT;
%
%Applying the 31-day moving mean
%
cd G:/lais_jasmin/functions
%
%Copying the last 15 series values at the beginning and the first 
%15 series values at the end:
%
STRFC_NT = [STRFC_NT(:,346:end) STRFC_NT STRFC_NT(:,1:15)];
%
%Moving mean:
%
STRFC_NT = STRFC_NT';
%
for j = 1:(I*J)
a(:,j) = mediamovel_centrada(STRFC_NT(:,j),31);
end
%
STRFC_NT = a; STRFC_NT = STRFC_NT'; clear a;
%
STRFC_NT = STRFC_NT(:,16:end-15);
%
STRFC_NT = reshape(STRFC_NT,I,J,L);
%
%Example: Plotting the climatology daily STRF of the day 10:
%10th January
%
figure
south = -75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,STRFC_NT(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',6,3);
title('STRFC day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;
%OK!
%
%Calculating the daily STRF anomalies:
%
STRFC_NT = reshape(STRFC_NT,I*J,L);
%
STRFA = STRF*NaN;
%
for k = 1:K
STRFA(:,:,k) = STRF(:,:,k) - STRFC_NT(:,:);
end
%
%Rearranging the data:
%
clear STRF; clear STRFC_LN;
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
cd G:/Lais_jasmin/u-bs743/data/STRF_200hPa
save('STRFA_200hPa_NT','STRFA','lat','lon','lat1','lon1','I',...
    'J','T','K','L','-v7.3');
cd G:/Lais_jasmin/u-bs743/scripts/STRF_200hPa


