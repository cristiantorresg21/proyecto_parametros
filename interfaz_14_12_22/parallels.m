%THIS FUNCTION SIMPLIFIES PARALLES ON CIRCUITS
function [coordenadas,Y] = parallels(coordenadas,Y)
    tamano = size(Y);
    tamano = tamano(1,1);
    i = 1;
    while i<tamano
        j = i+1;
        while j<=tamano
            if((coordenadas(j,1)== coordenadas(i,1) & coordenadas(j,2)== coordenadas(i,2)) | (coordenadas(j,2)== coordenadas(i,1) & coordenadas(j,1)== coordenadas(i,2)) )
                Y(i,1) = Y(i,1)+Y(j,1);
                Y(j, :) =[];
                coordenadas(j, :) = [];
                tamano = tamano-1;
            else
                j = j+1;
            end
        end
        i = i+1;
    end
end


      