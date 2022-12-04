function [coordenadas,Y,c_aux,nt] = simplify_circuits(c_aux,coordenadas,Y,nt)
 
Y_AUX=0;
Tamano_aux = size(Y_AUX,1);
tamano = size(Y,1);
    while  Tamano_aux ~= tamano  
        
        Y_AUX = Y;
        Tamano_aux = size(Y_AUX,1);
        [coordenadas,Y] = parallels(coordenadas,Y);
        [coordenadas,Y,c_aux,nt] = series(c_aux,coordenadas,Y,nt);
        tamano = size(Y,1);
    
    end    

end