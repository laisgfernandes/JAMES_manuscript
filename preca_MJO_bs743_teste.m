%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              MJO amp and phase in each ENSO phase                       %
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
ncdisp('bs743.jan-dec_dmeans_ts.years1-60.rmm_indices.nc')
%360-day calendar. The year is made of 12 months, each of which has 30 days  
%21600 days in 60 years (30 * 360 = 21600)
%
% rmm1 = ncread('bs743.jan-dec_dmeans_ts.years1-60.rmm_indices.nc',...
%     'rmm1');
% 
% rmm2 = ncread('bs743.jan-dec_dmeans_ts.years1-60.rmm_indices.nc',...
%     'rmm2');
% 
% time = ncread('bs743.jan-dec_dmeans_ts.years1-60.rmm_indices.nc',...
%     'time');
amp = ncread('bs743.jan-dec_dmeans_ts.years1-60.rmm_indices.nc',...
    'amplitude'); 
%
phase = ncread('bs743.jan-dec_dmeans_ts.years1-60.rmm_indices.nc',...
    'phase'); 
%
cd G:/Lais_jasmin/u-bs743/data/prec
%
load preca
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
preca = reshape(preca,I*J,T);
%
preca = preca';
%
preca_DJF = preca;%sample for all days in DJF for student t-test
%
save('preca_DJF','preca_DJF','-v7.3'); clear preca_DJF;
%
%Creating amplitude and phase for EN/LN/NT:
%
cd G:/Lais_jasmin/u-bs743/data/ENSO
%
load ENSO
%
%El Nino:
%amplitude
amp_EN = reshape(amp,L,K); 
%
EN_JF = EN+1;
%
y = 1:60;
%
EN_DJF = [EN EN_JF]; EN_DJF = sort(EN_DJF);
%
EN_diff = setdiff(y,EN_DJF); 
%
for i = 1:20
    amp_EN(:,EN_diff(i)) = NaN;
end
%
for i = 1:20
    amp_EN(1:60,EN(i)) = NaN;% Only December
end
%
for i = 1:20
    amp_EN(61:end,EN_JF(i)) = NaN;% Only January and February
end
%
amp_EN = reshape(amp_EN,T,1);
%
%Use LN and NT for SON, for instance
%
%phase:
%
phase = single(phase);
%
phase_EN = reshape(phase,L,K); 
%
for i = 1:20
    phase_EN(:,EN_diff(i)) = NaN;
end
%
for i = 1:20
    phase_EN(1:60,EN(i)) = NaN;% Only December
end
%
for i = 1:20
    phase_EN(61:end,EN_JF(i)) = NaN;% Only January and February
end
%
phase_EN = reshape(phase_EN,T,1);
%
%La Nina:
%amplitude
amp_LN = reshape(amp,L,K); 
%
LN_JF = LN+1;
%
LN_DJF = [LN LN_JF]; LN_DJF = sort(LN_DJF);
%
LN_diff = setdiff(y,LN_DJF);
%
for i = 1:20
    amp_LN(:,LN_diff(i)) = NaN;
end
%
for i = 1:20
    amp_LN(1:60,LN(i)) = NaN;% Only December
end
%
for i = 1:20
    amp_LN(61:end,LN_JF(i)) = NaN;% Only January and February
end
%
amp_LN = reshape(amp_LN,T,1);
%
%Use EN and NT for SON, for instance
%
%phase:
%
phase_LN = reshape(phase,L,K); 
%
for i = 1:20
    phase_LN(:,LN_diff(i)) = NaN;
end
%
for i = 1:20
    phase_LN(1:60,LN(i)) = NaN;% Only December
end
%
for i = 1:20
    phase_LN(61:end,LN_JF(i)) = NaN;% Only January and February
end
%
phase_LN = reshape(phase_LN,T,1);
%
%Neutral:
%amplitude
NT(end) = [];
amp_NT = reshape(amp,L,K); 
%
NT_JF = NT+1; 
%
NT_DJF = [NT NT_JF]; NT_DJF = sort(NT_DJF);
%
NT_diff = setdiff(y,NT_DJF);
%
for i = 1:22
    amp_NT(:,NT_diff(i)) = NaN;
end
%
for i = 1:19
    amp_NT(1:60,NT(i)) = NaN;% Only December
end
%
for i = 1:19
    amp_NT(61:end,NT_JF(i)) = NaN;% Only January and February
end
%
amp_NT = reshape(amp_NT,T,1);
%
%phase:
%
phase_NT = reshape(phase,L,K); 
%
for i = 1:22
    phase_NT(:,NT_diff(i)) = NaN;
end
%
for i = 1:19
    phase_NT(1:60,NT(i)) = NaN;% Only December
end
%
for i = 1:19
    phase_NT(61:end,NT_JF(i)) = NaN;% Only January and February
end
%
phase_NT = reshape(phase_NT,T,1);
%
save('MJO','amp_EN','amp_LN','amp_NT','phase_EN','phase_LN','phase_NT','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/data/prec
%
save('preca_MJO','preca','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/prec
