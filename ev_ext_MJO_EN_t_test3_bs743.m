%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Calculating the t-student test                    %                                  
%                              for extreme events                         %                                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/ev_ext
%
load ev_extr_MJO_EN; load ev_extr_DJF;
%
%Autocorrelation coefficient at lag 1:
cd G:/Lais_jasmin/functions
%
%MJO 1--------------------
%
for j = 1:I*J
    rho_1(1:2,j) = nanautocorr(ev_extr_MJO_1(:,j),1);
end
%
rho_1(1,:) = []; rho_1 = reshape(rho_1,I,J);
%
%MJO 2--------------------
%
for j = 1:I*J
    rho_2(1:2,j) = nanautocorr(ev_extr_MJO_2(:,j),1);
end
%
rho_2(1,:) = []; rho_2 = reshape(rho_2,I,J);
%
%MJO 3--------------------
%
for j = 1:I*J
    rho_3(1:2,j) = nanautocorr(ev_extr_MJO_3(:,j),1);
end
%
rho_3(1,:) = []; rho_3 = reshape(rho_3,I,J);
%
%MJO 4--------------------
%
for j = 1:I*J
    rho_4(1:2,j) = nanautocorr(ev_extr_MJO_4(:,j),1);
end
%
rho_4(1,:) = []; rho_4 = reshape(rho_4,I,J);
%
%MJO 5--------------------
%
for j = 1:I*J
    rho_5(1:2,j) = nanautocorr(ev_extr_MJO_5(:,j),1);
end
%
rho_5(1,:) = []; rho_5 = reshape(rho_5,I,J);
%
%MJO 6--------------------
%
for j = 1:I*J
    rho_6(1:2,j) = nanautocorr(ev_extr_MJO_6(:,j),1);
end
%
rho_6(1,:) = []; rho_6 = reshape(rho_6,I,J);
%
%MJO 7--------------------
%
for j = 1:I*J
    rho_7(1:2,j) = nanautocorr(ev_extr_MJO_7(:,j),1);
end
%
rho_7(1,:) = []; rho_7 = reshape(rho_7,I,J);
%
%MJO 8--------------------
%
for j = 1:I*J
    rho_8(1:2,j) = nanautocorr(ev_extr_MJO_8(:,j),1);
end
%
rho_8(1,:) = []; rho_8 = reshape(rho_8,I,J);
%
%DJF--------------------
%
for j = 1:I*J
    rho_DJF(1:2,j) = nanautocorr(ev_extr_DJF(:,j),1);
end
%
rho_DJF(1,:) = []; rho_DJF = reshape(rho_DJF,I,J);
%
%Joining rho for all MJO phases:
%
rho = cat(3,rho_1,rho_2,rho_3,rho_4,rho_5,rho_6,rho_7,rho_8);
%
%Calculating the mean:
%
%Building a matrix with all MJO phases together:
%
m = max(n);% maximum for phase 8
%
dif = m - n;
%
ev_extr_MJO_1 = [ev_extr_MJO_1(:,:); NaN(dif(1),I*J)];
%
ev_extr_MJO_2 = [ev_extr_MJO_2(:,:); NaN(dif(2),I*J)];
%
ev_extr_MJO_3 = [ev_extr_MJO_3(:,:); NaN(dif(3),I*J)];
%
ev_extr_MJO_4 = [ev_extr_MJO_4(:,:); NaN(dif(4),I*J)];
%
ev_extr_MJO_5 = [ev_extr_MJO_5(:,:); NaN(dif(5),I*J)];
%
ev_extr_MJO_6 = [ev_extr_MJO_6(:,:); NaN(dif(6),I*J)];
%
ev_extr_MJO_7 = [ev_extr_MJO_7(:,:); NaN(dif(7),I*J)];
%
ev_extr_MJO = cat(3,ev_extr_MJO_1,ev_extr_MJO_2,ev_extr_MJO_3,ev_extr_MJO_4,...
    ev_extr_MJO_5,ev_extr_MJO_6,ev_extr_MJO_7,ev_extr_MJO_8);
%
%MJO--------------------
%
ev_extr_MJO_m = NaN(I*J,8);
%
for k = 1:8
    for j = 1:I*J
ev_extr_MJO_m(j,k) = nanmean(ev_extr_MJO(:,j,k));
    end
end
% 
ev_extr_MJO_m = reshape(ev_extr_MJO_m,I,J,8); 
% 
%DJF--------------------
%
ev_extr_DJF_m = nanmean(ev_extr_DJF);
% 
ev_extr_DJF_m = ev_extr_DJF_m'; ev_extr_DJF_m = reshape(ev_extr_DJF_m,I,J); 
% 
%Calculating the ratio or probability of extreme events in MJO:
%
r = NaN(I, J, 8);
%
for k = 1:8
r(:, :, k) = ev_extr_MJO_m(:, :, k)./ev_extr_DJF_m;
end
%
%Calculating the standard deviation:
%
%MJO--------------------
%
ev_extr_MJO_std = NaN(I*J,8);
%
for k = 1:8
    for j = 1:I*J
ev_extr_MJO_std(j,k) = nanstd(ev_extr_MJO(:,j,k));
    end
