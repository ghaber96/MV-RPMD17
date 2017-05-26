function [accel] = calcAccel(nuclei, alpha)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global paramObj
if ((alpha + 1) > paramObj.ringSize)
    alphaPlus = 1;
else
    alphaPlus = alpha + 1;
end
if (alpha == 1)
    alphaMinus = 1;
else
    alphaMinus = alpha - 1;
end
accel = 2 * nuclei(alpha).pos(:, 1) - nuclei(alphaPlus).pos(:, 1) - ...
    nuclei(alphaMinus).pos(:, 1);

end

