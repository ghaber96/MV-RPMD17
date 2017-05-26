function [oNucleus] = updNucMom(iNuc)
% update the nuclear momentum
global paramObj

coeff = MyConstants.ADAMS_FOURTH;

oNucleus = iNuc;
pre2 = paramObj.ringSize / paramObj.beta;
pre1 = - pre2 * paramObj.massNuc / paramObj.beta;

for j = 1:length(coeff)
    oNucleus.mom(:, 1) = oNucleus.mom(:, 1) + timeStep * coeff(j) / 24 * ...
        (pre1 * oNucleus.accel(:, j) - oNucleus.dVndR(:, j) + pre2 /...
        oNucleus.theta(j) * oNucelus.dThdR(:, j));
end

for u = 1:(length(coeff) - 1)
    oNucleus.mom(:, u + 1) = iNuc.mom(:, u);
end
end

