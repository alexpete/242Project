%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function creates a BML object
% Inputs:
%
%    rho: density of grid
%   nrow: number of rows in grid
%   ncol: number of columns in grid
%      p: probability of a car being red
%   nred: optional number of red cars (nblue must also be specified)
%  nblue: optional number of blue cars (nred must also be specified)
%
% Output:
%
%      b: A BML object containing the grid information at t = 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [c x y] = makebml(rho, nrow, ncol)

    n = floor(rho*nrow*ncol);
    c = ones(1, n) + binornd(1, .5, 1, n); % red is represented by 2, blue by 1
    
    loc = randsample(nrow*ncol - 1, n);
    x = floor(loc/nrow)';
    y = mod(loc, nrow)';
end
        