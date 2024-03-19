%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Calculating the extreme events in each day                %                              %
%                           for each gridpoint                            %                                                  %                                                                                                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
clc
clear
%
cd G:/for_lais
%
ncdisp('bs743.jan-dec_dmeans_ts.years1-60.precip.nc');
%360-day calendar. The year is made of 12 months, each of which has 30 days  
%21600 days in 60 years (60 * 360 = 21600)
%
precf = ncread('bs743.jan-dec_dmeans_ts.years1-60.precip.nc',...
    'UM_m01s05i216_vn1003'); 
%
lat = ncread('bs743.jan-dec_dmeans_ts.years1-60.precip.nc','latitude');
%
lon = ncread('bs743.jan-dec_dmeans_ts.years1-60.precip.nc','longitude');
%
%Cutting the matrix for the South America region:
%
lat = lat(23:90); lat1 = lat;
lon = lon(147:178); lon1 = lon;
%
precf = precf(147:178,23:90,:);
%
%Converting precipitation flux (kg/m^2/s or mm/s) in mm/day:
%Multiplying by 86400 to calculate mm/day
%
[I,J,T] = size(precf);
%
L = 360;%days in a year
%
K = T/L;%years
%
precf = reshape(precf,I*J,T);
%
for i = 1:T
    prec(:,i) = precf(:,i)*86400;
end
%
clear precf;
%
%Calculating the moving mean for three days:
%
%Copying the last 2 series values at the beginning and the first 2 series
%values at the end:
%
prec = [prec(:,21599:end) prec prec(:,1:2)];
%
%Applying the 3-day moving mean:
%
cd G:/Lais_jasmin/functions
%
prec = prec';
%
for j = 1:(I*J)
a(:,j) = mediamovel_centrada(prec(:,j),3); 
end
%
prec_m = a; clear a; prec_m = prec_m'; 
%
prec_m = prec_m(:,3:end-2); 
%
clear prec;
%
cd G:/Lais_jasmin/u-bs743/data/ev_ext
%
save prec_3day_m
%
%Considering only nonzero values, above or equal 0.1 mm:
%
%Rounding prec_m:
%
prec_m = round(prec_m,2);
%
prec_m = reshape(prec_m,I*J*T,1);
%
b = find(prec_m < 0.1); 
%
for i = 1:length(b)
    prec_m(b(i)) = NaN;
end
%
prec_m = reshape(prec_m,I*J,T); clear b;
%
%Parameters from the gamma distribution for DJF days in each grid point:
%
prec_m = prec_m'; prec_m = reshape(prec_m,L,K,I*J); 
%
a = NaN(K, L, I*J); 
%
for k = 1:I*J
    a(:,:,k) = prec_m(:,:,k)';
end
%
prec_m = a; clear a;
%
prec_m = cat(2,prec_m(:,1:60,:),prec_m(:,331:end,:));
%
%new L:
%
L = 90; %days in DJF
%
a = NaN(L, K, I*J); 
%
for k = 1:I*J
    a(:,:,k) = prec_m(:,:,k)';
end
%
prec_m = a; clear a;
%
b = NaN(L,K,I*J);
%
 for k = 1:I*J
    b(:,:,k) = isnan(prec_m(:,:,k));
 end
%
c = find(isnan(prec_m));
%
for i = 1:length(c)
    prec_m(c(i)) = 0.00000001;
end
%
p_ab = NaN(L,2,I*J);
%
for k = 1:I*J
for i = 1:L
p_ab(i,:,k) = gamfit(prec_m(i,:,k),0.01,b(i,:,k));
end
end
%
%Putting NaN again in the matrix:
%
for i = 1:length(c)
    prec_m(c(i)) = NaN;
end
%
%Creating a matrix of 1000 years instead of 60 years to calculate the
%percentile:
%
prec_mm = NaN(L,1000,I*J);
%
for k = 1:I*J
for i = 1:L
prec_mm (i,:,k) = gamrnd(p_ab(i, 1, k),p_ab(i, 2, k),[1,1000,1]);
end
end
%
%Histogram for 01/01 (1000 values for the gridpoint 1306):
%
figure
h = histogram(prec_mm(1,:,1306));
set(gca,'fontsize',12);
m=title('Daily precipitation histogram (3-day averages)'); 
set(m,'FontSize',12,'FontName','Helvetica');
z=xlabel('Classes Interval (mm/day)'); 
set(z,'FontSize',12,'FontName','Helvetica');
w=ylabel('Absolut Frequency'); 
set(w,'FontSize',12,'FontName','Helvetica');
axis([-1 30 0 120]);
xticks([-1:1:30]);
hold on
h.BinEdges = [-1:0.25:30];
%
%Calculating the 90th percentile:
%
p_90 = NaN(90,1,I*J);
%
for k =1:I*J
for i = 1:L
p_90(i,1,k) = prctile(prec_mm(i,:,k), 90);
end
end
%
%Rounding the 90th percentile:
%
p_90 = round(p_90,2);
%
clear prec_mm;
%
%Assessing whether precipitation in one day is greater than the 90th
%percentile for all gridpoints:
%
for k = 1:I*J
for i = 1:L
for j = 1:K
if prec_m(i,j,k) < p_90(i,1,k)
    prec_m(i,j,k) = 0;
end
if prec_m(i,j,k) >= p_90(i,1,k)
    prec_m(i,j,k) = 1;
end
end
end
end
%
ev_extr = prec_m; clear prec_m;
%
ev_extr = reshape(ev_extr,L*K,I*J); %2700 DJF days
%
ev_extr = ev_extr'; 
%
%new T:
%
T = 2700;
%
save ev_extr ev_extr lat lat1 lon lon1 I J T K L;
%
cd G:/Lais_jasmin/u-bs743/scripts



