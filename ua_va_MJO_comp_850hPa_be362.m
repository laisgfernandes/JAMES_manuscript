%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Composites of daily wind anomalies over the tropics           %
%                        in each MJO phase for DJF                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:/Users/Laís/Desktop/tese/scripts/Plot');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_geral');
path(path,'C:/Users/Laís/Desktop/tese/scripts/toolbox_ocean');
%
clc
clear
%
cd G:/Lais_jasmin/u-be362/data/u_850hPa;
load ua_MJO_comp; 
cd G:/Lais_jasmin/u-be362/data/v_850hPa;
load va_MJO_comp;
%
%MJO_01--------------------------------------------------------------------
%
fig = figure;
axes( 'Position', [ 0.10 0.87 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
plotvec_uv0(x,y,ua_MJO_m(:,:,1)',va_MJO_m(:,:,1)',4,5,0.15);
vecscale_uv_teste(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'1','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO_02--------------------------------------------------------------------
%
axes( 'Position', [ 0.10 0.75 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
plotvec_uv0(x,y,ua_MJO_m(:,:,2)',va_MJO_m(:,:,2)',4,5,0.15);
vecscale_uv_teste(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'2','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO_03--------------------------------------------------------------------
%
axes( 'Position', [ 0.10 0.63 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
plotvec_uv0(x,y,ua_MJO_m(:,:,3)',va_MJO_m(:,:,3)',4,5,0.15);
vecscale_uv_teste(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'3','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO_04--------------------------------------------------------------------
%
axes( 'Position', [ 0.10 0.51 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
plotvec_uv0(x,y,ua_MJO_m(:,:,4)',va_MJO_m(:,:,4)',4,5,0.15);
vecscale_uv_teste(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'4','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO_05--------------------------------------------------------------------
%
axes( 'Position', [ 0.10 0.39 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
plotvec_uv0(x,y,ua_MJO_m(:,:,5)',va_MJO_m(:,:,5)',4,5,0.15);
vecscale_uv_teste(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'5','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO_06--------------------------------------------------------------------
%
axes( 'Position', [ 0.10 0.27 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
plotvec_uv0(x,y,ua_MJO_m(:,:,6)',va_MJO_m(:,:,6)',4,5,0.15);
vecscale_uv_teste(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'6','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO_07--------------------------------------------------------------------
%
axes( 'Position', [ 0.10 0.15 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
plotvec_uv0(x,y,ua_MJO_m(:,:,7)',va_MJO_m(:,:,7)',4,5,0.15);
vecscale_uv_teste(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'7','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO_08--------------------------------------------------------------------
%
axes( 'Position', [ 0.10 0.03 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global('',6,3);
%
plotvec_uv0(x,y,ua_MJO_m(:,:,8)',va_MJO_m(:,:,8)',4,5,0.15);
vecscale_uv_teste(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'8','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
orient(fig,'tall');
cd G:/Lais_jasmin/u-be362/figs;
print(fig,'WIND_850hPa.png','-dpng');
cd G:/Lais_jasmin/u-be362/scripts;