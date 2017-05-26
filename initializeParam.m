function [paramObj] = initializeParam()
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
initialCond = importdata('initialConditions.m');
initialCondArray = initialCond.data;
paramObj = parameters();
paramObj.massNuc = initialCondArray(1);
paramObj.massElec = initialCondArray(2);
paramObj.ringSize = initialCondArray(3);
paramObj.dimension = initialCondArray(4);
paramObj.beta = initialCondArray(5);
paramObj.numElecStates = initialCondArray(6);
paramObj.potAValue = initialCondArray(7);
paramObj.potCValue = initialCondArray(8);
paramObj.potDeltaValue = initialCondArray(9);
paramObj.potDesc = initialCondArray(10);

end

