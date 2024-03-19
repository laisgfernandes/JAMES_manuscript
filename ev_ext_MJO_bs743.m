%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              MJO amp and phase in each ENSO phase                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/ev_ext
%
load ev_extr 
%
ev_extr = ev_extr';
%
ev_extr_DJF = ev_extr; %sample for all days in DJF for student t-test
%
cd G:/Lais_jasmin/u-bs743/data/ev_ext
%
save('ev_extr_DJF','ev_extr_DJF','-v7.3'); clear ev_extr_DJF;
%
cd G:/Lais_jasmin/u-bs743/data/ev_ext
%
save('ev_extr_MJO','ev_extr','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/prec















