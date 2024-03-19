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
lat_ua = lat; lat1_ua = lat1; lon_ua = lon; lon1_ua = lon1;
%
cd G:/Lais_jasmin/u-be362/data/OLR;
load olra_MJO_comp
%
%MJO_7--------------------------------------------------------------------
fig = figure;
axes( 'Position', [ 0.10 0.82 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,7)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0.27 0.56 0.92
0.53 0.81 0.94
0.27 0.95 0.93
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,7)',[-25:5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,7)',[2.5:5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
title('(b) N96','Fontsize',24,'visible','on','fontweight','bold');
%
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon_ua,lat_ua]=meshgrid(lon1_ua,lat1_ua);[x_ua,y_ua]=m_ll2xy(lon_ua,lat_ua);
%
plotvec_uv_green(x_ua,y_ua,ua_MJO_m(:,:,7)',va_MJO_m(:,:,7)',4,5,0.15);
vecscale_uv_teste_green(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'7','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.42 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-95','-90','-85','85','90','95',''})
%
%MJO_8--------------------------------------------------------------------
axes( 'Position', [ 0.10 0.70 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,8)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0.27 0.56 0.92
0.53 0.81 0.94
0.27 0.95 0.93
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,8)',[-25:5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,8)',[2.5:5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon_ua,lat_ua]=meshgrid(lon1_ua,lat1_ua);[x_ua,y_ua]=m_ll2xy(lon_ua,lat_ua);
%
plotvec_uv_green(x_ua,y_ua,ua_MJO_m(:,:,8)',va_MJO_m(:,:,8)',4,5,0.15);
vecscale_uv_teste_green(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'8','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.42 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-95','-90','-85','85','90','95',''})
%
%MJO_1---------------------------------------------------------------------
axes( 'Position', [ 0.10 0.58 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,1)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0.27 0.56 0.92
0.53 0.81 0.94
0.27 0.95 0.93
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,1)',[-25:5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,1)',[2.5:5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon_ua,lat_ua]=meshgrid(lon1_ua,lat1_ua);[x_ua,y_ua]=m_ll2xy(lon_ua,lat_ua);
%
plotvec_uv_green(x_ua,y_ua,ua_MJO_m(:,:,1)',va_MJO_m(:,:,1)',4,5,0.15);
vecscale_uv_teste_green(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'1','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.42 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-95','-90','-85','85','90','95',''})
%
%MJO_3---------------------------------------------------------------------
axes( 'Position', [ 0.10 0.46 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,3)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0.27 0.56 0.92
0.53 0.81 0.94
0.27 0.95 0.93
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,3)',[-25:5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,3)',[2.5:5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global_NoX('',6,3);
%
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon_ua,lat_ua]=meshgrid(lon1_ua,lat1_ua);[x_ua,y_ua]=m_ll2xy(lon_ua,lat_ua);
%
plotvec_uv_green(x_ua,y_ua,ua_MJO_m(:,:,3)',va_MJO_m(:,:,3)',4,5,0.15);
vecscale_uv_teste_green(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'3','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.42 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-95','-90','-85','85','90','95',''})
%
%MJO_4---------------------------------------------------------------------
axes( 'Position', [ 0.10 0.34 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,4)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0.27 0.56 0.92
0.53 0.81 0.94
0.27 0.95 0.93
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,4)',[-25:5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,4)',[2.5:5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0.3 0.3 0.3],'linewidth',1.5);
m_grid_global('',6,3);
%
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon_ua,lat_ua]=meshgrid(lon1_ua,lat1_ua);[x_ua,y_ua]=m_ll2xy(lon_ua,lat_ua);
%
plotvec_uv_green(x_ua,y_ua,ua_MJO_m(:,:,4)',va_MJO_m(:,:,4)',4,5,0.15);
vecscale_uv_teste_green(15,-18,1,0,0.15)
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'4','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.42 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-95','-90','-85','85','90','95',''})
%
orient(fig,'tall');
cd G:/Lais_jasmin/u-be362/figs;
print(fig,'OLR_WIND_850hPa.png','-dpng');
cd G:/Lais_jasmin/u-be362/scripts;