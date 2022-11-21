function plot_touchstone_db(direction)
    
    %S_50 = sparameters('1501_BRAVO_0dBm.s2p');
    S_50 = sparameters(direction);
    %S_50= sparameters('test.s2p');
    size = S_50.NumPorts;
    aux = 1;
   % plot_figure_smith = figure;
    figure('name','grafica Smith');
    for i = 1:size
        
        for j = 1:size

            subplot(size,size,aux)
            smith(S_50,i,j)
            title(strcat('S',int2str(i),int2str(j)))
            aux = aux + 1;

        end    
           
    end
    

end