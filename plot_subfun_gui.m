function varargout = plot_subfun_gui(varargin)
% PLOT_SUBFUN_GUI MATLAB code for plot_subfun_gui.fig
%      PLOT_SUBFUN_GUI, by itself, creates a new PLOT_SUBFUN_GUI or raises the existing
%      singleton*.
%
%      H = PLOT_SUBFUN_GUI returns the handle to a new PLOT_SUBFUN_GUI or the handle to
%      the existing singleton*.
%
%      PLOT_SUBFUN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOT_SUBFUN_GUI.M with the given input arguments.
%
%      PLOT_SUBFUN_GUI('Property','Value',...) creates a new PLOT_SUBFUN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plot_subfun_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plot_subfun_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plot_subfun_gui

% Last Modified by GUIDE v2.5 19-May-2015 20:55:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plot_subfun_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @plot_subfun_gui_OutputFcn, ...
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


% --- Executes just before plot_subfun_gui is made visible.
function plot_subfun_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plot_subfun_gui (see VARARGIN)

% Choose default command line output for plot_subfun_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plot_subfun_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plot_subfun_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inFunName_Callback(hObject, eventdata, handles)
% hObject    handle to inFunName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
handles.funname = str;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inFunName as text
%        str2double(get(hObject,'String')) returns contents of inFunName as a double


% --- Executes during object creation, after setting all properties.
function inFunName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inFunName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnPlot.
function btnPlot_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.plotopt.unhide
    data = plot_subfun(handles.funname);
else
    data = plot_subfun(handles.funname, '-unhide');
end
if isempty(data.external)
   warndlg('There are no subroutines to show','Output') 
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over btnPlot.
function btnPlot_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to btnPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in unhide.
function unhide_Callback(hObject, eventdata, handles)
% hObject    handle to unhide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.plotopt.unhide = get(hObject,'Value');
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of unhide


% --- Executes during object creation, after setting all properties.
function unhide_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unhide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.plotopt.unhide = get(hObject,'Value');
guidata(hObject,handles);