
%%Calcula Y y Z por componente

function [np nc nn coordenadas m_aux Y Z nt]=calculaYZ(f,nc,nn,np,nt,nodos,n_ini,n_fin,c_aux,componentes,Valores,m_aux)
w=2*pi*f;
m=1;
coordenadas=zeros(nc,2);
for j=1:1:nc
    for ncx=1:1:nn
        if strcmp(nodos(ncx,:),n_ini(j,:))==1
           coordenadas(j,1)=c_aux(ncx,:);
        end
        if strcmp(nodos(ncx,:),n_fin(j,:))==1
           coordenadas(j,2)=c_aux(ncx,:);
        end  
    end
    if componentes(j,1)=='R'
        c(j,1)='R';
        Z(j,1)=Valores(j);
        Y(j,1)=1/Valores(j);
    elseif componentes(j,1)=='L'
        c(j,1)='L';
        Z(j,1)=Valores(j)*w*i;
        Y(j,1)=1/(w*i*Valores(j));
    elseif componentes(j,1)=='C'
        c(j,1)='C';
        Z(j,1)=1/(w*i*Valores(j));
        Y(j,1)=Valores(j)*w*i;
    end
end
end