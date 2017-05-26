function [deriv] = dThetadxp(nuclei, electrons, alpha, type)
% Calculate dTheta/dR using fourth order finite differencing methods. Seems
% sort of inefficient, ask Joe if there is a better way to do this...
global paramObj
coeff = MyConstants.FO_COEFF;
dim = paramObj.numElecStates;
deriv = zeros(dim, 1);
diff = paramObj.derivDiff;
lengthC = length(coeff);
reC = (lengthC + 1) / 2;
for j = 1:dim
    for i = 1:lengthC
        loopElec = electrons;
        if (type == 'p')
            loopElec(alpha).mom(j, 1) = loopElec(alpha).mom(j, 1) + ...
            (i - reC) * diff;
        elseif (type == 'x')
            loopElec(alpha).pos(j, 1) = loopElec(alpha).pos(j, 1) + ...
                (i - reC) * diff;
        end
        deriv(j) = deriv(j) + coeff(i) * calcTheta(nuclei, loopElec) / diff;
    end
end

end