%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Calculating the daily rainfall anomalies over SA            %
%                        in each MJO phase for DJF                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for El Nino:
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/prec
%
load preca_MJO; 
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
preca(i,j) = NaN;
end
end
end
%
for j = 1:I*J
for i = 1:T
if isnan(amp_EN(i))
preca(i,j) = NaN;
end
end
end
%
%Separating preca according to the MJO phases:
%
%MJO phase 1-------------------
%
preca_MJO_1 = preca;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 1
        preca_MJO_1(i,j) = NaN;
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
preca_MJO_1(c,:) = [];
end
%
%MJO phase 2-------------------
%
preca_MJO_2 = preca;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 2
        preca_MJO_2(i,j) = NaN;
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
preca_MJO_2(c,:) = [];
end
%
%MJO phase 3-------------------
%
preca_MJO_3 = preca;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 3
        preca_MJO_3(i,j) = NaN;
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
preca_MJO_3(c,:) = [];
end
%
%MJO phase 4-------------------
%
preca_MJO_4 = preca;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 4
        preca_MJO_4(i,j) = NaN;
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
preca_MJO_4(c,:) = [];
end
%
%MJO phase 5-------------------
%
preca_MJO_5 = preca;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 5
        preca_MJO_5(i,j) = NaN;
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
preca_MJO_5(c,:) = [];
end
%
%MJO phase 6-------------------
%
preca_MJO_6 = preca;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 6
        preca_MJO_6(i,j) = NaN;
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
preca_MJO_6(c,:) = [];
end
%
%MJO phase 7-------------------
%
preca_MJO_7 = preca;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 7
        preca_MJO_7(i,j) = NaN;
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
preca_MJO_7(c,:) = [];
end
%
%MJO phase 8-------------------
%
preca_MJO_8 = preca;
%
for j = 1:I*J
for i = 1:T
    if phase_EN(i) ~= 8
        preca_MJO_8(i,j) = NaN;
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
preca_MJO_8(c,:) = [];
end
%
%Finding the number of days in each MJO phase in DJF:
%
[T1,n] = size(preca_MJO_1); [T2,n] = size(preca_MJO_2);
%
[T3,n] = size(preca_MJO_3); [T4,n] = size(preca_MJO_4);
%
[T5,n] = size(preca_MJO_5); [T6,n] = size(preca_MJO_6);
%
[T7,n] = size(preca_MJO_7); [T8,n] = size(preca_MJO_8);
%
n = [T1 T2 T3 T4 T5 T6 T7 T8];
%
cd G:/Lais_jasmin/u-bs743/data/prec
%
save('preca_MJO_EN','preca_MJO_1','preca_MJO_2','preca_MJO_3',...
    'preca_MJO_4','preca_MJO_5','preca_MJO_6','preca_MJO_7','preca_MJO_8',...
    'n','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/prec
%