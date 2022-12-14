clc;clear all;
% % carpeta de simulaciones de juan
% %carpeta='C:\Users\Cristian\Desktop\ejemplos_LTspice';
%carpeta de simulaciones de Cristian
carpeta='C:\Users\Cristian\Desktop\ejemplos_LTspice\ejemplo1a.net';
%netlist='ejemplo1a';
f=1000000

[Ym,Zm] = matrizYZ(f,carpeta);



