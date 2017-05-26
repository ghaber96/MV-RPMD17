function [deriv] = dThetadR(system, alpha)
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
        loopSys = system;
        loopSys.nuclei(alpha).pos(j) = loopNuc.nuclei(alpha).pos(j) + ...
            (i - reC) * diff;
        deriv(j) = deriv(j) + coeff(i) * calcTheta(loopSys) / diff;
    end
end

end
