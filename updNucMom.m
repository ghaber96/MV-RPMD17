function [oNucleus] = updNucMom(systemTot, alpha)
% update the nuclear momentum
global paramObj

coeff = MyConstants.ADAMS_FOURTH;
pre2 = paramObj.ringSize / paramObj.beta;
pre1 = - pre2 * paramObj.massNuc / paramObj.beta;

oNucleus = systemTot(1).nuclei(alpha);

for time = 1:length(coeff)
    oNucleus.mom(:) = oNucleus.mom(:) + timeStep * coeff(time) / 24 * ...
        (pre1 * systemTot(time).nuclei(alpha).accel(:) - ...
        systemTot(time).nuclei(alpha).dVndR(:) + pre2 /...
        systemTot(time).theta * systemTot(time).nuclei(alpha).dThdR(:));
end
end

