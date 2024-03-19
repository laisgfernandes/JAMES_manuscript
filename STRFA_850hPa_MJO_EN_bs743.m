%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Calculating the daily STRF anomalies over SA             %
%                        in each MJO phase for DJF                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for El Nino:
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/STRF_850hPa
%
load STRFA_850hPa_MJO; 
%
cd G:/Lais_jasmin/u-bs743/data/ENSO
%
load MJO; clear amp_LN amp_NT phase_LN phase_NT;
%
%Putting NaN in preca when the MJO is inactive (amplitude < 1)
%
for j = 1:I*J
for i = 1:T
if amp_EN(i) < 1
STRFA(i,j) = NaN;
end
end
end
%
for j = 1:I*J
for i = 1:T
if isnan(amp_EN(i))
STRFA(i,j) = NaN;
end
end
end
%
%Separating preca according to the MJO phases:
%
%MJO phase 1-------------------
%
STRFA_MJO_1 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 1
        STRFA_MJO_1(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_EN(:) ~= 1); b = find(amp_EN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
STRFA_MJO_1(c,:) = [];
end
%
%MJO phase 2-------------------
%
STRFA_MJO_2 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 2
        STRFA_MJO_2(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_EN(:) ~= 2); b = find(amp_EN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
STRFA_MJO_2(c,:) = [];
end
%
%MJO phase 3-------------------
%
STRFA_MJO_3 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 3
        STRFA_MJO_3(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_EN(:) ~= 3); b = find(amp_EN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
STRFA_MJO_3(c,:) = [];
end
%
%MJO phase 4-------------------
%
STRFA_MJO_4 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 4
        STRFA_MJO_4(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_EN(:) ~= 4); b = find(amp_EN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
STRFA_MJO_4(c,:) = [];
end
%
%MJO phase 5-------------------
%
STRFA_MJO_5 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 5
        STRFA_MJO_5(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_EN(:) ~= 5); b = find(amp_EN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
STRFA_MJO_5(c,:) = [];
end
%
%MJO phase 6-------------------
%
STRFA_MJO_6 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 6
        STRFA_MJO_6(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_EN(:) ~= 6); b = find(amp_EN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
STRFA_MJO_6(c,:) = [];
end
%
%MJO phase 7-------------------
%
STRFA_MJO_7 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 7
        STRFA_MJO_7(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_EN(:) ~= 7); b = find(amp_EN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
STRFA_MJO_7(c,:) = [];
end
%
%MJO phase 8-------------------
%
STRFA_MJO_8 = STRFA;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 8
        STRFA_MJO_8(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_EN(:) ~= 8); b = find(amp_EN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
STRFA_MJO_8(c,:) = [];
end
%
%Finding the number of days in each MJO phase in DJF:
%
[T1,n] = size(STRFA_MJO_1); [T2,n] = size(STRFA_MJO_2);
%
[T3,n] = size(STRFA_MJO_3); [T4,n] = size(STRFA_MJO_4);
%
[T5,n] = size(STRFA_MJO_5); [T6,n] = size(STRFA_MJO_6);
%
[T7,n] = size(STRFA_MJO_7); [T8,n] = size(STRFA_MJO_8);
%
n = [T1 T2 T3 T4 T5 T6 T7 T8];
%
cd G:/Lais_jasmin/u-bs743/data/STRF_850hPa
%
save('STRFA_850hPa_MJO_EN','STRFA_MJO_1','STRFA_MJO_2','STRFA_MJO_3',...
    'STRFA_MJO_4','STRFA_MJO_5','STRFA_MJO_6','STRFA_MJO_7','STRFA_MJO_8',...
    'n','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/STRF_850hPa
%