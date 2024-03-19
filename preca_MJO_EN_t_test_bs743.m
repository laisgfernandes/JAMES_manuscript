%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Calculating the t-student test                       %
%                      for precipitation anomalies                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%El Nino:
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/prec
%
load preca_MJO_EN ; load preca_DJF;
%
%Autocorrelation coefficient at lag 1:
cd G:/Lais_jasmin/functions
%
%MJO 1--------------------
%
for j = 1:I*J
    rho_1(1:2,j) = nanautocorr(preca_MJO_1(:,j),1);
end
%
rho_1(1,:) = []; rho_1 = reshape(rho_1,I,J);
%
%MJO 2--------------------
%
for j = 1:I*J
    rho_2(1:2,j) = nanautocorr(preca_MJO_2(:,j),1);
end
%
rho_2(1,:) = []; rho_2 = reshape(rho_2,I,J);
%
%MJO 3--------------------
%
for j = 1:I*J
    rho_3(1:2,j) = nanautocorr(preca_MJO_3(:,j),1);
end
%
rho_3(1,:) = []; rho_3 = reshape(rho_3,I,J);
%
%MJO 4--------------------
%
for j = 1:I*J
    rho_4(1:2,j) = nanautocorr(preca_MJO_4(:,j),1);
end
%
rho_4(1,:) = []; rho_4 = reshape(rho_4,I,J);
%
%MJO 5--------------------
%
for j = 1:I*J
    rho_5(1:2,j) = nanautocorr(preca_MJO_5(:,j),1);
end
%
rho_5(1,:) = []; rho_5 = reshape(rho_5,I,J);
%
%MJO 6--------------------
%
for j = 1:I*J
    rho_6(1:2,j) = nanautocorr(preca_MJO_6(:,j),1);
end
%
rho_6(1,:) = []; rho_6 = reshape(rho_6,I,J);
%
%MJO 7--------------------
%
for j = 1:I*J
    rho_7(1:2,j) = nanautocorr(preca_MJO_7(:,j),1);
end
%
rho_7(1,:) = []; rho_7 = reshape(rho_7,I,J);
%
%MJO 8--------------------
%
for j = 1:I*J
    rho_8(1:2,j) = nanautocorr(preca_MJO_8(:,j),1);
end
%
rho_8(1,:) = []; rho_8 = reshape(rho_8,I,J);
%
%DJF--------------------
%
for j = 1:I*J
    rho_DJF(1:2,j) = nanautocorr(preca_DJF(:,j),1);
end
%
rho_DJF(1,:) = []; rho_DJF = reshape(rho_DJF,I,J);
%
%Joining rho for all MJO phases:
%
rho = cat(3,rho_1,rho_2,rho_3,rho_4,rho_5,rho_6,rho_7,rho_8);
%
cd G:/Lais_jasmin/u-bs743/data/prec
%
save rho_prec_EN rho rho_DJF
%
%load rho
%
%Calculating the mean:
%
%Building a matrix with all MJO phases together:
%
m = max(n);% maximum for phase 8
%
dif = m - n;
%
preca_MJO_1 = [preca_MJO_1(:,:); NaN(dif(1),I*J)];
%
preca_MJO_2 = [preca_MJO_2(:,:); NaN(dif(2),I*J)];
%
preca_MJO_3 = [preca_MJO_3(:,:); NaN(dif(3),I*J)];
%
preca_MJO_4 = [preca_MJO_4(:,:); NaN(dif(4),I*J)];
%
preca_MJO_5 = [preca_MJO_5(:,:); NaN(dif(5),I*J)];
%
preca_MJO_6 = [preca_MJO_6(:,:); NaN(dif(6),I*J)];
%
preca_MJO_7 = [preca_MJO_7(:,:); NaN(dif(7),I*J)];
%
preca_MJO = cat(3,preca_MJO_1,preca_MJO_2,preca_MJO_3,preca_MJO_4,...
    preca_MJO_5,preca_MJO_6,preca_MJO_7,preca_MJO_8);
%
%MJO--------------------
%
preca_MJO_m = NaN(I*J,8);
%
for k = 1:8
    for j = 1:I*J
preca_MJO_m(j,k) = nanmean(preca_MJO(:,j,k));
    end
end
% 
preca_MJO_m = reshape(preca_MJO_m,I,J,8); 
% 
%DJF--------------------
%
preca_DJF_m = nanmean(preca_DJF);
% 
preca_DJF_m = preca_DJF_m'; preca_DJF_m = reshape(preca_DJF_m,I,J); 
% 
%Calculating the standard deviation:
%
%MJO--------------------
%
preca_MJO_std = NaN(I*J,8);
%
for k = 1:8
    for j = 1:I*J
preca_MJO_std(j,k) = nanstd(preca_MJO(:,j,k));
    end
end
% 
preca_MJO_std = reshape(preca_MJO_std,I,J,8); 
%  
%DJF--------------------
%
preca_DJF_std = nanstd(preca_DJF);
% 
preca_DJF_std = preca_DJF_std'; preca_DJF_std = reshape(preca_DJF_std,I,J); 
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
SIGMA(:,:,k) = sqrt((((N(:,:,k) - 1).*preca_MJO_std(:,:,k).^2) + ((N_DJF - 1).*preca_DJF_std.^2))./V(:,:,k));
end
%
%T-value:
%
t = NaN(I,J,8);
%
for k = 1:8
t(:,:,k) = (preca_MJO_m(:,:,k) - preca_DJF_m)./(SIGMA(:,:,k).*sqrt(1./N(:,:,k) + 1./N_DJF));
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
X = reshape(X,I,J,8);
%
%Putting zero instead of NaN to improve the countour:
%
X = reshape(X,I*J,8); X = reshape(X,I*J*8,1);
%
c = find(isnan(X));
%
for i=1:length(c)
    X(c(i)) = 0;
end
%
X = reshape(X,I,J,8);
%
cd G:/Lais_jasmin/u-bs743/data/prec;
save('preca_MJO_comp_EN','preca_MJO_m','preca_MJO_std','N',...
    'X','lat','lon','lat1','lon1','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/prec;
%





















