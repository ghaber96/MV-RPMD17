function [theta] = calcTheta(system)
% Calculate theta based on gamma
gamma = calcGamma(system);
theta = real(trace(gamma));
end

