function [MMat] = calcMMat(nucleus)
% calculate the M matrix described in the paper based on the nuclear
% positions of the alpha particle

global paramObj;
% define constants
neStates = paramObj.numElecStates;
betaP = paramObj.beta / paramObj.ringSize;

% Calculate the diabatic potential matrix at the point of interest in order
% to determine MMat
diabV = findPot(nucleus.pos, paramObj.potDesc);

% fill in MMat according to the prescription detailed in the paper
MMat = zeros(neStates);
for n = 1:neStates
    for m = 1:neStates
        if (n == m)
            MMat(n, m) = exp(-betaP * diabV(n, n));
        else
            MMat(n, m) = -betaP * diabV(n, m) * exp(-betaP * diabV(n, n));
        end
    end
end

end

