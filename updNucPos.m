function [oNuc] = updNucPos(systemTot, alpha)
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
for time = 1:length(coeff)
    oNuc.pos(:) = oNuc.pos(:) + timeStep / 24 * ...
        (systemTot(time).nuclei(alpha).mom(:) * coeff(time)) / paramObj.massNuc;
end

end


