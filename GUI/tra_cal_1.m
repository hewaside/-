function varargout = tra_cal_1(varargin)
% TRA_CAL_1 MATLAB code for tra_cal_1.fig
%      TRA_CAL_1, by itself, creates a new TRA_CAL_1 or raises the existing
%      singleton*.
%
%      H = TRA_CAL_1 returns the handle to a new TRA_CAL_1 or the handle to
%      the existing singleton*.
%
%      TRA_CAL_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRA_CAL_1.M with the given input arguments.
%
%      TRA_CAL_1('Property','Value',...) creates a new TRA_CAL_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tra_cal_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tra_cal_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tra_cal_1

% Last Modified by GUIDE v2.5 16-Apr-2024 15:26:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tra_cal_1_OpeningFcn, ...
                   'gui_OutputFcn',  @tra_cal_1_OutputFcn, ...
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




% --- Executes just before tra_cal_1 is made visible.
function tra_cal_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tra_cal_1 (see VARARGIN)

% Choose default command line output for tra_cal_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tra_cal_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tra_cal_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.popupmenu1,'value');
switch value
    % 计算正弦函数
    case 2
        textString = get(handles.edit1,'String');
        textint =str2double(textString);
        rad = textint * pi / 180;
        %fprintf("%2f",rad);
        if isempty(str2num(textString))
            textString1='输入的不是角度';
             set(handles.edit3,'String',textString1);
        % 计算正弦值
        else 
            sin_val = 0;
            for i = 0:100
              sign = (-1)^(i);
              fact = factorial(2*i+1);
              sin_val = sin_val + sign * rad^(2*i+1) / fact;
            end
            sin_val = round(sin_val * 100) / 100;
            sin_string = num2str(sin_val);
            textString1 = ['sin',textString,'=',sin_string];
            set(handles.edit3,'String',textString1);% 将计算结果写入文本框
        end
    % 计算反正弦函数
    case 3
         % 构建反正弦函数在x=0处的泰勒级数
       textString = get(handles.edit1,'String');
       textint =str2double(textString);
       n_terms = 50;
       unit = 100;
       if abs(textint)>1
          textString1='输入的值超出范围';
          set(handles.edit3,'String',textString1);  
       else 
          if textint ==1
             arcsin_val=pi/2;
          elseif  textint ==-1
             arcsin_val=-pi/2;
          else 
              arcsin_val = 0;
              x=textint;
              for i = 0:n_terms
              factorial_term1 = factorial(2*i);
              factorial_term2 = factorial(i);
              term = x^(2*i + 1) * factorial_term1 / (2*i+1) / ((factorial_term2)^2) /(4^i);
              arcsin_val = arcsin_val + term;
              end
              arcsin_val = round(arcsin_val * unit) / unit;
              arcsin_deg = arcsin_val * 180 / pi;
              Arcsin_deg_string =num2str(arcsin_deg);
          end
          textString1 = ['Arcsin',textString,'=',Arcsin_deg_string];
          set(handles.edit3,'String',textString1); % 将计算结果写入文本框
      end
        
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
% 获取下拉菜单的值
value = get(handles.popupmenu1,'value');
switch value
    case 1
        text_in = '请选择计算类型';
        type_cal = 1;
    case 2
        text_in = '请输入角度';
        text_act1 = '计算正弦值';
        text_act2 = '计算余弦值';
        type_cal = 2;
    case 3
        text_in = '请输入数值';
        text_act1 = '计算反正弦值';
        text_act2 = '计算反余弦值';
        type_cal = 3;
end
% 设置到静态文本框中
set(handles.text4,'String',text_in);
set(handles.pushbutton1,'String',text_act1);
set(handles.pushbutton3,'String',text_act2);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.popupmenu1,'value');
switch value
    case 2
       textString = get(handles.edit1,'String');
       textint =str2double(textString);
       if isempty(str2num(textString))
           textString1='输入的不是角度';
           set(handles.edit3,'String',textString1);
       else
           rad = textint * pi / 180;
           % fprintf("%2f",rad);
            % 计算正弦值
           cos_val = 0;
           for i = 0:100
             sign = (-1)^(i);
             fact = factorial(2*i);
             cos_val = cos_val + sign * rad^(2*i)/ fact;
           end
           cos_val = round(cos_val * 100) / 100;
           cos_string = num2str(cos_val);
           textString1 = ['cos',textString,'=',cos_string];
           set(handles.edit3,'String',textString1); % 将计算结果写入文本框
       end
    case 3
         % 构建反正弦函数在x=0处的泰勒级数
       textString = get(handles.edit1,'String');
       textint =str2double(textString);
       n_terms = 50;
       unit = 100;
       if abs(textint)>1
          textString1='输入的值超出范围';
          set(handles.edit3,'String',textString1);  
       else 
          if textint ==1
             arcsin_val=0;
          elseif  textint ==-1
             arcsin_val=pi;
          else 
              arcsin_val = 0;
              x=textint;
              for i = 0:n_terms
              factorial_term1 = factorial(2*i);
              factorial_term2 = factorial(i);
              term = x^(2*i + 1) * factorial_term1 / (2*i+1) / ((factorial_term2)^2) /(4^i);
              arcsin_val = arcsin_val + term;
              end
           end
           arcsin_val = round(arcsin_val * unit) / unit;
           arccos_val = pi/2 - arcsin_val;
           arccos_val = round(arccos_val * unit) / unit;
           arccos_deg = arccos_val * 180 / pi;
           Arccos_deg_string =num2str(arccos_deg);
           textString1 = ['Arccos',textString,'=',Arccos_deg_string];
           set(handles.edit3,'String',textString1); % 将计算结果写入文本框
      end
      
 end
