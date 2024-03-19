%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Joining the daily                            %
%                   streamfunction (200 hPa) of all years                 %                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean');
%
clc
clear
%
cd G:/nc_files/sf_files/u-be362_200hPa
%
ncdisp('sf_1982.nc');
%
STRF = ncread('sf_1982.nc','atmosphere_horizontal_streamfunction'); 
STRF = squeeze(STRF);
%
lat = ncread('sf_1982.nc','latitude_2'); lat1 = lat;
%
lon = ncread('sf_1982.nc','longitude_2'); lon1 = lon;
%
STRF_n = ncread('sf_1983.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1984.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1985.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1986.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1987.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1988.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1989.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1990.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1991.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1992.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1993.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1994.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1995.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1996.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1997.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1998.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_1999.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2000.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2001.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2002.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2003.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2004.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2005.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2006.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2007.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2008.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2009.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2010.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
STRF_n = ncread('sf_2011.nc','atmosphere_horizontal_streamfunction'); 
STRF_n = squeeze(STRF_n);
STRF = cat(3,STRF,STRF_n);
%
cd G:/Lais_jasmin/u-be362/data/STRF_200hPa
save('STRF_200hPa','STRF','lat','lon','lat1','lon1','-v7.3');
cd G:/Lais_jasmin/u-be362/scripts




