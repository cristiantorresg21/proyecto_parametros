% this function plot the info for a touchstone file ( this information is
% mandatory to save in format RI)

function plot_touchstone_db(S_50,type)
   
    size_p = S_50.NumPorts;
    aux = 1;
    figure('name',strcat('Grafica de dB de parametros ',type));
    for i = 1:size_p
        
        for j = 1:size_p

            subplot(size_p,size_p,aux)
             aux_p =rfparam(S_50,i,j);
             for k = 1: size(aux_p,1)
                
                 aux_p(k,1)= 20*log10(aux_p(k,1));

             end    
            freq =S_50.Frequencies;
            plot(freq,aux_p)
            title(strcat(type,int2str(i),int2str(j)))
            aux = aux + 1;

        end    
           
    end
    

end


    