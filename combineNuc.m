function [cNuc] = combineNuc(xUpNuc, pUpNuc)
% combine the updated portions of the two nuclei

cNuc = xUpNuc;
cNuc.mom = pUpNuc.mom;
end

