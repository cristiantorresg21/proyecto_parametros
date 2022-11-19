
function [coordenadas,Y,c_aux] = series(mat_graf,c_aux,coordenadas,Y)

    G=graph(mat_graf);
    tamano = size(c_aux);
    tamano = tamano (1,1);
    
    for i = 1 : tamano 

        vecinos = neighbors(G,i);
        tamano_v = size(vecinos);
        if(tamano_v(1,1) == 1)
        
            vecinos_2 = neighbors(G,vecinos);
            tamano_v1 = size(vecinos_2);
            if(tamano_v1(1,1) == 2)
                
                for j = 1 : tamano-1

                        if((coordenadas(j,1)== i & coordenadas(j,2)== vecinos ) | (coordenadas(j,1)== vecinos & coordenadas(j,2)== i))

                            for k = j+1:tamano 
                                    
                                if((coordenadas(k,1)== vecinos & coordenadas(k,2)== vecinos_2(2,1) ) | (coordenadas(k,1)== vecinos_2(2,1) & coordenadas(k,2)== vecinos))

                                     Y(j,1) = 1/((1/Y(j,1))+(1/Y(k,1)));
                                     Y(k, :) =[];
                                     coordenadas(j,2) = coordenadas(k,2);
                                     [row,colum] = find(c_aux == coordenadas(k,1));
                                     c_aux(row,:)  = [];   
                                     coordenadas(k, :) = [];

                                     return

                                end

                            end    
         
                        end    
                end

            end 
        end
    end
end