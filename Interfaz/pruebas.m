clc;clear all;
% 
% [file,path] = uigetfile({'*.m';'*.txt';'*.mat'});
% if isequal(file,0)
%    disp('User selected Cancel');
% else
%    disp(['User selected ', fullfile(path,file)]);
% end
% 
% archivo=[path,file]

S11=0.370-i*0.829
angle(S11)
F=rad2deg(angle(S11))