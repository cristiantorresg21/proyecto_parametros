%this function converts pparameters Z to s (only works for 2x2 matrix)
function s = Z_to_s(Z,Zo)

    Z_n= Z/Zo;
    delta_z = (Z_n(1,1)+1)*(Z_n(2,2,)+1)-(Z_n(1,2)*Z_n(2,1));
    s = [(Z_n(1,1)-1)*(Z_n(2,2)+1)-(Z_n(1,2)*Z_n(2,1))/delta_z,2*Z_n(1,2)/delta_z;2*Z_n(2,1)/delta_z,(Z_n(1,1)+1)*(Z_n(2,2)-1)-(Z_n(1,2)*Z_n(2,1))/delta_z];
end
