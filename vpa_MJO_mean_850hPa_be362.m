%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Calculating the t-student test                       %
%                            for vp anomalies                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean');
%
clc
clear
%
cd G:/Lais_jasmin/u-be362/data/vp_850hPa
%
load vpa_850hPa_MJO; load vpa_DJF;
%
%Calculating the mean:
%
%Building a matrix with all MJO phases together:
%
m = max(n);% maximum for phase 3
%
dif = m - n;
%
vpa_MJO_1 = [vpa_MJO_1(:,:); NaN(dif(1),I*J)];
%
vpa_MJO_2 = [vpa_MJO_2(:,:); NaN(dif(2),I*J)];
%
vpa_MJO_4 = [vpa_MJO_4(:,:); NaN(dif(4),I*J)];
%
vpa_MJO_5 = [vpa_MJO_5(:,:); NaN(dif(5),I*J)];
%
vpa_MJO_6 = [vpa_MJO_6(:,:); NaN(dif(6),I*J)];
%
vpa_MJO_7 = [vpa_MJO_7(:,:); NaN(dif(7),I*J)];
%
vpa_MJO_8 = [vpa_MJO_8(:,:); NaN(dif(8),I*J)];
%
vpa_MJO = cat(3,vpa_MJO_1,vpa_MJO_2,vpa_MJO_3,vpa_MJO_4,...
    vpa_MJO_5,vpa_MJO_6,vpa_MJO_7,vpa_MJO_8);
%
%MJO--------------------
%
vpa_MJO_m = NaN(I*J,8);
%
for k = 1:8
    for j = 1:I*J
vpa_MJO_m(j,k) = nanmean(vpa_MJO(:,j,k));
    end
end
% 
vpa_MJO_m = reshape(vpa_MJO_m,I,J,8); 
%
cd G:/Lais_jasmin/u-be362/data/vp_850hPa
save('vpa_850hPa_MJO_comp','vpa_MJO_m','lat','lon',...
    'lat1','lon1','-v7.3');
%
cd G:/Lais_jasmin/u-be362/scripts
%








