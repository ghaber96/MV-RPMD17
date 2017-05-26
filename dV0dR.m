function [deriv] = dV0dR(nucleus)
% Calculate 4th order approx to dR/dR

% General case
global paramObj
coeff = MyConstants.FO_COEFF;
dim = paramObj.dimension;
deriv = zeros(dim, 1);
diff = paramObj.derivDiff;
lengthC = length(coeff);
reC = (lengthC + 1) / 2;
for j = 1:dim
    for i = 1:lengthC
        loopNuc = nucleus;
        loopNuc.pos(j, 1) = loopNuc.pos(j, 1) + ...
            (i - reC) * diff;
        deriv(j) = deriv(j) + coeff(i) * calcV0(loopNuc) / diff;
    end
end
end

