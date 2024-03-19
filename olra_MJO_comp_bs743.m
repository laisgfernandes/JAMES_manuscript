%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Composites of daily olr anomalies over the tropics            %
%                        in each MJO phase for DJF                        %                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean')
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/olr
%
load olra_MJO_comp_EN
%load olra_MJO_comp_LN
%load olra_MJO_comp_NT
%
%MJO_01--------------------------------------------------------------------
fig = figure;
axes( 'Position', [ 0.10 0.87 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
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
[C,h]=contour(x,y,olra_MJO_m(:,:,1)',[-25:2.5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,1)',[2.5:2.5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1.5);
m_grid_global_NoX('',6,3);
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'1','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.32 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_02--------------------------------------------------------------------
axes( 'Position', [ 0.10 0.75 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
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
[C,h]=contour(x,y,olra_MJO_m(:,:,2)',[-25:2.5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,2)',[2.5:2.5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1.5);
m_grid_global_NoX('',6,3);
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'2','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.32 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_03--------------------------------------------------------------------
axes( 'Position', [ 0.10 0.63 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
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
[C,h]=contour(x,y,olra_MJO_m(:,:,3)',[-25:2.5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,3)',[2.5:2.5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1.5);
m_grid_global_NoX('',6,3);
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'3','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.32 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_04--------------------------------------------------------------------
axes( 'Position', [ 0.10 0.51 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
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
[C,h]=contour(x,y,olra_MJO_m(:,:,4)',[-25:2.5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,4)',[2.5:2.5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1.5);
m_grid_global_NoX('',6,3);
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'4','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.32 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_05--------------------------------------------------------------------
axes( 'Position', [ 0.10 0.39 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
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
[C,h]=contour(x,y,olra_MJO_m(:,:,5)',[-25:2.5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,5)',[2.5:2.5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1.5);
m_grid_global_NoX('',6,3);
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'5','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.32 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_06--------------------------------------------------------------------
axes( 'Position', [ 0.10 0.27 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
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
[C,h]=contour(x,y,olra_MJO_m(:,:,6)',[-25:2.5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,6)',[2.5:2.5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1.5);
m_grid_global_NoX('',6,3);
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'6','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.32 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_07--------------------------------------------------------------------
axes( 'Position', [ 0.10 0.15 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
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
[C,h]=contour(x,y,olra_MJO_m(:,:,7)',[-25:2.5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,7)',[2.5:2.5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1.5);
m_grid_global_NoX('',6,3);
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'7','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.32 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
%MJO_08--------------------------------------------------------------------
axes( 'Position', [ 0.10 0.03 0.75 0.12 ] );
south =-35 ; north = 35 ; west  = 0 ; east  = 357.5 ;
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
[C,h]=contour(x,y,olra_MJO_m(:,:,8)',[-25:2.5:-2.5]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0 0 0.43],'linewidth',1);
hold on
[C,h]=contour(x,y,olra_MJO_m(:,:,8)',[2.5:2.5:25]);
set(h,'color',[0.7 0 0],'linewidth',1);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color','k','linewidth',1.5);
m_grid_global('',6,3);
%
lo=344'; la=22'; [a,b]=m_ll2xy(lo,la);
text(a,b,'8','fontsize',14,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar------------------------------------------------------------------
m = colorbar('Position',[ 0.90 0.32 0.016 0.42 ]);
%Position [ x y magx magy];
cmin=1; cmax=7; maplength = 8; caxis([1 8])
set( m,'XLim',[1 8],'xtick',[1:8]);
set( m,'XTickLabel',{'','-90','-85','-80','80','85','90',''})
%
orient(fig,'tall');
cd G:/Lais_jasmin/u-bs743/figs
print(fig,'OLR_EN.png','-dpng');
%print(fig,'OLR_LN.png','-dpng');
%print(fig,'OLR_NT.png','-dpng');
cd G:/Lais_jasmin/u-bs743/scripts/olr
