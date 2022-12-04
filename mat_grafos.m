%THIS FUNCTION GENERATES A MATRIX TO USE GRAFOS
function mat_graf = mat_grafos(coordenadas,c_aux,Y)

    tamano = max(c_aux)+1;
    tamano = tamano(1);
    tamano_c = size(coordenadas,1);
    mat_graf = zeros(tamano,tamano);
    for i =1: tamano
        
        for j = 1:tamano

            if(i ~= j)
                
                for k=1:tamano_c

                    if((coordenadas(k,1)== i-1 && coordenadas(k,2)== j-1) || (coordenadas(k,1)== j-1 && coordenadas(k,2)== i-1) )

                            z_aux = 1/Y(k,1);
                            aux = sqrt(real(z_aux)^2 +imag(z_aux)^2 );
                            mat_graf(i,j) = aux;

                    end     

                end
            end
        end
    end    


end    