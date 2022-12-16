function varargout = pinterfaz(varargin)
% PINTERFAZ MATLAB code for pinterfaz.fig
%      PINTERFAZ, by itself, creates a new PINTERFAZ or raises the existing
%      singleton*.
%
%      H = PINTERFAZ returns the handle to a new PINTERFAZ or the handle to
%      the existing singleton*.
%
%      PINTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PINTERFAZ.M with the given input arguments.
%
%      PINTERFAZ('Property','Value',...) creates a new PINTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pinterfaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pinterfaz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pinterfaz

% Last Modified by GUIDE v2.5 14-Dec-2022 19:53:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pinterfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @pinterfaz_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before pinterfaz is made visible.
function pinterfaz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pinterfaz (see VARARGIN)

% Choose default command line output for pinterfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pinterfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pinterfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pb_bnetlist.
function pb_bnetlist_Callback(hObject, eventdata, handles)
global netlist;
[netlist,path] = uigetfile({'*.net';'*.txt'});
if isequal(path,0)
    archivo=[''];
    handles.text_rutanetlist.String=archivo;
else 
    archivo=[path,netlist];
    handles.text_rutanetlist.String=archivo;
end
netlist=handles.text_rutanetlist.String

% --- Executes on button press in pb_btouchstone.
function pb_btouchstone_Callback(hObject, eventdata, handles)
global Touch_params;
[touchstone,ruta] = uigetfile({'*.s2p';'*.s1p';'*.s3p'});
if isequal(ruta,0)
    archivo=[''];
    handles.text_rutatouchstone.String=archivo;
else 
    archivo=[ruta,touchstone];
    handles.text_rutatouchstone.String=archivo;
end
touchstone=handles.text_rutatouchstone.String
Touch_params= sparameters(touchstone);

% --- Executes on button press in rb_touchstone.
function rb_touchstone_Callback(hObject, eventdata, handles)
% hObject    handle to rb_touchstone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')==1
    set(handles.pb_btouchstone,'Enable','on')
    set(handles.pb_bnetlist,'Enable','off')
    set(handles.text_rutatouchstone,'Enable','on')
    set(handles.text_rutanetlist,'Enable','off')
    handles.text_rutanetlist.String='';
end   
% Hint: get(hObject,'Value') returns toggle state of rb_touchstone

% --- Executes on button press in rb_snetlist.
function rb_snetlist_Callback(hObject, eventdata, handles)
% hObject    handle to rb_snetlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_snetlist
if get(hObject,'Value')==1
    set(handles.pb_btouchstone,'Enable','off')
    set(handles.pb_bnetlist,'Enable','on')
    set(handles.text_rutatouchstone,'Enable','off')
    set(handles.text_rutanetlist,'Enable','on')
    handles.text_rutatouchstone.String='';
end  



function text_rutanetlist_Callback(hObject, eventdata, handles)
% hObject    handle to text_rutanetlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_rutanetlist as text
%        str2double(get(hObject,'String')) returns contents of text_rutanetlist as a double


% --- Executes during object creation, after setting all properties.
function text_rutanetlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_rutanetlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_rutatouchstone_Callback(hObject, eventdata, handles)
% hObject    handle to text_rutatouchstone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_rutatouchstone as text
%        str2double(get(hObject,'String')) returns contents of text_rutatouchstone as a double


% --- Executes during object creation, after setting all properties.
function text_rutatouchstone_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_rutatouchstone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function texte_ufrecuencia_Callback(hObject, eventdata, handles)
% hObject    handle to texte_ufrecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of texte_ufrecuencia as text
%        str2double(get(hObject,'String')) returns contents of texte_ufrecuencia as a double


% --- Executes during object creation, after setting all properties.
function texte_ufrecuencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texte_ufrecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function texte_irfreccuencia_Callback(hObject, eventdata, handles)
% hObject    handle to texte_irfreccuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of texte_irfreccuencia as text
%        str2double(get(hObject,'String')) returns contents of texte_irfreccuencia as a double


% --- Executes during object creation, after setting all properties.
function texte_irfreccuencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texte_irfreccuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function texte_itrfreccuencia_Callback(hObject, eventdata, handles)
% hObject    handle to texte_itrfreccuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of texte_itrfreccuencia as text
%        str2double(get(hObject,'String')) returns contents of texte_itrfreccuencia as a double


% --- Executes during object creation, after setting all properties.
function texte_itrfreccuencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texte_itrfreccuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function texte_frfreccuencia_Callback(hObject, eventdata, handles)
% hObject    handle to texte_frfreccuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of texte_frfreccuencia as text
%        str2double(get(hObject,'String')) returns contents of texte_frfreccuencia as a double


% --- Executes during object creation, after setting all properties.
function texte_frfreccuencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texte_frfreccuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rb_ufrecuencia.
function rb_ufrecuencia_Callback(hObject, eventdata, handles)
if get(hObject,'Value')==1
    set(handles.texte_irfreccuencia,'Enable','off')
    set(handles.texte_itrfreccuencia,'Enable','off')
    set(handles.texte_frfreccuencia,'Enable','off')
    set(handles.texte_ufrecuencia,'Enable','on')
