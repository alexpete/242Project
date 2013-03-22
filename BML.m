%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BML.m - Class Definition for BML grid
%
% The following m files must be in the current MATLAB search path
%
% makebml.m, movecars.mexw64 (or movecars.mexa64 for Unix), bmlplot.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef BML
    properties
        color
        xloc
        yloc
        nrow
        ncol
    end
    
    methods
        function grid = BML(rho, nrow, ncol)
            [c x y] = makebml(rho, nrow, ncol);
            grid.color = c;
            grid.xloc = x;
            grid.yloc = y;
            grid.nrow = nrow;
            grid.ncol = ncol;
        end % BML

        function nextgrid = move(grid, t)
            [xnew ynew] = movecars(grid.color, grid.xloc, grid.yloc, grid.nrow, grid.ncol, t);
            nextgrid = grid;
            nextgrid.xloc = xnew;
            nextgrid.yloc = ynew;
        end % move
        
        function plot(grid)
            bmlplot(grid.color, grid.xloc, grid.yloc, grid.nrow, grid.ncol)
        end % plot
    end % methods
end % classdef
    
    