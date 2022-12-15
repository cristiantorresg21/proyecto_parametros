function plot_touchstone_imag(S_50,type)
    
    size = S_50.NumPorts;
    aux = 1;
    figure('name',strcat('Grafica de imaginario de parametros ',type));
    for i = 1:size
        
        for j = 1:size

            subplot(size,size,aux)
            aux_p =rfparam(S_50,i,j);
            freq =S_50.Frequencies;
            plot(freq,aux_p)
            title(strcat(type,int2str(i),int2str(j)))
            aux = aux + 1;

        end    
           
    end
    

end