end  

% --- Executes on button press in rb_rfrecuencia.
function rb_rfrecuencia_Callback(hObject, eventdata, handles)
if get(hObject,'Value')==1
    set(handles.texte_irfreccuencia,'Enable','on')
    set(handles.texte_itrfreccuencia,'Enable','on')
    set(handles.texte_frfreccuencia,'Enable','on')
    set(handles.texte_ufrecuencia,'Enable','off')
end  

global netlist;
global touchstone;
netlist=handles.text_rutanetlist.String
touchstone=handles.text_rutatouchstone.String


% --- Executes on button press in carga_archivo.
function carga_archivo_Callback(hObject, eventdata, handles)

% hObject    handle to carga_archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function tx_cargar_archivo_Callback(hObject, eventdata, handles)
% hObject    handle to tx_cargar_archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_cargar_archivo as text
%        str2double(get(hObject,'String')) returns contents of tx_cargar_archivo as a double


% --- Executes during object creation, after setting all properties.
function tx_cargar_archivo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_cargar_archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_cargarFrec.
function pb_cargarFrec_Callback(hObject, eventdata, handles)
inicio=str2num(handles.texte_irfreccuencia.String)
fin=str2num(handles.texte_frfreccuencia.String)
nfrec=str2num(handles.texte_itrfreccuencia.String)
global freq;
freq = logspace(log10(inicio),log10(fin),nfrec);

% hObject    handle to pb_cargarFrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function tx_cargarfrec_Callback(hObject, eventdata, handles)
% hObject    handle to tx_cargarfrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_cargarfrec as text
%        str2double(get(hObject,'String')) returns contents of tx_cargarfrec as a double


% --- Executes during object creation, after setting all properties.
function tx_cargarfrec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_cargarfrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Z_button.
function Z_button_Callback(hObject, eventdata, handles)
% hObject    handle to Z_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global freq;
    global Zm;
    frecuencia = freq';
    
    for i = 1:size(Zm,3)
    
        z11(i,1) = Zm(1,1,i);
        z12(i,1) = Zm(1,2,i);
        z21(i,1) = Zm(2,1,i);
        z22(i,1) = Zm(2,2,i);

    end    
    t=table(frecuencia,z11,z12,z21,z22);
    figz = uifigure;
    uit = uitable(figz,'Data',t);

% --- Executes on button press in y_button.
function y_button_Callback(hObject, eventdata, handles)
% hObject    handle to y_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global freq;
    global Ym;
    frecuencia = freq';
    
    for i = 1:size(Ym,3)
    
        y11(i,1) = Ym(1,1,i);
        y12(i,1) = Ym(1,2,i);
        y21(i,1) = Ym(2,1,i);
        y22(i,1) = Ym(2,2,i);

    end    
    t=table(frecuencia,y11,y12,y21,y22);
    figz = uifigure;
    uit = uitable(figz,'Data',t);

% --- Executes on button press in ABCD_button.
function ABCD_button_Callback(hObject, eventdata, handles)
% hObject    handle to ABCD_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global freq;
    global ABCD;
    frecuencia = freq';
    
    for i = 1:size(ABCD,3)
    
        A(i,1) = ABCD(1,1,i);
        B(i,1) = ABCD(1,2,i);
        C(i,1) = ABCD(2,1,i);
        D(i,1) = ABCD(2,2,i);

    end    
    t=table(frecuencia,A,B,C,D);
    figz = uifigure;
    uit = uitable(figz,'Data',t);

% --- Executes on button press in s_button.
function s_button_Callback(hObject, eventdata, handles)
% hObject    handle to s_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global freq;
    global s;
    frecuencia = freq';
    
    for i = 1:size(s,3)
    
        s11(i,1) = s(1,1,i);
        s12(i,1) = s(1,2,i);
        s21(i,1) = s(2,1,i);
        s22(i,1) = s(2,2,i);

    end    
    t=table(frecuencia,s11,s12,s21,s22);
    figz = uifigure;
    uit = uitable(figz,'Data',t);

% --- Executes on button press in T_button.
function T_button_Callback(hObject, eventdata, handles)
% hObject    handle to T_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global freq;
    global T;
    frecuencia = freq';
    
    for i = 1:size(T,3)
    
        t11(i,1) = T(1,1,i);
        t12(i,1) = T(1,2,i);
        t21(i,1) = T(2,1,i);
        t22(i,1) = T(2,2,i);

    end    
    t=table(frecuencia,t11,t12,t21,t22);
    figz = uifigure;
    uit = uitable(figz,'Data',t);



