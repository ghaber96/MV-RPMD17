function [oNuc] = updNucPos(nuclei, electrons, alpha)
%using the Adams-Bashforth fourth order integrator, update the poisition
%of the alpha nucleus. pMom means previous momentum, ppMom means second
%previous etc.

global paramObj;
% set up array with coefficients from Adams-Bashforth method
coeff = MyConstants.ADAMS_FOURTH;
iNuc = nuclei(alpha);
oNuc = iNuc;
% update for every dimension (x, y, z)
% Update the position of the nucleus according to adams fourth order soln
% to diff EQ
for j = 1:length(coeff)
    oNuc.pos(:, 1) = oNuc.pos(:, 1) + timeStep / 24 * ...
        (iNuc.mom(:, j) * coeff(j)) / paramObj.massNuc;
end

% Update previous positions by moving each up one
for j = 1:(length(coeff) - 1)
    oNuc.pos(:, j + 1) = iNuc.pos(:, j);
    oNuc.theta(j + 1) = iNuc.theta(j);
    oNuc.dThdR(:, j + 1) = iNuc.dThdR(:, j);
    oNuc.dVndR(:, j + 1) = iNuv.dVndR(:, j);
    oNuc.accel(:, j + 1) = iNuc.accel(:, j);
end

nuclei(alpha) = oNuc;

% update other variables
oNuc.theta(1) = calcTheta(nuclei, electrons);
oNuc.dThdR(:, 1) = dThetadR(nuclei, electrons, alpha);
oNuc.dVndR(:, 1) = dV0dR(oNuc);
oNuc.accel(:, 1) = calcAccel(nuclei, alpha);
end


