%THIS FUNCTION GENERATES A MATRIX TO USE GRAFOS
function mat_graf = mat_grafos(coordenadas,c_aux)

    tamano = size(c_aux);
    tamano = tamano(1);
    tamano_c = size(coordenadas);
    tamano_c = tamano_c(1,1);
    mat_graf = zeros(tamano,tamano);
    for i =1: tamano
        
        for j = 1:tamano

            if(i ~= j)
                
                for k=1:tamano_c

                    if((coordenadas(k,1)== i-1 & coordenadas(k,2)== j-1) | (coordenadas(k,1)== j-1 & coordenadas(k,2)== i-1) )

                            mat_graf(i,j) = 1;

                    end     

                end
            end
        end
    end    


end    