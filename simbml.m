%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simbml.m - This function simulates the Biham-Middleton-Levine 
% Traffic Model.
%
% Inputs:
%   
%     rho: proportion of cells to be occupied by cars
%    nrow: number of rows in grid
%    ncol: number of columns in grid
%       t: number of time steps to run the simulation for
%     all: logical indicating whether to return the final state of
%           the grid (F, default), or the entire process (T)
%
% Output:
%
% bml_res: A cell array of BML objects of length t + 1, if all = T, or just
%           the final BML object if all = F.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function bml_res = simbml(rho, nrow, ncol, t, all)

    if(nargin < 5)
        all = F
    end
    
    newBML = BML(rho, nrow, ncol);
    if(all)
        bml_seq = cell(1, t+1);
        bml_seq{1} = newBML;
    end
    
    for i = 1:t
        
        newBML = move(newBML, i);
        
        if(all)
            bml_seq{i + 1} = newBML;
        end
    end
    
    if(all) bml_res = bml_seq;
    else bml_res = newBML;
    end
end
