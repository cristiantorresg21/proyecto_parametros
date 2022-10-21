clc;clear all;
%% carpeta de simulaciones de juan
%%carpeta='C:\Users\Cristian\Desktop\ejemplos_LTspice';
%% carpeta de simulaciones de Cristian
carpeta='C:\Users\Cristian\Desktop\ejemplos_LTspice';
%% codgio
netlist='ejemplo7';
[nc nn np nt nodos n_ini n_fin c_aux componentes Valores m_aux]=obtendatos(carpeta,netlist);
clearvars carpeta netlist
f=3e9;
[np nc nn coordenadas m_aux Y Z nt]=calculaYZ(f,nc,nn,np,nt,nodos,n_ini,n_fin,c_aux,componentes,Valores,m_aux);
nn=nn-1;
%% Calculo de matriz YZ por nodo
fa=diag(ones(1,nn));
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
    pY=matriz_nodos
elseif ns==1;   
    ma=diag(ones(1,np));    
    h=matriz_nodos(nn,1:2)/(-matriz_nodos(nn,nn));
    fa=[ma; h];
    m_aux=zeros(np);
    [pY]=matriz(fa,np,nc,coordenadas,Y,m_aux)
else
    ma=diag(ones(1,np));
    %ns=nn-np
    haux=matriz_nodos(ns+1:nn,:);
    haux(:,ns+1:nn)=-haux(:,ns+1:nn);
    [haux]=escalonar(haux,ns);
    h=haux(:,ns+1:nn);
    fa=[ma; h];
    m_aux=zeros(np);
    [pY]=matriz(fa,np,nc,coordenadas,Y,m_aux)
end 
% if det(Ym)~=0
%     Zm=m_aux^-1
% else 
%     Zm=0
% end