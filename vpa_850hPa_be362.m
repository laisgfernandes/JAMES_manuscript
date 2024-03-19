%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Calculating the daily                               %
%                  velocity potential anomalies                           %                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean');
%
clc
clear
%
cd G:/nc_files/vp_files/u-be362
%
ncdisp('be362.jan-dec_dmeans_ts.years1-30.vp850.nc');
startLoc = [1 1 1]; 
count  = [192 59 10800];

vp = ncread('be362.jan-dec_dmeans_ts.years1-30.vp850.nc',...
    'atmosphere_horizontal_velocity_potential', startLoc, count);
lat = ncread('be362.jan-dec_dmeans_ts.years1-30.vp850.nc','latitude_2'); lat1 = lat; 
lon = ncread('be362.jan-dec_dmeans_ts.years1-30.vp850.nc','longitude_2'); lon1 = lon;
%
[I,J,T] = size(vp);
%
L = 360;%days in a year
%
K = T/L;%years
%
%Calculating the daily vp climatology:
%
vp = reshape(vp,I*J,L,K);
%
vpc = nanmean(vp,3);
%
%Applying the 31-day moving mean
%
cd G:/Lais_jasmin/functions
%
%Copying the last 15 series values at the beginning and the first 
%15 series values at the end:
%
vpc = [vpc(:,346:end) vpc vpc(:,1:15)];
%
%Moving mean:
%
vpc = vpc';
%
for j = 1:(I*J)
a(:,j) = mediamovel_centrada(vpc(:,j),31);
end
%
vpc = a; vpc = vpc'; clear a;
%
vpc = vpc(:,16:end-15);
%
vpc = reshape(vpc,I,J,L);
%
%Calculating the daily u-wind anomalies:
%
vpc = reshape(vpc,I*J,L);
%
vpa = vp*NaN;
%
for k = 1:K
vpa(:,:,k) = vp(:,:,k) - vpc(:,:);
end
%
%Rearranging the data:
%
clear vp; clear vpc;
%
vpa = reshape(vpa,I*J,T); vpa = reshape(vpa,I,J,T);
%
%Applying the Lanczos filter:
%
vpa = reshape(vpa,I*J,T);
vpa = vpa';
%
for j = 1:I*J
[Y(:,j),coef,window,Cx,Ff] = lanczosfilter(vpa(:,j),1,0.05,211.1,'low');
%removing frequencies greater than 0.05
end
%
for j = 1:I*J
[Z(:,j),coef,window,Cx,Ff] = lanczosfilter(Y(:,j),1,0.01,211.1,'high');
%removing frequencies between 0 and 0.01
end
%
clear Y;
plot(vpa(:,116));
hold on
plot(Z(:,116));%OK!
%
vpa = Z; 
clear Z coef window Cx Ff; 
vpa = vpa';
%
%Using only DJF for the analyses envolving ERA data and its climatology:
%
%DJF anom:
vpa = reshape(vpa,I*J,L,K);
%
vpa = cat(2,vpa(:,1:60,:),vpa(:,331:end,:));
%
%new L:
L = 90;%days in DJF
%
%new T:
T = K*L;
%
vpa = reshape(vpa,I,J,T);
%
cd G:/Lais_jasmin/u-be362/data/vp_850hPa
save('vpa_850hPa','vpa','lat','lon','lat1','lon1','I',...
    'J','T','K','L','-v7.3');
cd G:/Lais_jasmin/u-be362/scripts



