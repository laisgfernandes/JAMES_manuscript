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
cd G:/Lais_jasmin/u-bs743/data/olr
%
load olra
%
olra = reshape(olra,I*J,T);
%
olra = olra';
%
olra_DJF = olra;%sample for all days in DJF for student t-test
%
save('olra_DJF','olra_DJF','-v7.3'); clear olra_DJF;
%
save('olra_MJO','olra','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/olr
