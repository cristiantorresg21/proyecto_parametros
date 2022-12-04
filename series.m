
function [coordenadas,Y,c_aux,nt] = series(c_aux,coordenadas,Y,nt)
    
    tamano = max(c_aux)+1;
    tamano_c = size(coordenadas,1);
    mat_graf = mat_grafos(coordenadas,c_aux,Y);
    G=graph(mat_graf);
    
      
   for i_in = 2 : tamano 
   
   pos_aux = find(c_aux == i_in-1);     
        
    if (isempty(pos_aux) == 0)

        
        i = pos_aux(1,1); 

     if(nt(i,1) == 'S')
                

        vecinos = neighbors(G,i_in);
        tamano_v = size(vecinos,1);
        if(tamano_v == 2)
        
            act = i_in-1;
            susc = vecinos(1,1)-1;
            pass = vecinos(2,1)-1;
            pos_pass=0;
            pos_susc=0;
             for j = 1: tamano_c
        
                    if((coordenadas(j,1) == act && coordenadas(j,2) == susc) || (coordenadas(j,2) == act && coordenadas(j,1) == susc) )
                
                     pos_susc = j;
                     break;

                    end

             end
             for j = 1: tamano_c
        
                    if((coordenadas(j,1) == act && coordenadas(j,2) == pass) || (coordenadas(j,2) == act && coordenadas(j,1) == pass) )
                 
                     pos_pass = j;
                     break;

                    end

             end
            
            Y(pos_pass,1) = (Y(pos_pass,1)*Y(pos_susc,1))/((Y(pos_pass,1)+Y(pos_susc,1)));
            Y(pos_susc,:)= [];
            aux_c_1 = 0;
            aux_c_2 = 0;
            if(coordenadas(pos_pass,1) ~= act)
                
                aux_c_1 = coordenadas(pos_pass,1) ; 
                
            
            else

                aux_c_1 = coordenadas(pos_pass,2) ; 
                    
            end
            if(coordenadas(pos_susc,1) ~= act)
                
                aux_c_2 = coordenadas(pos_susc,1) ; 

            
            else

                aux_c_2 = coordenadas(pos_susc,2) ; 
                    
            end
            coordenadas(pos_pass,1) = aux_c_1;
            coordenadas(pos_pass,2) = aux_c_2;
            coordenadas(pos_susc,:) = [];
            [row_1,col_1] = find(c_aux == act);
            c_aux(row_1,:) = [];
            nt(row_1,:) = [];
            break;
        end 


            end  

    end    

   end
        
   

       
end    
    