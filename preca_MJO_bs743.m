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
cd G:/Lais_jasmin/u-bs743/data/prec
%
load preca
%load preca_EN
%load preca_LN
%load preca_NT
%
preca = reshape(preca,I*J,T);
%
preca = preca';
%
preca_DJF = preca;%sample for all days in DJF for student t-test
%
save('preca_DJF','preca_DJF','-v7.3'); clear preca_DJF;
%
cd G:/Lais_jasmin/u-bs743/data/prec
%
save('preca_MJO','preca','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/prec
