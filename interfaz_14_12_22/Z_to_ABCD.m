% this function converts parameters z to ABCD

function ABCD = Z_to_ABCD(Z)

    delta_Z = (Z(1,1)*Z(2,2))-(Z(2,1)*Z(1,2));
    ABCD = [Z(1,1)/Z(2,1),delta_Z/Z(2,1);1/Z(2,1),Z(2,2)/Z(2,1)];

end