
function [Ym,Zm,np,exist] = matrizYZ(f,direccion)

    
    %% codgio
    [nc nn np nt nodos n_ini n_fin c_aux componentes Valores m_aux]=obtendatos(direccion);
    clearvars carpeta netlist
    exist = true;
    if (nn==3)&(np==1)&(nc==1)
            w=2*pi*f;
            if componentes=='R'
                Z=Valores;
            elseif componentes=='L'
                Z=Valores*w*f;
            elseif componentes=='C'
                Z=1/(w*f*Valores);
            end
            Zm=Z*ones(2,2)
            Ym=zeros(2,2)
        else
        [np nc nn coordenadas m_aux Y Z nt]=calculaYZ(f,nc,nn,np,nt,nodos,n_ini,n_fin,c_aux,componentes,Valores,m_aux);
        nn=nn-1;
        clearvars -except nn nc nt coordenadas Y Z m_aux c_aux np exist
        %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %calcula series y paralelos
        [coordenadas,Y,c_aux,nt] = simplify_circuits(c_aux,coordenadas,Y,nt)
        % Y,coordenadas
        % [coordenadas,Y,c_aux,nt] = series(c_aux,coordenadas,Y,nt); %no funciona :c
        % Y,coordenadas
        % [coordenadas,Y,c_aux,nt] = series(c_aux,coordenadas,Y,nt);
        % Y
        % [coordenadas,Y] = parallels(coordenadas,Y);
        % Y
        % [coordenadas,Y,c_aux,nt] = series(c_aux,coordenadas,Y,nt);
        % Y
        % coordenadas
        %falta nt :c
        
        %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Calculo de matriz YZ por nodo
        
        aux=unique([coordenadas(:,1)',coordenadas(:,2)']);
        nn=length(aux)-1;
        dk=size(coordenadas);
        nc=dk(1,1);
        
        m_aux=zeros(nn);
        fa=diag(ones(1,nn));
        if (nn==1)&(nc==2)&(np==1)
            Zm=ones(2,2)/Y
            Ym=zeros(2,2)
        else
        if (nc==1)&(np==2)
            Ym=Y*[1,-1;-1,1]
            Zm=0
            exist =  false;
        else
        [m_aux]=matriz(fa,nn,nc,coordenadas,Y,m_aux);
        matriz_nodos=m_aux;
        % Calculo de matriz Y por puerto
        ns=0;
        for x=1:1:nn+1
            if strcmp(nt(x),'S')==1
            ns=ns+1;
            end
        end
        if ns==0 
            pY=matriz_nodos;
        elseif ns==1;   
            ma=diag(ones(1,np));    
            h=matriz_nodos(nn,1:2)/(-matriz_nodos(nn,nn));
            fa=[ma; h];
            m_aux=zeros(np);
            [pY]=matriz(fa,np,nc,coordenadas,Y,m_aux);
        else
            ma=diag(ones(1,np));
            %ns=nn-np
            haux=matriz_nodos(ns+1:nn,:);
            haux(:,ns+1:nn)=-haux(:,ns+1:nn);
            [haux]=escalonar(haux,ns);
            h=haux(:,ns+1:nn);
            fa=[ma; h];
            m_aux=zeros(np);
            [pY]=matriz(fa,np,nc,coordenadas,Y,m_aux);
        end
        
        Ym=pY
        Zm=pY^-1
        
        end
        end
    end
end

