% Test Script
global paramObj
paramObj = parameters();
nucleus = struct('pos', [1;1;1], 'mom', [1;1;1]);
nuclei = nucleus;
electrons = nuclei;
g = dThetadR(nuclei, electrons, 1)