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

% Last Modified by GUIDE v2.5 14-Dec-2022 14:48:57

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
[netlist,path] = uigetfile({'*.net';'*.txt'});
if isequal(path,0)
    archivo=[''];
    handles.text_rutanetlist.String=archivo;
else 
    archivo=[path,netlist];
    handles.text_rutanetlist.String=archivo;
end

% --- Executes on button press in pb_btouchstone.
function pb_btouchstone_Callback(hObject, eventdata, handles)
[touchstone,ruta] = uigetfile({'*.net';'*.txt'});
if isequal(ruta,0)
    archivo=[''];
    handles.text_rutatouchstone.String=archivo;
else 
    archivo=[ruta,touchstone];
    handles.text_rutatouchstone.String=archivo;
end


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


% --- Executes on button press in carga_archivo.
function carga_archivo_Callback(hObject, eventdata, handles)
    global netlist;
    netlist =handles.text_rutanetlist.String
    global touchstone;
    touchstone =handles.text_rutatouchstone.String
end


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
inicio=handles.texte_irfreccuencia.String
fin=handles.texte_frfreccuencia.String
nfrec=handles.texte_itrfreccuencia.String
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
