%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Probability of extreme events over SA                       %
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
cd G:/Lais_jasmin/u-be362/data/ev_ext;
load ev_extr_MJO_comp
%
%MJO_01 for colorbar-------------------------------------------------------
fig = figure;
n11 = axes( 'Position', [ 0.10 0.767 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,r(:,:,1)');shading flat; hold on;
cmin=0.4; cmax=2.1; maplength = 17; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21];
colormap(n11, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global_NoX('',3,7);
%
%Colorbar
h = colorbar(n11,'Position',[ 0.70 0.32 0.018 0.42 ]);
%Position [ x y magx magy];
cmin=0.4; cmax=2.1; 
set( h,'XLim',[cmin cmax],'xtick',[0.4:0.1:2.1]);
set( h,'XTickLabel',{'','0.5','0.6','0.7','0.8','0.9','1.0','1.1','1.2',...
    '1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0',''});
%
%Plotting including gray grid points:
%MJO_01---------------------------------------------------------------------
n1 = axes( 'Position', [ 0.10 0.767 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,1)');shading flat; hold on;
cmin=100; cmax=1800; maplength = 18; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21
0.85 0.85 0.85];%light gray
colormap(n1, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global_NoX('',3,7);
hold on

lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'1','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
%
%MJO_02---------------------------------------------------------------------
n2 = axes( 'Position', [ 0.10 0.53 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,2)');shading flat; hold on;
cmin=100; cmax=1800; maplength = 18; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21
0.85 0.85 0.85];%light gray
colormap(n2, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global_NoX('',3,7);
%
hold on
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'2','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
%
%MJO_03---------------------------------------------------------------------
n3 = axes( 'Position', [ 0.10 0.293 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,3)');shading flat; hold on;
cmin=100; cmax=1800; maplength = 18; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21
0.85 0.85 0.85];%light gray
colormap(n3, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global_NoX('',3,7);
%
hold on
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'3','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
%
%MJO_04---------------------------------------------------------------------
n4 = axes( 'Position', [ 0.10 0.056 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,4)');shading flat; hold on;
cmin=100; cmax=1800; maplength = 18; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21
0.85 0.85 0.85];%light gray
colormap(n4, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global('',3,7);
%
hold on
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'4','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
%
%MJO_05---------------------------------------------------------------------
n5 = axes( 'Position', [ 0.42 0.767 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,5)');shading flat; hold on;
cmin=100; cmax=1800; maplength = 18; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21
0.85 0.85 0.85];%light gray
colormap(n5, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global_NoX('',3,7);
%
hold on
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'5','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
%
%MJO_06---------------------------------------------------------------------
n6 = axes( 'Position', [ 0.42 0.53 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,6)');shading flat; hold on;
cmin=100; cmax=1800; maplength = 18; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21
0.85 0.85 0.85];%light gray
colormap(n6, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global_NoX('',3,7);
%
hold on
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'6','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
%
%MJO_07---------------------------------------------------------------------
n7 = axes( 'Position', [ 0.42 0.293 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,7)');shading flat; hold on;
cmin=100; cmax=1800; maplength = 18; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21
0.85 0.85 0.85];%light gray
colormap(n7, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global_NoX('',3,7);
%
hold on
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'7','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
%
%MJO_08---------------------------------------------------------------------
n8 = axes( 'Position', [ 0.42 0.056 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north])
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]=meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
%
pcolor(x,y,Y(:,:,8)');shading flat; hold on;
cmin=100; cmax=1800; maplength = 18; caxis([cmin cmax])
map = [0 0 0.55 %dark blue
0 0 1 %blue
0.27 0.56 0.92 %chefchaouen blue
0.53 0.81 0.94 %baby blue
0.27 0.95 0.93 %fluorescent blue
0.27 0.95 0.93 %fluorescent blue
1 1 0.6 %canary yellow
1 1 0.6 %canary yellow
1 1 0 %yellow
0.93 0.8 0
1 0.66 0.11
1 0.55 0
1 0.49 0
1 0.26 0.2 %vermilion
1 0 0 %red
0.76 0 0.2 %red NCS
0.58 0.27 0.21
0.85 0.85 0.85];%light gray
colormap(n8, map);
hold on
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12);
m_coast1('linestyle','-','color',[0 0 0],'linewidth',2);
m_grid_global('',3,7);
%
hold on
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'8','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
%
orient(fig,'tall');
cd G:/Lais_jasmin/u-be362/figs;
print(fig,'ev_ext85_end.png','-dpng');
cd G:/Lais_jasmin/u-be362/scripts;
%



