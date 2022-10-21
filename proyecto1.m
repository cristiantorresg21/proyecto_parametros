clc;clear all;
%[coordenadas,Y] = parallels(coordenadas,Y); %%function to simplify parallels
%% obtencion de archivo
%%filename ='C:\Users\Cristian\Desktop\ejemplos LTspice\ejemplo1.net' % route on Cristian's computer
filename = 'C:\Users\a9300\OneDrive\Documentos\maestria\microondas 1\proyectos\simulador\ejemplos LTspice\ejemplo1.net'; %% route on Jc's computer
A = importdata(filename);
%A = readtable(filename);
%% obtencion de la informacion
lim_1=length(A.textdata);
nc=lim_1-4;
Valores=A.data;
componentes=cell2mat(A.textdata(2:lim_1-3,1));
n_ini=A.textdata(2:lim_1-3,2);
n_fin=A.textdata(2:lim_1-3,3);

%% busqueda de nodos
n_aux=[n_ini;n_fin];
np=0; 
nn=1;
nodos=cellstr(char('ref'));
nt=char('R');
nx3=length(n_aux);
c_aux=[0];
for k=1:1:nx3
    nx=length(nodos);
    nx2=1;
    if strcmp('0',n_aux(k,:))==1
        n_aux(k,:)=cellstr('ref');
    end
    for k2=1:1:nx
        if strcmp(nodos(k2,:),n_aux(k,:))==1   %%compara si son iguales
            nx2=nx2+1;
        end   
    end
    if nx2==1
        nodos=[nodos; n_aux(k,:)];
        c_aux=[c_aux; nn];
        nn=nn+1;
        aux=char(n_aux(k,:));
        if aux(:,1)=='V'
            np=np+1;
            nt=[nt; 'P'];
        else 
            nt=[nt; 'S'];
        end
    end
end
m_aux=zeros(np);

%% reconocimiento de componentes y obtencion de valores
f=100;
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
nn=nn-1;
clearvars -except Y Z np nt m_aux nodos nn c_aux coordenadas nc
%% Calculo de matriz Y
for npx=1:1:np %recorre puertos
    for ncx=1:1:nc %recorre componentes
        if coordenadas(ncx,1)==npx %coordenada ini   
            if coordenadas(ncx,1)==0
                cnvi=0;
            else
                cnvi=zeros(1,np);
                cnvi(coordenadas(ncx,1))=1;
            end
            if coordenadas(ncx,2)==0 %coordenada fin
                cnvf=0;
            else
                cnvf=zeros(1,np);
                cnvf(coordenadas(ncx,2))=1;
            end
            m_aux(npx,:)=Y(ncx)*cnvi-Y(ncx)*cnvf+m_aux(npx,:); %vector puerto
        elseif coordenadas(ncx,2)==npx
            if coordenadas(ncx,1)==0%coordenada ini
                cnvi=0;
            else
                cnvi=zeros(1,np);
                cnvi(coordenadas(ncx,1))=1;
            end
            if coordenadas(ncx,2)==0%coordenada fin
                cnvf=0;
            else
                cnvf=zeros(1,np);
                cnvf(coordenadas(ncx,2))=1;
            end
            m_aux(npx,:)=-Y(ncx)*cnvi+Y(ncx)*cnvf+m_aux(npx,:); %vector puerto
        end
    end
end

Ym=m_aux
Zm=m_aux^-1

[coordenadas,Y] = parallels(coordenadas,Y)
mat_graf = mat_grafos(coordenadas,c_aux)