end
% 
ev_extr_MJO_std = reshape(ev_extr_MJO_std,I,J,8); 
%   
%DJF--------------------
%
ev_extr_DJF_std = nanstd(ev_extr_DJF);
% 
ev_extr_DJF_std = ev_extr_DJF_std'; ev_extr_DJF_std = reshape(ev_extr_DJF_std,I,J); 
% 
%Calculating the effective number N:
%
%MJO--------------------
%
rho = reshape(rho,I*J,8);
%
for j = 1:8
for i = 1:I*J
N(i,j) = n(j)*[(1 - rho(i,j))/(1 + rho(i,j))];
end
end
%
%Values N < 5 equal to NaN:
%
N = reshape(N,I*J*8,1);
%
a = find(N < 5);
%
for i=1:length(a)
    N(a(i)) = NaN;
end
%
N = reshape(N,I*J,8); N = reshape(N,I,J,8);
%
%DJF--------------------
%
rho_DJF = reshape(rho_DJF,I*J,1);
%
for i = 1:I*J
N_DJF(i) = T*[(1 - rho_DJF(i))/(1 + rho_DJF(i))];
end
%
%Values N < 5 equal to NaN:
%
N_DJF = reshape(N_DJF,I*J,1);
%
a = find(N_DJF < 5);
%
for i=1:length(a)
    N_DJF(a(i)) = NaN;
end
%
N_DJF = reshape(N_DJF,I*J,1); N_DJF = reshape(N_DJF,I,J);
%
%Aplying the t-student test:
%
%Degrees of freedom:
%
V = NaN(I,J,8);
%
for k = 1:8
V(:,:,k) = (N(:,:,k) + N_DJF - 2);
end
%
%Sigma:
%
SIGMA = NaN(I,J,8);
%
for k = 1:8
SIGMA(:,:,k) = sqrt((((N(:,:,k) - 1).*ev_extr_MJO_std(:,:,k).^2) + ((N_DJF - 1).*ev_extr_DJF_std.^2))./V(:,:,k));
end
%
%T-value:
%
t = NaN(I,J,8);
%
for k = 1:8
t(:,:,k) = (ev_extr_MJO_m(:,:,k) - ev_extr_DJF_m)./(SIGMA(:,:,k).*sqrt(1./N(:,:,k) + 1./N_DJF));
end
%
%P-value:
P = NaN(I,J,8);
%
for k = 1:8
P(:,:,k) = tcdf(t(:,:,k),V(:,:,k)); 
P(:,:,k) = P(:,:,k).*2;
end
%
%Confidence level:
X = NaN(I,J,8);
%
for k =1:8
X(:,:,k) = P(:,:,k)./2; 
X(:,:,k) = X(:,:,k).*100;
end
%
X = reshape(X,I*J,8);
%
%Creating confidence levels with positive and negative values:
%
for j = 1:8
for i = 1:I*J
if X(i,j) < 50
    X(i,j) = X(i,j) - 100;
else
    X(i,j) = X(i,j);
end
end
end
%
%Replacing non-significant values with 99 in r:
%
X = reshape(X,I*J*8,1); 
%
r = reshape(r,I*J*8,1); r2 = r;
%
d = find(X < 85 & X > -85);
%
for i = 1:length(d)
    r2(d(i)) = 99;
end
%
r = reshape(r,I,J,8); r2 = reshape(r2,I,J,8);
%
%Colorbar:
%
Y = NaN(I*J,8); r2 = reshape(r2,I*J,8);

%
for j = 1:8
for i = 1:I*J
if r2(i,j) > 0.1 && r2(i,j) <= 0.5
    Y(i,j) = 100; %azul escuro
end
end
end
%

%
for j = 1:8
for i = 1:I*J
if r2(i,j) > 0.5 && r2(i,j) <= 0.6
    Y(i,j) = 200; %azul 
end
end
end
%

%
for j = 1:8
for i = 1:I*J
if r2(i,j) > 0.6 && r2(i,j) <= 0.7
    Y(i,j) = 300; %chefchaouen blue 
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 0.7 && r2(i,j) <= 0.8
    Y(i,j) = 400; %baby blue  
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 0.8 && r2(i,j) <= 0.9
    Y(i,j) = 500; %light blue
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 0.9 && r2(i,j) <= 1.0
    Y(i,j) = 600; %fluorescent blue
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.0 && r2(i,j) <= 1.1
    Y(i,j) = 700; %amarelo claro
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.1 && r2(i,j) <= 1.2
    Y(i,j) = 800; %amarelo 
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.2 && r2(i,j) <= 1.3
    Y(i,j) = 900; %dourado
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.3 && r2(i,j) <= 1.4
    Y(i,j) = 1000; %laranja claro
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.4 && r2(i,j) <= 1.5
    Y(i,j) = 1100; %laranja
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.5 && r2(i,j) <= 1.6
    Y(i,j) = 1200; %laranja forte
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.6 && r2(i,j) <= 1.7
    Y(i,j) = 1300; %vermelho
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.7 && r2(i,j) <= 1.8
    Y(i,j) = 1400; %vermilion
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.8 && r2(i,j) <= 1.9
    Y(i,j) = 1500; %vermelho escuro
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 1.9 && r2(i,j) <= 2.0
    Y(i,j) = 1600; %marrom claro
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 2.0 && r2(i,j) <= 98
    Y(i,j) = 1700; %marrom 
end
end
end
%

for j = 1:8
for i = 1:I*J
if r2(i,j) > 98 && r2(i,j) <= 99
    Y(i,j) = 1800; %cinza
end
end
end
%
r2 = reshape(r2,I,J,8); X = reshape(X,I,J,8); Y = reshape(Y,I,J,8);

cd G:/Lais_jasmin/u-bs743/data/ev_ext
save('ev_extr_MJO_comp_EN','r','r2','X','Y','lat','lon',...
    'lat1','lon1','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/prec
%








