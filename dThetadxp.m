function [deriv] = dThetadxp(system, alpha, type)
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
        loopSys = system;
        if (type == 'p')
            loopSys.electrons(alpha).mom(j) = loopSys.electrons(alpha).mom(j) + ...
            (i - reC) * diff;
        elseif (type == 'x')
            loopSys.electrons(alpha).pos(j) = loopSys.electrons(alpha).pos(j) + ...
                (i - reC) * diff;
        end
        deriv(j) = deriv(j) + coeff(i) * calcTheta(loopSys) / diff;
    end
end

end
