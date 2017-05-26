function [ potMat ] = findPot(nucPos, potDesc)
% Based on the nuclear position (nucPos) and the type of potential
% (potDesc), return the diabatic potential matrix of that point

global paramObj;
% Define parameters
a = paramObj.potAValue;
c = paramObj.potCValue;
delta = paramObj.potDeltaValue;
neStates = paramObj.numElecStates;

potMat = zeros(neStates, neStates);

% determine the form of the potential
if (potDesc == 1)
    % put in matrix elements as specified
    for i = 1:paramObj.dimension
        potMat(1, 1) = a * nucPos(i, 1) + c;
        potMat(2, 2) = -a * nucPos(i, 1);
        potMat(1, 2) = delta;
        potMat(2, 1) = conj(potMat(1, 2));
    end
else
    msg = 'Error: you must specify an existing potential';
    error(msg);
end

