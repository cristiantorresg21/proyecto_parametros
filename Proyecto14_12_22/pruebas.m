clc;clear all;
% % carpeta de simulaciones de juan
carpeta='C:\Users\a9300\OneDrive\Desktop\spice';
netlist='ejemplo1';
%carpeta de simulaciones de Cristian
%carpeta='C:\Users\Cristian\Desktop\ejemplos_LTspice';
%netlist='ejemplo1a';



% f=logspace(1,2,200);
% 
% YM = [];
% ZM = [];
% ABCD = [];
% s = [];
% t=[];
% Zo = 50;
% for i = 1: size(f,2)
%     
%     [YM(:,:,i),ZM(:,:,i),np] = matrizYZ(f(1,i),carpeta,netlist);
%     if(np == 2)
%         
%         YM_inv = inv(YM(:,:,i));
% 
% carpeta='C:\Users\Cristian\Desktop\ejemplos_LTspice\ejemplo1a.net';
% %netlist='ejemplo1a';
% f=1000000
% 
% [Ym,Zm] = matrizYZ(f,carpeta);
% >>>>>>> 740feb9d250a52602bc6cf49f3d684cef6199702
% 
%         if(YM_inv(1,1) == Inf || YM_inv(1,2) == Inf || YM_inv(2,1) == Inf || YM_inv(2,2) == Inf  )
% 
%             ABCD(:,:,i) = Y_to_ABCD(YM(:,:,i));
%             s(:,:,i) =  Y_to_s(YM(:,:,i),Zo);
%             t(:,:,i)= to_t(s(:,:,i));
% 
%         else
%             
%             ABCD(:,:,i) = Z_to_ABCD(ZM(:,:,i));
%             s(:,:,i) =  Z_to_s_n(ZM(:,:,i),Zo);
%             t(:,:,i)= to_t(s(:,:,i));
%             
% 
%         end
%            
%     else    
% 
%         s(:,:,i) =  Z_to_s_n(ZM(:,:,i),Zo);
% 
%     end    
%     
% end    
% 
% s11 = [];
% s12 = [];
% s21 = [];
% s22 = [];
% for i = 1:size(s,3)
% 
%     s11(i,1)=  s(1,1,i);
%     s12(i,1) = s(1,2,i);
%     s21(i,1) = s(2,1,i);
%     s22(i,1) = s(2,2,i);
% 
% end
% 
% %rfwrite(s,f,'salida.s2p','FrequencyUnit','Hz','Parameter','S','Format','RI','ReferenceResistance',Zo);
% 
% frecuencia = f';
% T =  table(frecuencia,s11,s12,s21,s22);
% fig = uifigure;
% uit = uitable(fig,'Data',T);

