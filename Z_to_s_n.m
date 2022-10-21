%this function converts parameters z to s 

function s = Z_to_s_n(Z,Zo)
    
    tamano = size(Z);
    tamano = tamano (1,1);
    Zo_i = eye(tamano);
    Zo_i = Zo_i*eye;
    s = ((Z+Zo_i)^-1)*(Z-Zo_i);

end

