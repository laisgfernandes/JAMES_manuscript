%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Calculating the daily olr anomalies over SA             %
%                        in each MJO phase for DJF                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for La Nina:
%
clc
clear
%
cd G:/Lais_jasmin/u-bs743/data/olr
%
load olra_MJO; 
%
cd G:/Lais_jasmin/u-bs743/data/ENSO
%
load MJO; clear amp_EN amp_NT phase_EN phase_NT;
%
%Putting NaN in olra when the MJO is inactive (amplitude < 1)
%
for j = 1:I*J
for i = 1:T
if amp_LN(i) < 1
olra(i,j) = NaN;
end
end
end
%
for j = 1:I*J
for i = 1:T
if isnan(amp_LN(i))
olra(i,j) = NaN;
end
end
end
%
%Separating preca according to the MJO phases:
%
%MJO phase 1-------------------
%
olra_MJO_1 = olra;
%
for j = 1:I*J
for i = 1:T
    if phase_LN(i) ~= 1
        olra_MJO_1(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_LN(:) ~= 1); b = find(amp_LN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
olra_MJO_1(c,:) = [];
end
%
%MJO phase 2-------------------
%
olra_MJO_2 = olra;
%
for j = 1:I*J
for i = 1:T
    if phase_LN(i) ~= 2
        olra_MJO_2(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_LN(:) ~= 2); b = find(amp_LN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
olra_MJO_2(c,:) = [];
end
%
%MJO phase 3-------------------
%
olra_MJO_3 = olra;
%
for j = 1:I*J
for i = 1:T
    if phase_LN(i) ~= 3
        olra_MJO_3(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_LN(:) ~= 3); b = find(amp_LN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
olra_MJO_3(c,:) = [];
end
%
%MJO phase 4-------------------
%
olra_MJO_4 = olra;
%
for j = 1:I*J
for i = 1:T
    if phase_LN(i) ~= 4
        olra_MJO_4(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_LN(:) ~= 4); b = find(amp_LN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
olra_MJO_4(c,:) = [];
end
%
%MJO phase 5-------------------
%
olra_MJO_5 = olra;
%
for j = 1:I*J
for i = 1:T
    if phase_LN(i) ~= 5
        olra_MJO_5(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_LN(:) ~= 5); b = find(amp_LN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
olra_MJO_5(c,:) = [];
end
%
%MJO phase 6-------------------
%
olra_MJO_6 = olra;
%
for j = 1:I*J
for i = 1:T
    if phase_LN(i) ~= 6
        olra_MJO_6(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_LN(:) ~= 6); b = find(amp_LN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
olra_MJO_6(c,:) = [];
end
%
%MJO phase 7-------------------
%
olra_MJO_7 = olra;
%
for j = 1:I*J
for i = 1:T
    if phase_LN(i) ~= 7
        olra_MJO_7(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_LN(:) ~= 7); b = find(amp_LN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
olra_MJO_7(c,:) = [];
end
%
%MJO phase 8-------------------
%
olra_MJO_8 = olra;
%
for j = 1:I*J
for i = 1:T
    if phase_LN(i) ~= 8
        olra_MJO_8(i,j) = NaN;
    end
end
end
%
%Eliminating NaN:
%
a = find(phase_LN(:) ~= 8); b = find(amp_LN(:) < 1); 
%
c = [a ; b]; c = unique(c);
%
for i = c(:)
olra_MJO_8(c,:) = [];
end
%
%Finding the number of days in each MJO phase in DJF:
%
[T1,n] = size(olra_MJO_1); [T2,n] = size(olra_MJO_2);
%
[T3,n] = size(olra_MJO_3); [T4,n] = size(olra_MJO_4);
%
[T5,n] = size(olra_MJO_5); [T6,n] = size(olra_MJO_6);
%
[T7,n] = size(olra_MJO_7); [T8,n] = size(olra_MJO_8);
%
n = [T1 T2 T3 T4 T5 T6 T7 T8];
%
cd G:/Lais_jasmin/u-bs743/data/olr
%
save('olra_MJO_LN','olra_MJO_1','olra_MJO_2','olra_MJO_3',...
    'olra_MJO_4','olra_MJO_5','olra_MJO_6','olra_MJO_7','olra_MJO_8',...
    'n','lat','lon','lat1','lon1','I','J','T','K','L','-v7.3');
%
cd G:/Lais_jasmin/u-bs743/scripts/olr
%