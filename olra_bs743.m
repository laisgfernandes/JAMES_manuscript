%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Calculating the daily olr                           %                                       %
%                     anomalies over the tropics                          %                                            %                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:/Users/Laís/Desktop/tese/scripts/Plot');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_geral');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_ocean');
%
clc
clear
%
cd G:/for_lais;
%
ncdisp('bs743.jan-dec_dmeans_ts.years1-60.olr.nc');
%360-day calendar. The year is made of 12 months, each of which has 30 days  
%21600 days in 60 years (60 * 360 = 21600)
%
startLoc = [1 1 1]; 
count  = [192 144 21600];
%
olr = ncread('bs743.jan-dec_dmeans_ts.years1-60.olr.nc',...
    'UM_m01s03i332_vn1003'); 
%
lat = ncread('bs743.jan-dec_dmeans_ts.years1-60.olr.nc','latitude');
%
lon = ncread('bs743.jan-dec_dmeans_ts.years1-60.olr.nc','longitude');
%
%Cutting the matrix for the tropics region (between 35°S and 35°N):
%
lat = lat(43:102); lat1 = lat;
lon1 = lon;
%
olr = olr(:,43:102,:);
%
%Example: Plotting the olr for the day 10 only in the tropics:
%
figure
south = -35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,olr(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',6,3);
title('olr day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;
%OK!
%
[I,J,T] = size(olr);
%
L = 360;%days in a year
%
K = T/L;%years
%
%Calculating the daily olr climatology:
%
olr = reshape(olr,I*J,L,K);
%
olrc = nanmean(olr,3);
%
%Applying the 31-day moving mean
%
cd G:/Lais_jasmin/functions
%
%Copying the last 15 series values at the beginning and the first 
%15 series values at the end:
%
olrc = [olrc(:,346:end) olrc olrc(:,1:15)];
%
%Moving mean:
%
olrc = olrc';
%
for j = 1:(I*J)
a(:,j) = mediamovel_centrada(olrc(:,j),31);
end
%
olrc = a; olrc = olrc'; clear a;
%
olrc = olrc(:,16:end-15);
%
olrc = reshape(olrc,I,J,L);
%
%Example: Plotting the climatology daily olr for the day 10 only in the tropics:
%10th January
%
figure
south = -35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,olrc(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',6,3);
title('olrc day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;
%OK!
%
%Calculating the daily olr anomalies:
%
olrc = reshape(olrc,I*J,L);
%
olra = olr*NaN;
%
for k = 1:K
olra(:,:,k) = olr(:,:,k) - olrc(:,:);
end
%
%Rearranging the data:
%
clear olr; clear olrc;
%
olra = reshape(olra,I*J,T); olra = reshape(olra,I,J,T);
%
%Example: Plotting the daily olr anomaly of the day 10 only in the tropics:
%10th January
%
figure
south = -35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,olra(:,:,10)'); shading interp; hold on;
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',6,3);
title('olra day 10','Fontsize',16,'visible','on','fontweight','bold');
colormap('jet'); colorbar;
%OK!
%
clearvars -except olra lat lon lat1 lon1 I J T K L;
%
%Applying the Lanczos filter:
%
olra = reshape(olra,I*J,T);
olra = olra';
%
for j = 1:I*J
[Y(:,j),coef,window,Cx,Ff] = lanczosfilter(olra(:,j),1,0.05,211.1,'low');
%removing frequencies greater than 0.05
end
%
for j = 1:I*J
[Z(:,j),coef,window,Cx,Ff] = lanczosfilter(Y(:,j),1,0.01,211.1,'high');
%removing frequencies between 0 and 0.01
end
%
clear Y;
plot(olra(:,116));
hold on
plot(Z(:,116));%OK!
%
olra = Z; 
clear Z coef window Cx Ff; 
olra = olra';
%
%Using only DJF for the analyses envolving u-be362 simulation and its
%climatology:
%
%DJF anom:
olra = reshape(olra,I*J,L,K);
%
olra = cat(2,olra(:,1:60,:),olra(:,331:end,:));
%
%new L:
L = 90;%days in DJF
%
%new T:
T = K*L;
%
olra = reshape(olra,I,J,T);
%
cd G:/Lais_jasmin/u-bs743/data/olr
save('olra','olra','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
cd G:/Lais_jasmin/u-bs743/scripts/olr



