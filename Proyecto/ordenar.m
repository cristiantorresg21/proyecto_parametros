%%ordena los nodos
function [nsx_3]=ordenar(nn,nsx_3,nsx_2)
for hk=1:1:nn
    for nk=1:1:nn-1
        if nsx_2(nk)>nsx_2(nk+1)
            aa=nsx_2(nk);
            ba=nsx_2(nk+1);
            nsx_2(nk)=ba;
            nsx_2(nk+1)=aa;
            
            ab=nsx_3(nk);
            bb=nsx_3(nk+1);
            nsx_3(nk)=bb;
            nsx_3(nk+1)=ab;
        end
    end
end
end