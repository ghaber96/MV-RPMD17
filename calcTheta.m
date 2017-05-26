function [theta] = calcTheta(nuclei, electrons)
% Calculate theta based on gamma
gamma = calcGamma(nuclei, electrons);
theta = real(trace(gamma));
end

