%% This function plots a BML object

function bmlplot(c, x, y, nrow, ncol)

    blueloc = x(c == 1)*nrow + y(c == 1) + 1;
    redloc = x(c == 2)*nrow + y(c == 2) + 1;
    
    % Set Colors
    
    Z = ones(nrow,ncol);
    Z(blueloc) = 0;
    
    tmp = ones(nrow,ncol);
    tmp(redloc) = 0;
    tmp(blueloc) = 0;
    Z(:,:,2) = tmp;
    
    tmp = ones(nrow,ncol);
    tmp(redloc) = 0;
    Z(:,:,3) = tmp;
   
    image(Z)
    set(gca, 'XTickLabel', '', 'YTickLabel', '', 'XTick', [], 'YTick', [])

end