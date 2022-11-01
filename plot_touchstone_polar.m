function plot_touchstone_polar(direction)
    
    %S_50 = sparameters('1501_BRAVO_0dBm.s2p');
    S_50 = sparameters(direction);
    size = S_50.NumPorts;
    aux = 1;
    for i = 1:size
        
        for j = 1:size

            subplot(size,size,aux)
            polarplot(rfparam(S_50,i,j))
            title(strcat('S',int2str(i),int2str(j)))
            aux = aux + 1;

        end    
           
    end
    

end