function [ cMat ] = calcCMat(electron)
% calculate the C matrix as defined in the paper (kronecker product of x +
% ip and x - ip_
global paramObj;
dummy = zeros(paramObj.numElecStates, 1);
for j = 1:paramObj.numElecStates
    dummy(j) = electron.pos(j, 1) + 1i * electron.mom(j, 1);
end
cMat = kron(dummy, dummy');
end

% THIS IS PROBABLY FLAWED. FIGURE OUT THE DIMENSIONALITY OF THE ELECTRONIC
% STATE VARIABLES