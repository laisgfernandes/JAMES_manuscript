%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Preparing data to separate in each ENSO phase                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:/Users/Laís/Desktop/tese/scripts/Plot');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_geral');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_ocean');
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/STRF_850hPa
%
load STRFA_850hPa
%
STRFA = reshape(STRFA,I*J,T);
%
STRFA = STRFA';
%
STRFA_DJF = STRFA;%sample for all days in DJF for student t-test
%
save('STRFA_850hPa_DJF','STRFA_DJF','-v7.3'); clear STRFA_DJF;
%
save('STRFA_850hPa_MJO','STRFA','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/STRF_850hPa
