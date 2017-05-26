function [deriv] = dThetadR(nuclei, electrons, alpha)
% Calculate dTheta/dR using fourth order finite differencing methods. Seems
% sort of inefficient, ask Joe if there is a better way to do this...
global paramObj
coeff = MyConstants.FO_COEFF;
dim = paramObj.dimension;
deriv = zeros(dim, 1);
diff = paramObj.derivDiff;
lengthC = length(coeff);
reC = (lengthC + 1) / 2;
for j = 1:dim
    for i = 1:lengthC
        loopNuc = nuclei;
        loopNuc(alpha).pos(j, 1) = loopNuc(alpha).pos(j, 1) + ...
            (i - reC) * diff;
        deriv(j) = deriv(j) + coeff(i) * calcTheta(loopNuc, electrons) / diff;
    end
end

end