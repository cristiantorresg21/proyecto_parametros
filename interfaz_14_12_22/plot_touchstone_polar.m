function plot_touchstone_polar(S_50,type)
    
    size = S_50.NumPorts;
    aux = 1;
    figure('name',strcat('Grafica de Polar de parametros ',type));
    for i = 1:size
        
        for j = 1:size

            subplot(size,size,aux)
            polarplot(rfparam(S_50,i,j))
            title(strcat(type,int2str(i),int2str(j)))
            aux = aux + 1;

        end    
           
    end
    

end