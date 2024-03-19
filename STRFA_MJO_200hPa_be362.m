%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Calculating the daily STRF anomalies                        %
%                    in each MJO phase for DJF                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean');
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
cd G:/Lais_jasmin/u-be362/data/STRF_200hPa
%
load STRFA_200hPa;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if 1 ==2
cd G:/nc_files/u-be362

ncdisp('STRFA_200hPa_DJF_be362.nc')

STRFA = ncread('STRFA_200hPa_DJF_be362.nc','unknown');

lat = ncread('STRFA_200hPa_DJF_be362.nc','latitude_2'); lat1 = lat;

lon = ncread('STRFA_200hPa_DJF_be362.nc','longitude_2'); lon1 = lon;

[I,J,T] = size(STRFA);
L = 90;%days in DJF
K = T/L;%years
cd G:/Lais_jasmin/u-be362/data/STRF_200hPa
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
STRFA = reshape(STRFA,I*J,T);
%
STRFA = STRFA';
%
STRFA_DJF = STRFA;%sample for all days in DJF for student t-test
%
save('STRFA_200hPa_DJF','STRFA_DJF','-v7.3'); clear STRFA_DJF;
%
%Putting NaN in STRFA when the MJO is inactive (amplitude < 1)
%
for j = 1:I*J
for i = 1:T
if amp(i) < 1
STRFA(i,j) = NaN;
end
end
end
%
%Separating STRFA according to the MJO phases:
%
%MJO phase 1-------------------
%
STRFA_MJO_1 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 1
        STRFA_MJO_1(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(STRFA_MJO_1(:,1)));
%
for i = a(:)
STRFA_MJO_1(a,:) = [];
end
%
%MJO phase 2-------------------
%
STRFA_MJO_2 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 2
        STRFA_MJO_2(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(STRFA_MJO_2(:,1)));
%
for i = a(:)
STRFA_MJO_2(a,:) = [];
end
%
%MJO phase 3-------------------
%
STRFA_MJO_3 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 3
        STRFA_MJO_3(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(STRFA_MJO_3(:,1)));
%
for i = a(:)
STRFA_MJO_3(a,:) = [];
end
%
%MJO phase 4-------------------
%
STRFA_MJO_4 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 4
        STRFA_MJO_4(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(STRFA_MJO_4(:,1)));
%
for i = a(:)
STRFA_MJO_4(a,:) = [];
end
%
%MJO phase 5-------------------
%
STRFA_MJO_5 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 5
        STRFA_MJO_5(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(STRFA_MJO_5(:,1)));
%
for i = a(:)
STRFA_MJO_5(a,:) = [];
end
%
%MJO phase 6-------------------
%
STRFA_MJO_6 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 6
        STRFA_MJO_6(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(STRFA_MJO_6(:,1)));
%
for i = a(:)
STRFA_MJO_6(a,:) = [];
end
%
%MJO phase 7-------------------
%
STRFA_MJO_7 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 7
        STRFA_MJO_7(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(STRFA_MJO_7(:,1)));
%
for i = a(:)
STRFA_MJO_7(a,:) = [];
end
%
%MJO phase 8-------------------
%
STRFA_MJO_8 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 8
        STRFA_MJO_8(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(isnan(STRFA_MJO_8(:,1)));
%
for i = a(:)
STRFA_MJO_8(a,:) = [];
end
%
%Finding the number of days in each MJO phase in DJF:
%
[T1,n] = size(STRFA_MJO_1); [T2,n] = size(STRFA_MJO_2);
%
[T3,n] = size(STRFA_MJO_3); [T4,n] = size(STRFA_MJO_4);
%
[T5,n] = size(STRFA_MJO_5); [T6,n] = size(STRFA_MJO_6);
%
[T7,n] = size(STRFA_MJO_7); [T8,n] = size(STRFA_MJO_8);
%
n = [T1 T2 T3 T4 T5 T6 T7 T8];
%
save('STRFA_200hPa_MJO','STRFA_MJO_1','STRFA_MJO_2',...
    'STRFA_MJO_3','STRFA_MJO_4','STRFA_MJO_5','STRFA_MJO_6',...
    'STRFA_MJO_7','STRFA_MJO_8','n','lat','lon','lat1','lon1',...
    'I','J','T','K','L','-v7.3');
cd G:/Lais_jasmin/u-be362/scripts








































