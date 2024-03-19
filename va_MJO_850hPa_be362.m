%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Calculating the daily v anomalies over the tropics            %
%                      in each MJO phase for DJF                          %                                  %
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
cd G:/Lais_jasmin/u-be362/data/v_850hPa;
%
load va
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
va = reshape(va,I*J,T);
%
va = va';
%
va_DJF = va;%sample for all days in DJF for student t-test
%
save('va_DJF','va_DJF','-v7.3'); clear va_DJF;
%
%Putting NaN in v-wind when the MJO is inactive (amplitude < 1)
%
for j = 1:I*J
for i = 1:T
if amp(i) < 1
va(i,j) = NaN;
end
end
end
%
%Separating olra according to the MJO phases:
%
%MJO phase 1-------------------
%
va_MJO_1 = va;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 1
        va_MJO_1(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(va_MJO_1(:,1)));
%
for i = a(:)
va_MJO_1(a,:) = [];
end
%
%MJO phase 2-------------------
%
va_MJO_2 = va;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 2
        va_MJO_2(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(va_MJO_2(:,1)));
%
for i = a(:)
va_MJO_2(a,:) = [];
end
%
%MJO phase 3-------------------
%
va_MJO_3 = va;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 3
        va_MJO_3(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(va_MJO_3(:,1)));
%
for i = a(:)
va_MJO_3(a,:) = [];
end
%
%MJO phase 4-------------------
%
va_MJO_4 = va;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 4
        va_MJO_4(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(va_MJO_4(:,1)));
%
for i = a(:)
va_MJO_4(a,:) = [];
end
%
%MJO phase 5-------------------
%
va_MJO_5 = va;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 5
        va_MJO_5(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(va_MJO_5(:,1)));
%
for i = a(:)
va_MJO_5(a,:) = [];
end
%
%MJO phase 6-------------------
%
va_MJO_6 = va;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 6
        va_MJO_6(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(va_MJO_6(:,1)));
%
for i = a(:)
va_MJO_6(a,:) = [];
end
%
%MJO phase 7-------------------
%
va_MJO_7 = va;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 7
        va_MJO_7(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(va_MJO_7(:,1)));
%
for i = a(:)
va_MJO_7(a,:) = [];
end
%
%MJO phase 8-------------------
%
va_MJO_8 = va;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 8
        va_MJO_8(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(va_MJO_8(:,1)));
%
for i = a(:)
va_MJO_8(a,:) = [];
end
%
%Finding the number of days in each MJO phase in DJF:
%
[T1,n] = size(va_MJO_1); [T2,n] = size(va_MJO_2);
%
[T3,n] = size(va_MJO_3); [T4,n] = size(va_MJO_4);
%
[T5,n] = size(va_MJO_5); [T6,n] = size(va_MJO_6);
%
[T7,n] = size(va_MJO_7); [T8,n] = size(va_MJO_8);
%
n = [T1 T2 T3 T4 T5 T6 T7 T8];
%
save('va_MJO','va_MJO_1','va_MJO_2','va_MJO_3',...
'va_MJO_4','va_MJO_5','va_MJO_6','va_MJO_7','va_MJO_8',...
'n','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-be362/scripts;



