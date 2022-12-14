function varargout = interfaz(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz_OutputFcn, ...
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% End initialization code - DO NOT EDIT


% --- Executes just before interfaz is made visible.
function interfaz_OpeningFcn(hObject, eventdata, handles, varargin)


%% codigo que siempre se ejecuta
p=0
% Choose default command line output for interfaz
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes interfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in Cargarnetlis.
function Buscar_Callback(hObject, eventdata, handles)
[file,path] = uigetfile({'*.net';'*.txt'});
% if isequal(file,0)
%    disp('User selected Cancel');
% else
%    disp(['User selected ', fullfile(path,file)]);
% end

archivo=[path,file];
handles.Vistaubicacion.String=archivo;



function Vistaubicacion_Callback(hObject, eventdata, handles)

function Vistaubicacion_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


