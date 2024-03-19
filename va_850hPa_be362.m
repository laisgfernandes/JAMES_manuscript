%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Calculating the daily v-wind                         %
%                anomalies over the tropics (850 hPa)                     %                   
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
ncdisp('be362.jan-dec_dmeans_ts.years1-30.v200850.nc');
%360-day calendar. The year is made of 12 months, each of which has 30 days  
%10800 days in 30 years (30 * 360 = 10800)
%
v = ncread('be362.jan-dec_dmeans_ts.years1-30.v200850.nc',...
    'northward_wind'); 
%
lat = ncread('be362.jan-dec_dmeans_ts.years1-30.v200850.nc','latitude_2');
%
lon = ncread('be362.jan-dec_dmeans_ts.years1-30.v200850.nc','longitude_2');
%
%Extracting only the 850 hPa level:
%
v = v(:,:,1,:); v = squeeze(v);
%
%Cutting the matrix for the tropics region:
%
lat = lat(45:101); lat1 = lat;
lon1 = lon;
%
v = v(:,45:101,:);
%
[I,J,T] = size(v);
%
L = 360;%days in a year
%
K = T/L;%years
%
%Calculating the daily v-wind climatology:
%
v = reshape(v,I*J,L,K);
%
vc = nanmean(v,3);
%
%Applying the 31-day moving mean
%
cd G:/Lais_jasmin/functions
%
%Copying the last 15 series values at the beginning and the first 
%15 series values at the end:
%
vc = [vc(:,346:end) vc vc(:,1:15)];
%
%Moving mean:
%
vc = vc';
%
for j = 1:(I*J)
a(:,j) = mediamovel_centrada(vc(:,j),31);
end
%
vc = a; vc = vc'; clear a;
%
vc = vc(:,16:end-15);
%
vc = reshape(vc,I,J,L);
%
%Calculating the daily olr anomalies:
%
vc = reshape(vc,I*J,L);
%
va = v*NaN;
%
for k = 1:K
va(:,:,k) = v(:,:,k) - vc(:,:);
end
%
%Rearranging the data:
%
clear v; clear vc;
%
va = reshape(va,I*J,T); va = reshape(va,I,J,T);
%
%Applying the Lanczos filter:
%
va = reshape(va,I*J,T);
va = va';
%
for j = 1:I*J
[Y(:,j),coef,window,Cx,Ff] = lanczosfilter(va(:,j),1,0.05,211.1,'low');
%removing frequencies greater than 0.05
end
%
for j = 1:I*J
[Z(:,j),coef,window,Cx,Ff] = lanczosfilter(Y(:,j),1,0.01,211.1,'high');
%removing frequencies between 0 and 0.01
end
%
clear Y;
plot(va(:,116));
hold on
plot(Z(:,116));%OK!
%
va = Z; 
clear Z coef window Cx Ff; 
va = va';
%
%Using only DJF for the analyses envolving u-be362 simulation and its
%climatology:
%
%DJF anom:
va = reshape(va,I*J,L,K);
%
va = cat(2,va(:,1:60,:),va(:,331:end,:));
%
%new L:
L = 90;%days in DJF
%
%new T:
T = K*L;
%
va = reshape(va,I,J,T);
%
cd G:/Lais_jasmin/u-be362/data/v_850hPa
save('va','va','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
cd G:/Lais_jasmin/u-be362/scripts