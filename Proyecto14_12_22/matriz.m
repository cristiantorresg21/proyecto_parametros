%%ordena los nodos
function [m_aux]=matriz(fa,nn,nc,coordenadas,Y,m_aux)
for nnx=1:1:nn %recorre puertos
    for ncx=1:1:nc %recorre componentes
        if coordenadas(ncx,1)==nnx %coordenada ini   
            if coordenadas(ncx,1)==0
                cnvi=0;
            else
                cnvi=fa(coordenadas(ncx,1),:);
            end
            if coordenadas(ncx,2)==0 %coordenada fin
                cnvf=0;
            else
                cnvf=fa(coordenadas(ncx,2),:);
            end
            m_aux(nnx,:)=Y(ncx)*cnvi-Y(ncx)*cnvf+m_aux(nnx,:); %vector puerto
        elseif coordenadas(ncx,2)==nnx
            if coordenadas(ncx,1)==0%coordenada ini
                cnvi=0;
            else
                cnvi=fa(coordenadas(ncx,1),:);
            end
            if coordenadas(ncx,2)==0%coordenada fin
                cnvf=0;
            else
                cnvf=fa(coordenadas(ncx,2),:);
            end
            m_aux(nnx,:)=-Y(nnx)*cnvi+Y(ncx)*cnvf+m_aux(nnx,:); %vector puerto
        end
    end
end
end