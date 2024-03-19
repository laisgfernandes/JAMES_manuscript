%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Calculating the daily u-wind (850 hPa)                     %                                            
%                   anomalies over the tropics                            %                                                           
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
ncdisp('be362.jan-dec_dmeans_ts.years1-30.u200850.nc');
%360-day calendar. The year is made of 12 months, each of which has 30 days  
%10800 days in 30 years (30 * 360 = 10800)
%
u = ncread('be362.jan-dec_dmeans_ts.years1-30.u200850.nc',...
    'eastward_wind'); 
%
lat = ncread('be362.jan-dec_dmeans_ts.years1-30.u200850.nc','latitude_2');
%
lon = ncread('be362.jan-dec_dmeans_ts.years1-30.u200850.nc','longitude_2');
%
%Extracting only the 200 hPa level:
%
u = u(:,:,2,:); u = squeeze(u);
%
%Cutting the matrix for the tropics region:
%
lat = lat(45:101); lat1 = lat;
lon1 = lon;
%
u = u(:,45:101,:);
%
[I,J,T] = size(u);
%
L = 360;%days in a year
%
K = T/L;%years
%
%Calculating the daily u-wind climatology:
%
u = reshape(u,I*J,L,K);
%
uc = nanmean(u,3);
%
%Applying the 31-day moving mean
%
cd G:/Lais_jasmin/functions;
%
%Copying the last 15 series values at the beginning and the first 
%15 series values at the end:
%
uc = [uc(:,346:end) uc uc(:,1:15)];
%
%Moving mean:
%
uc = uc';
%
for j = 1:(I*J)
a(:,j) = mediamovel_centrada(uc(:,j),31);
end
%
uc = a; uc = uc'; clear a;
%
uc = uc(:,16:end-15);
%
uc = reshape(uc,I,J,L);
%
%Calculating the daily olr anomalies:
%
uc = reshape(uc,I*J,L);
%
ua = u*NaN;
%
for k = 1:K
ua(:,:,k) = u(:,:,k) - uc(:,:);
end
%
%Rearranging the data:
%
clear u; clear uc;
%
ua = reshape(ua,I*J,T); ua = reshape(ua,I,J,T);
%
%Applying the Lanczos filter:
%
ua = reshape(ua,I*J,T);
ua = ua';
%
for j = 1:I*J
[Y(:,j),coef,window,Cx,Ff] = lanczosfilter(ua(:,j),1,0.05,211.1,'low');
%removing frequencies greater than 0.05
end
%
for j = 1:I*J
[Z(:,j),coef,window,Cx,Ff] = lanczosfilter(Y(:,j),1,0.01,211.1,'high');
%removing frequencies between 0 and 0.01
end
%
clear Y;
plot(ua(:,116));
hold on
plot(Z(:,116));%OK!
%
ua = Z; 
clear Z coef window Cx Ff; 
ua = ua';
%
%Using only DJF for the analyses envolving u-be362 simulation and its
%climatology:
%
%DJF anom:
ua = reshape(ua,I*J,L,K);
%
ua = cat(2,ua(:,1:60,:),ua(:,331:end,:));
%
%new L:
L = 90;%days in DJF
%
%new T:
T = K*L;
%
ua = reshape(ua,I,J,T);
%
cd G:/Lais_jasmin/u-be362/data/u_200hPa
save('ua_200hPa','ua','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
cd G:/Lais_jasmin/u-be362/scripts

