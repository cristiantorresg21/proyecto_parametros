%%obtencion de datos 

function [nc nn np nt nodos n_ini n_fin c_aux componentes Valores m_aux]=obtendatos(direccion)
%% obtencion de la informacion
filename=direccion;
idx = strfind(direccion,"\")
fdx = strfind(direccion,".net")

netlist = extractBetween(direccion,idx(length(idx))+1,strlength(direccion)-4)
netlist=char(netlist)
archivo=[netlist,'.txt'];
if exist(archivo,'file')~=0
    delete(archivo); 
end
comando_copia=['copy ',filename];
system(comando_copia);
comando_renombrar=['rename ',netlist,'.net ',netlist,'.txt'];
system(comando_renombrar);
tabla_datos=readcell(archivo);

lim_1=length(tabla_datos);
nc=lim_1-4;
tabla_datos=tabla_datos(2:nc+1,:);
%{
if lim_1==5
   tabla_datos=strsplit(char(tabla_datos)); 
end
%}
componentes=char(tabla_datos(:,1));
n_ini=tabla_datos(:,2);
n_fin=tabla_datos(:,3);
try % toma los valores de la tabla como numeros o como char
    valores_aux=char(tabla_datos(:,4));
    valores_aux=cell2mat(tabla_datos(:,4));
    Valores=valores_aux;
catch
    valores_aux=tabla_datos(:,4);
    Valores=[];
    for i=1:1:nc
        if ischar(valores_aux{i})==1 %%si los numeros son char los convierte a numeros 
            Valores(i,:)=valor(strtrim(valores_aux{i}));
        else
            Valores(i,:)=cell2mat(valores_aux(i,:));
        end
    end       
end
n_aux=[n_ini;n_fin];
for i=1:1:nc*2
    a=cell2mat(n_aux(i));
    if a==0
        n_aux(i)=cellstr('ref');
    end
end
 
%% busqueda de nodos

nn=1;
nodos=cellstr(char('ref'));
nt=char('R');
nx3=length(n_aux);
c_aux=[0];
for k=1:1:nx3
    nx=length(nodos);
    nx2=1;
    if strcmp('ref',n_aux(k,:))==1
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
%         if aux(:,1)=='V'
%             np=np+1;
%             nt=[nt; 'P'];
%         else 
%             nt=[nt; 'S'];
%         end
    end
end
np=nn-1;
m_aux=zeros(np);

%% sentido de la matriz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puertos=[];
nodos_internos=[];
k=1;
nx3=length(nodos);
for k=1:1:nx3 
    aux=char(nodos(k,:));
    if aux(:,1)=='V'
        %np=np+1;
        puertos=[puertos;nodos(k,:)];
    elseif aux(:,1)=='N'
        nodos_internos=[nodos_internos;nodos(k,:)];
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
npuertos=length(puertos);
ind_puertos=str2num(char(erase(puertos,"V")));
[puertos]=ordenar(npuertos,puertos,ind_puertos);
nninternos=length(nodos_internos); 
if isempty(nodos_internos)~=1 
    ind_nninternos = str2num(char(erase(nodos_internos,"N")));   
    [nodos_internos]=ordenar(nninternos,nodos_internos,ind_nninternos)';
end

nodos =['ref'; puertos;nodos_internos'];
nt=['R';char([ones(npuertos,1)*80;ones(nninternos,1)*83])];
np=npuertos;
end