% --- Executes on button press in sim_start.
function sim_start_Callback(hObject, eventdata, handles)
    global freq;
    global netlist;
    global Ym;
    global Zm;
    global np;
    global s;    
    global ABCD;
    global T;
    global Zo;
    global Parameters;
    global type_p;
    type_p = 'Z';
    Zo = 50;
    Ym = [];
    Zm = [];
    np = [];
    s = [];
    ABCD = [];
    T= [];
    %freq = 1000;
    %netlist = 'C:\Users\a9300\OneDrive\Desktop\spice\ejemplo1.net';
    for i = 1: size(freq,2)
    
        [Ym(:,:,i),Zm(:,:,i),np,exist] = matrizYZ(freq(1,i),netlist);
        if(np == 2)

            if(exist)

                ABCD(:,:,i)= Z_to_ABCD(Zm(:,:,i));
                s(:,:,i) = Z_to_s_n(Zm(:,:,i),Zo);
                T(:,:,i) = to_t(s(:,:,i));

            else
                
                ABCD(:,:,i)= Y_to_ABCD(Ym(:,:,i));
                s(:,:,i) = Y_to_s(Ym(:,:,i),Zo);
                T(:,:,i) = to_t(s(:,:,i));


            end    
        else
            
            s(:,:,i) = Z_to_s_n(Zm(:,:,i),Zo);

        end 
    end    
   
 Parameters = sparameters(Zm,freq);

% hObject    handle to sim_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Cargar.
function Cargar_Callback(hObject, eventdata, handles)

% hObject    handle to Cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar_touch.
function cargar_touch_Callback(hObject, eventdata, handles)

% hObject    handle to cargar_touch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Z_select.
function Z_select_Callback(hObject, eventdata, handles)
global Parameters;
global freq;
global Zm;
global type_p;
type_p = 'Z';
if get(hObject,'Value')==1
    Parameters = zparameters(Zm,freq);
end 

% hObject    handle to Z_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Z_select


% --- Executes on button press in Y_select.
function Y_select_Callback(hObject, eventdata, handles)
global Parameters;
global freq;
global Ym;
global type_p;
type_p = 'Y';
if get(hObject,'Value')==1
    Parameters = yparameters(Ym,freq);
end 

% hObject    handle to Y_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Y_select


% --- Executes on button press in ABCD_select.
function ABCD_select_Callback(hObject, eventdata, handles)
global Parameters;
global freq;
global ABCD;
global type_p;
type_p = 'ABCD';
if get(hObject,'Value')==1
    Parameters = abcdparameters(ABCD,freq);
end 
% hObject    handle to ABCD_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ABCD_select


% --- Executes on button press in s_select.
function s_select_Callback(hObject, eventdata, handles)
global Parameters;
global freq;
global s;
global Zo;
global type_p;
type_p = 's';
if get(hObject,'Value')==1
    Parameters = sparameters(s,freq,Zo);
end 
% hObject    handle to s_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of s_select


% --- Executes on button press in T_select.
function T_select_Callback(hObject, eventdata, handles)
global Parameters;
global freq;
global T;
global Zo;
global type_p;
type_p = 'T';
if get(hObject,'Value')==1
    Parameters = sparameters(T,freq,Zo);
end 
% hObject    handle to T_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of T_select


% --- Executes on button press in Mag_b.
function Mag_b_Callback(hObject, eventdata, handles)
    global Parameters;
    global type_p;
    plot_touchstone_magn(Parameters,type_p);
% hObject    handle to Mag_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dB_but.
function dB_but_Callback(hObject, eventdata, handles)
    global Parameters;
    global type_p;
    plot_touchstone_db(Parameters,type_p);
% hObject    handle to dB_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in angle_but.
function angle_but_Callback(hObject, eventdata, handles)
    global Parameters;
    global type_p;
    plot_touchstone_angle(Parameters,type_p);
% hObject    handle to angle_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in real_but.
function real_but_Callback(hObject, eventdata, handles)
    global Parameters;
    global type_p;
    plot_touchstone_real(Parameters ,type_p);
   
% hObject    handle to real_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in imag_but.
function imag_but_Callback(hObject, eventdata, handles)
    global Parameters;
    global type_p;
    plot_touchstone_imag(Parameters,type_p);
% hObject    handle to imag_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Polar_but.
function Polar_but_Callback(hObject, eventdata, handles)

    global Parameters;
    global type_p;
    plot_touchstone_polar(Parameters,type_p);
% hObject    handle to Polar_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in smith_but.
function smith_but_Callback(hObject, eventdata, handles)
    global Parameters;
    global type_p;
    plot_touchstone_smith(Parameters,type_p);
% hObject    handle to smith_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
    global Parameters;
    global Touch_params;
    global type_p;
    Parameters = Touch_params;
    type_p = 's';
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ruta_touch.
function ruta_touch_Callback(hObject, eventdata, handles)

global Parameters;
global type_p;
name=handles.save_name.String;
path = uigetdir();
if isequal(path,0)
     i = 1;
else 
    rfwrite(Parameters,strcat(path,'\',name,'.s2p'),"FrequencyUnit","Hz","Format","RI");
    
end



% hObject    handle to ruta_touch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function save_name_Callback(hObject, eventdata, handles)
% hObject    handle to save_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of save_name as text
%        str2double(get(hObject,'String')) returns contents of save_name as a double


% --- Executes during object creation, after setting all properties.
function save_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to save_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
