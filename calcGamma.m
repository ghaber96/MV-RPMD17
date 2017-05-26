function [ gamma ] = calcGamma(nuclei, electrons)
% Calculate the value of gamma
%Set up initial space necessary

global paramObj;
ident = eye(paramObj.numElecStates);
gamma = ident;

% Put in the values and run through all imaginary beads
for alpha = 1:length(paramObj.ringSize)
    cMat = calcCMat(electrons(alpha));
    MMat = calcMMat(nuclei(alpha));
    gamma = gamma * (cMat - 0.5 * ident) * MMat;
end
end
