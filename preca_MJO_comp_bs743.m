%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Composites of daily rainfall anomalies over SA              %
%                        in each MJO phase for DJF                        %             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean');
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/prec;
%
%load preca_MJO_comp_EN
%load preca_MJO_comp_LN
load preca_MJO_comp_NT
%
%Composites for each MJO phase:
%MJO phase 1:
fig = figure
axes( 'Position', [ 0.10 0.767 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca_MJO_m(:,:,1)'); shading flat; hold on;
cmin=-5; cmax=5; maplength = 10; caxis([cmin cmax])
map = [0 0 0.3
0 0 0.5
0 0 0.7
0 0.5 1
0.54 0.81 0.94
1 0.96 0.2
1 0.70 0
1 0.60 0
1 0 0.06
0.70 0 0.06];
colormap(map);
hold on;
%
[C,h]=contour(x,y,X(:,:,1)',[85 85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
hold on
%
[C,h]=contour(x,y,X(:,:,1)',[-85 -85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global_NoX('',3,7);
%
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'1','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO phase 2:
axes( 'Position', [ 0.10 0.53 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca_MJO_m(:,:,2)'); shading flat; hold on;
cmin=-5; cmax=5; maplength = 10; caxis([cmin cmax])
map = [0 0 0.3
0 0 0.5
0 0 0.7
0 0.5 1
0.54 0.81 0.94
1 0.96 0.2
1 0.70 0
1 0.60 0
1 0 0.06
0.70 0 0.06];
colormap(map);
hold on;
%
[C,h]=contour(x,y,X(:,:,2)',[85 85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
hold on
%
[C,h]=contour(x,y,X(:,:,2)',[-85 -85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global_NoX('',3,7);
%
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'2','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO phase 3:
axes( 'Position', [ 0.10 0.293 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca_MJO_m(:,:,3)'); shading flat; hold on;
cmin=-5; cmax=5; maplength = 10; caxis([cmin cmax])
map = [0 0 0.3
0 0 0.5
0 0 0.7
0 0.5 1
0.54 0.81 0.94
1 0.96 0.2
1 0.70 0
1 0.60 0
1 0 0.06
0.70 0 0.06];
colormap(map);
hold on;
%
[C,h]=contour(x,y,X(:,:,3)',[85 85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
hold on
%
[C,h]=contour(x,y,X(:,:,3)',[-85 -85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global_NoX('',3,7);
%
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'3','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO phase 4:
axes( 'Position', [ 0.10 0.056 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca_MJO_m(:,:,4)'); shading flat; hold on;
cmin=-5; cmax=5; maplength = 10; caxis([cmin cmax])
map = [0 0 0.3
0 0 0.5
0 0 0.7
0 0.5 1
0.54 0.81 0.94
1 0.96 0.2
1 0.70 0
1 0.60 0
1 0 0.06
0.70 0 0.06];
colormap(map);
hold on;
%
[C,h]=contour(x,y,X(:,:,4)',[85 85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
hold on
%
[C,h]=contour(x,y,X(:,:,4)',[-85 -85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',3,7);
%
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'4','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO phase 5:
axes( 'Position', [ 0.42 0.767 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca_MJO_m(:,:,5)'); shading flat; hold on;
cmin=-5; cmax=5; maplength = 10; caxis([cmin cmax])
map = [0 0 0.3
0 0 0.5
0 0 0.7
0 0.5 1
0.54 0.81 0.94
1 0.96 0.2
1 0.70 0
1 0.60 0
1 0 0.06
0.70 0 0.06];
colormap(map);
hold on;
%
[C,h]=contour(x,y,X(:,:,5)',[85 85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
hold on
%
[C,h]=contour(x,y,X(:,:,5)',[-85 -85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global_NoX('',3,7);
%
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'5','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO phase 6:
axes( 'Position', [ 0.42 0.53 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca_MJO_m(:,:,6)'); shading flat; hold on;
cmin=-5; cmax=5; maplength = 10; caxis([cmin cmax])
map = [0 0 0.3
0 0 0.5
0 0 0.7
0 0.5 1
0.54 0.81 0.94
1 0.96 0.2
1 0.70 0
1 0.60 0
1 0 0.06
0.70 0 0.06];
colormap(map);
hold on;
%
[C,h]=contour(x,y,X(:,:,6)',[85 85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
hold on
%
[C,h]=contour(x,y,X(:,:,6)',[-85 -85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global_NoX('',3,7);
%
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'6','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO phase 7:
axes( 'Position', [ 0.42 0.293 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca_MJO_m(:,:,7)'); shading flat; hold on;
cmin=-5; cmax=5; maplength = 10; caxis([cmin cmax])
map = [0 0 0.3
0 0 0.5
0 0 0.7
0 0.5 1
0.54 0.81 0.94
1 0.96 0.2
1 0.70 0
1 0.60 0
1 0 0.06
0.70 0 0.06];
colormap(map);
hold on;
%
[C,h]=contour(x,y,X(:,:,7)',[85 85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
hold on
%
[C,h]=contour(x,y,X(:,:,7)',[-85 -85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global_NoX('',3,7);
%
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'7','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%MJO phase 8:
axes( 'Position', [ 0.42 0.056 0.24 0.225 ] );
south =-50 ; north = 15 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,preca_MJO_m(:,:,8)'); shading flat; hold on;
cmin=-5; cmax=5; maplength = 10; caxis([cmin cmax])
map = [0 0 0.3
0 0 0.5
0 0 0.7
0 0.5 1
0.54 0.81 0.94
1 0.96 0.2
1 0.70 0
1 0.60 0
1 0 0.06
0.70 0 0.06];
colormap(map);
hold on;
%
[C,h]=contour(x,y,X(:,:,8)',[85 85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
hold on
%
[C,h]=contour(x,y,X(:,:,8)',[-85 -85]);
set(gcf,'renderer','zbuffer');
set(h,'color',[0.3 0.3 0.3],'linewidth',2);
%
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',3,7);
%
lo=322.4'; la=7.6'; [a,b]=m_ll2xy(lo,la);
text(a,b,'8','fontsize',16,'BackgroundColor',[1 1 1],'FontWeight','bold','visible','on')
hold on
%
%Colorbar
h = colorbar('Position',[ 0.70 0.32 0.008 0.42 ]);
%Position [ x y magx magy];
cmin=-5; cmax=5; 
set( h,'XLim',[cmin cmax],'xtick',[-5:1:5]);
set( h,'XTickLabel',{'','-4','-3','-2','-1','0','1','2','3','4',''});
%
orient(fig,'tall');
cd G:/Lais_jasmin/u-bs743/figs;
%print(fig,'PREC_EN_DJF.png','-dpng');
%print(fig,'PREC_LN_DJF.png','-dpng');
print(fig,'PREC_NT_DJF.png','-dpng');
cd G:/Lais_jasmin/u-bs743/scripts/prec;
%



