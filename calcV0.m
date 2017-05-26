function [V0] = calcV0(nucleus)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global paramObj

dim = paramObj.dimension;
k = paramObj.pot0KValue;

V0 = 0;
for j = 1:dim
    V0 = V0 + 0.5 * k * nucleus.pos(j, 1) ^ 2;
end

end

