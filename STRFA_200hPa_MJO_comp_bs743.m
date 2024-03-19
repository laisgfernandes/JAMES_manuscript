%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Composites of daily STRF anomalies                        %
%                     in each MJO phase for DJF                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean');
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/STRF_200hPa
%
%load STRFA_MJO_comp_EN
%load STRFA_MJO_comp_LN
load STRFA_MJO_comp_NT
%
%MJO_01--------------------------------------------------------------------
%
fig = figure;
axes( 'Position', [ 0.03 0.87 0.50 0.12 ] );
south =-75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,1)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0 0.26 0.87
0.17 0.40 0.76
0 0.5 0.5
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,1)',[-12*10^6:6*10^5:-12*10^4]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,1)',[12*10^4:6*10^5:12*10^6]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1);
m_grid_global_NoX('',4,6);
%
lo=335'; la=52'; [a,b]=m_ll2xy(lo,la);
text(a,b,'1','fontsize',12,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.94 0.52 0.016 0.42 ]);
%Posição [ x y magx magy];
cmin=1; cmax=8; maplength = 7; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_02--------------------------------------------------------------------
%
axes( 'Position', [ 0.03 0.74 0.50 0.12 ] );
south =-75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,2)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0 0.26 0.87
0.17 0.40 0.76
0 0.5 0.5
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,2)',[-12*10^6:6*10^5:-12*10^4]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,2)',[12*10^4:6*10^5:12*10^6]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1);
m_grid_global_NoX('',4,6);
%
lo=335'; la=52'; [a,b]=m_ll2xy(lo,la);
text(a,b,'2','fontsize',12,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.94 0.52 0.016 0.42 ]);
%Posição [ x y magx magy];
cmin=1; cmax=8; maplength = 7; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_03--------------------------------------------------------------------
%
axes( 'Position', [ 0.03 0.61 0.50 0.12 ] );
south =-75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,3)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0 0.26 0.87
0.17 0.40 0.76
0 0.5 0.5
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,3)',[-12*10^6:6*10^5:-12*10^4]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,3)',[12*10^4:6*10^5:12*10^6]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1);
m_grid_global_NoX('',4,6);
%
lo=335'; la=51.5'; [a,b]=m_ll2xy(lo,la);
text(a,b,'3','fontsize',12,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.94 0.52 0.016 0.42 ]);
%Posição [ x y magx magy];
cmin=1; cmax=8; maplength = 7; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_04--------------------------------------------------------------------
%
axes( 'Position', [ 0.03 0.48 0.50 0.12 ] );
south =-75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,4)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0 0.26 0.87
0.17 0.40 0.76
0 0.5 0.5
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,4)',[-12*10^6:6*10^5:-12*10^4]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,4)',[12*10^4:6*10^5:12*10^6]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1);
m_grid_global('',4,6);
%
lo=335'; la=52'; [a,b]=m_ll2xy(lo,la);
text(a,b,'4','fontsize',12,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.94 0.52 0.016 0.42 ]);
%Posição [ x y magx magy];
cmin=1; cmax=8; maplength = 7; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_05--------------------------------------------------------------------
%
axes( 'Position', [ 0.42 0.87 0.50 0.12 ] );
south =-75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,5)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0 0.26 0.87
0.17 0.40 0.76
0 0.5 0.5
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,5)',[-12*10^6:6*10^5:-12*10^4]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,5)',[12*10^4:6*10^5:12*10^6]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1);
m_grid_global_NoXY('',4,6);
%
lo=335'; la=52'; [a,b]=m_ll2xy(lo,la);
text(a,b,'5','fontsize',12,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.94 0.52 0.016 0.42 ]);
%Posição [ x y magx magy];
cmin=1; cmax=8; maplength = 7; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_06--------------------------------------------------------------------
%
axes( 'Position', [ 0.42 0.74 0.50 0.12 ] );
south =-75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,6)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0 0.26 0.87
0.17 0.40 0.76
0 0.5 0.5
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,6)',[-12*10^6:6*10^5:-12*10^4]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,6)',[12*10^4:6*10^5:12*10^6]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1);
m_grid_global_NoXY('',4,6);
%
lo=335'; la=52'; [a,b]=m_ll2xy(lo,la);
text(a,b,'6','fontsize',12,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.94 0.52 0.016 0.42 ]);
%Posição [ x y magx magy];
cmin=1; cmax=8; maplength = 7; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_07--------------------------------------------------------------------
%
axes( 'Position', [ 0.42 0.61 0.50 0.12 ] );
south =-75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,7)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0 0.26 0.87
0.17 0.40 0.76
0 0.5 0.5
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,7)',[-12*10^6:6*10^5:-12*10^4]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,7)',[12*10^4:6*10^5:12*10^6]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1);
m_grid_global_NoXY('',4,6);
%
lo=335'; la=51.5'; [a,b]=m_ll2xy(lo,la);
text(a,b,'7','fontsize',12,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.94 0.52 0.016 0.42 ]);
%Posição [ x y magx magy];
cmin=1; cmax=8; maplength = 7; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_08--------------------------------------------------------------------
%
axes( 'Position', [ 0.42 0.48 0.50 0.12 ] );
south =-75 ; north = 75 ; west  = 0 ; east  = 357.5 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,8)');shading interp; hold on;
cmin=1; cmax=7; maplength = 7; caxis([cmin cmax])
map = [0 0.26 0.87
0.17 0.40 0.76
0 0.5 0.5
1 1 1
1 0.84 0
1 0.74 0
1 0.49 0];
colormap(map);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,8)',[-12*10^6:6*10^5:-12*10^4]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,STRFA_MJO_m(:,:,8)',[12*10^4:6*10^5:12*10^6]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1);
m_grid_global_NoY('',4,6);
%
lo=335'; la=52'; [a,b]=m_ll2xy(lo,la);
text(a,b,'8','fontsize',12,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.94 0.52 0.016 0.42 ]);
%Posição [ x y magx magy];
cmin=1; cmax=8; maplength = 7; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
orient(fig,'tall');
cd G:/Lais_jasmin/u-bs743/figs
%print(fig,'STRF_200hPa_EN2.png','-dpng');
%print(fig,'STRF_200hPa_LN2.png','-dpng');
print(fig,'STRF_200hPa_NT2.png','-dpng');
%
cd G:/Lais_jasmin/u-bs743/scripts/STRF_200hPa
%
