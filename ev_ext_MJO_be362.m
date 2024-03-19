%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Calculating the mean number of extreme events for DJF         %
%                         and for each MJO phase                          %                                                                                                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clc
clear
%
cd G:/Lais_jasmin/u-be362/data/ev_ext
%
load ev_extr
%
%Extreme events average for each MJO phase for each gridpoint:
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
ev_extr = ev_extr';
%
ev_extr_DJF = ev_extr; %sample for all days in DJF for student t-test
%
cd G:/Lais_jasmin/u-be362/data/ev_ext
%
save('ev_extr_DJF','ev_extr_DJF','-v7.3'); clear ev_extr_DJF;
%
%Putting NaN in ev_extr when the MJO is inactive (amplitude < 1)
%
for j = 1:I*J
for i = 1:T
if amp(i) < 1
ev_extr(i,j) = NaN;
end
end
end
%
%Separating ev_extr according to the MJO phases:
%
%MJO phase 1-------------------
%
ev_extr_MJO_1 = ev_extr;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 1
        ev_extr_MJO_1(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase(:) ~= 1); b = find(amp(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
ev_extr_MJO_1(c,:) = [];
end
%
%MJO phase 2-------------------
%
ev_extr_MJO_2 = ev_extr;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 2
        ev_extr_MJO_2(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase(:) ~= 2); b = find(amp(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
ev_extr_MJO_2(c,:) = [];
end
%
%MJO phase 3-------------------
%
ev_extr_MJO_3 = ev_extr;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 3
        ev_extr_MJO_3(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase(:) ~= 3); b = find(amp(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
ev_extr_MJO_3(c,:) = [];
end
%
%MJO phase 4-------------------
%
ev_extr_MJO_4 = ev_extr;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 4
        ev_extr_MJO_4(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase(:) ~= 4); b = find(amp(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
ev_extr_MJO_4(c,:) = [];
end
%
%MJO phase 5-------------------
%
ev_extr_MJO_5 = ev_extr;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 5
        ev_extr_MJO_5(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase(:) ~= 5); b = find(amp(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
ev_extr_MJO_5(c,:) = [];
end
%
%MJO phase 6-------------------
%
ev_extr_MJO_6 = ev_extr;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 6
        ev_extr_MJO_6(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase(:) ~= 6); b = find(amp(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
ev_extr_MJO_6(c,:) = [];
end
%
%MJO phase 7-------------------
%
ev_extr_MJO_7 = ev_extr;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 7
        ev_extr_MJO_7(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase(:) ~= 7); b = find(amp(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
ev_extr_MJO_7(c,:) = [];
end
%
%MJO phase 8-------------------
%
ev_extr_MJO_8 = ev_extr;
%
for j = 1:I*J
for i = 1:T
    if phase(i) ~= 8
        ev_extr_MJO_8(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase(:) ~= 8); b = find(amp(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
%
for i = c(:)
ev_extr_MJO_8(c,:) = [];
end
%
%Finding the number of days in each MJO phase in DJF:
%
[T1,n] = size(ev_extr_MJO_1); [T2,n] = size(ev_extr_MJO_2);
%
[T3,n] = size(ev_extr_MJO_3); [T4,n] = size(ev_extr_MJO_4);
%
[T5,n] = size(ev_extr_MJO_5); [T6,n] = size(ev_extr_MJO_6);
%
[T7,n] = size(ev_extr_MJO_7); [T8,n] = size(ev_extr_MJO_8);
%
n = [T1 T2 T3 T4 T5 T6 T7 T8];
%
save('ev_extr_MJO','ev_extr_MJO_1','ev_extr_MJO_2',...
    'ev_extr_MJO_3','ev_extr_MJO_4','ev_extr_MJO_5','ev_extr_MJO_6',...
    'ev_extr_MJO_7','ev_extr_MJO_8','n','lat','lon','lat1','lon1',...
    'I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-be362/scripts




