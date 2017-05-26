classdef parameters
    properties 
        massNuc
        massElec
        ringSize
        dimension
        beta
        numElecStates
        potAValue
        potCValue
        potDeltaValue
        pot0KValue
        potDesc
        derivDiff
    end
    methods
        function paramObj = parameters()
            % constructor, input the appropriate values for parameters
            initialCond = importdata('initialConditions.m');
            initialCondArray = initialCond.data;
            paramObj.massNuc = initialCondArray(1);
            paramObj.massElec = initialCondArray(2);
            paramObj.ringSize = initialCondArray(3);
            paramObj.dimension = initialCondArray(4);
            paramObj.beta = initialCondArray(5);
            paramObj.numElecStates = initialCondArray(6);
            paramObj.potAValue = initialCondArray(7);
            paramObj.potCValue = initialCondArray(8);
            paramObj.potDeltaValue = initialCondArray(9);
            paramObj.pot0KValue = initialCondArray(10);
            paramObj.potDesc = initialCondArray(11);
            paramObj.derivDiff = initialCondArray(12);
        end
    end
end