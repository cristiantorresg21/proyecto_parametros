%this function converts Y parameters to ABCD
function ABCD =Y_to_ABCD(Y)

    delta_y=(Y(1,1)*Y(2,2))-(Y(2,1)*Y(1,2));
    ABCD = [-Y(2,2)/Y(2,1),-1/Y(2,1);-delta_y/Y(2,1),-Y(1,1)/Y(2,1)];

end