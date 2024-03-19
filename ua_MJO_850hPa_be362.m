%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Calculating the daily u anomalies over the tropics             %
%                      in each MJO phase for DJF                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:/Users/Laís/Desktop/tese/scripts/Plot');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_geral');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_ocean');
%
clc
clear
%
cd G:/for_lais
%
ncdisp('be362.jan-dec_dmeans_ts.years1-30.rmm_indices.nc')
%360-day calendar. The year is made of 12 months, each of which has 30 days  
%10800 days in 30 years (30 * 360 = 10800)
%
amp = ncread('be362.jan-dec_dmeans_ts.years1-30.rmm_indices.nc',...
    'amplitude'); 
%
phase = ncread('be362.jan-dec_dmeans_ts.years1-30.rmm_indices.nc',...
    'phase'); 
%
phase(1:120) = NaN(120,1);% problem first 120 values = 2
%
cd G:/Lais_jasmin/u-be362/data/u_850hPa;
%
load ua_850hPa
%
M = 360;%days in a year
%
amp = reshape(amp,M,K); phase = reshape(phase,M,K); 
%
%Reducing amp and phase for DJF:
%
amp = amp'; phase = phase';
%
amp = cat(2,amp(:,1:60),amp(:,331:end));
%
phase = cat(2,phase(:,1:60),phase(:,331:end));
%
amp = amp'; phase = phase';
%
amp = reshape(amp,T,1); phase = reshape(phase,T,1); 
%
ua = reshape(ua,I*J,T);
%
ua = ua';
%
ua_DJF = ua;%sample for all days in DJF for student t-test
%
save('ua_DJF','ua_DJF','-v7.3'); clear ua_DJF;
%
%Putting NaN in ua when the MJO is inactive (amplitude < 1)
%
for j = 1:I*J
for i = 1:T
if amp(i) < 1
ua(i,j) = NaN;
end
end
end
%
%Separating olra according to the MJO phases:
%
%MJO phase 1-------------------
%
ua_MJO_1 = ua;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 1
        ua_MJO_1(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(ua_MJO_1(:,1)));
%
for i = a(:)
ua_MJO_1(a,:) = [];
end
%
%MJO phase 2-------------------
%
ua_MJO_2 = ua;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 2
        ua_MJO_2(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(ua_MJO_2(:,1)));
%
for i = a(:)
ua_MJO_2(a,:) = [];
end
%
%MJO phase 3-------------------
%
ua_MJO_3 = ua;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 3
        ua_MJO_3(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(ua_MJO_3(:,1)));
%
for i = a(:)
ua_MJO_3(a,:) = [];
end
%
%MJO phase 4-------------------
%
ua_MJO_4 = ua;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 4
        ua_MJO_4(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(ua_MJO_4(:,1)));
%
for i = a(:)
ua_MJO_4(a,:) = [];
end
%
%MJO phase 5-------------------
%
ua_MJO_5 = ua;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 5
        ua_MJO_5(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(ua_MJO_5(:,1)));
%
for i = a(:)
ua_MJO_5(a,:) = [];
end
%
%MJO phase 6-------------------
%
ua_MJO_6 = ua;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 6
        ua_MJO_6(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(ua_MJO_6(:,1)));
%
for i = a(:)
ua_MJO_6(a,:) = [];
end
%
%MJO phase 7-------------------
%
ua_MJO_7 = ua;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 7
        ua_MJO_7(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(ua_MJO_7(:,1)));
%
for i = a(:)
ua_MJO_7(a,:) = [];
end
%
%MJO phase 8-------------------
%
ua_MJO_8 = ua;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 8
        ua_MJO_8(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(ua_MJO_8(:,1)));
%
for i = a(:)
ua_MJO_8(a,:) = [];
end
%
%Finding the number of days in each MJO phase in DJF:
%
[T1,n] = size(ua_MJO_1); [T2,n] = size(ua_MJO_2);
%
[T3,n] = size(ua_MJO_3); [T4,n] = size(ua_MJO_4);
%
[T5,n] = size(ua_MJO_5); [T6,n] = size(ua_MJO_6);
%
[T7,n] = size(ua_MJO_7); [T8,n] = size(ua_MJO_8);
%
n = [T1 T2 T3 T4 T5 T6 T7 T8];
%
save('ua_MJO','ua_MJO_1','ua_MJO_2','ua_MJO_3',...
'ua_MJO_4','ua_MJO_5','ua_MJO_6','ua_MJO_7','ua_MJO_8',...
'n','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-be362/scripts;



