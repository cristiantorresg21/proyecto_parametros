% this function plot the info for a touchstone file ( this information is
% mandatory to save in format RI)

function plot_touchstone(direction)

    S_50 = sparameters(direction);
    rfplot(S_50)
    
end


    