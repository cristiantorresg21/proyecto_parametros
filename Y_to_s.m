%this function converts parameters Y to s (only works for 2x2 matrix)

function s = Y_to_s(Y,Zo)

    Y_n = Zo*Y;
    delta_y = (1+Y_n(1,1))*(1+Y_n(2,2))-(Y_n(2,1)*Y_n(1,2));
    s = [(1-Y_n(1,1))*(1+Y_n(2,2))-(Y_n(2,1)*Y_n(1,2))/delta_y,-2*Y_n(1,2)/delta_y;-2*Y_n(2,1)/delta_y,(1+Y_n(1,1))*(1-Y_n(2,2))-(Y_n(2,1)*Y_n(1,2))/delta_y];
    

end