function varargout = gui1(varargin)
% GUI1 MATLAB code for gui1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%
%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui1

% Last Modified by GUIDE v2.5 04-Mar-2017 15:59:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui1_OutputFcn, ...
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


% --- Executes just before gui1 is made visible.
function gui1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui1 (see VARARGIN)

% Choose default command line output for gui1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

axes(handles.axes1)
matlabImage = imread('junc-final.png');

imshow(matlabImage)

 axis on


% --- Outputs from this function are returned to the command line.
function varargout = gui1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_start_dinamic_sim.
function button_start_dinamic_sim_Callback(hObject, eventdata, handles)
% hObject    handle to button_start_dinamic_sim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
  
% textLabel = sprintf('Variable C = %f', 'cccc');
%   for i=1:5
%       set(handles.text_arrival_7, 'String', i);
% 
%        recArrival=rectangle('Position', [700, 300, 150, 5 ]);
%  recArrival.EdgeColor='r';
%   recArrival.FaceColor='r';
%   recArrival.LineWidth=4;
%       
%     pause(1);
%   delete(recArrival);
%       pause(1);
% 
% 
%   end
%   
% fprintf('HEY');
% 
% return;
%     x = get(handles.editText,'String'); %edit1 being Tag of ur edit box
%  if isempty(x)
%    fprintf('Error: Enter Text first\n');
%  end


% handles.rec=myRece;
% guidata(hObject,handles)

% recPass=rectangle('Position', [700, 320, 200, 5],...
% 	'EdgeColor','g', 'LineWidth', 1); 
%  recPass.EdgeColor='g';
%   recPass.LineWidth=5;
%     recPass.LineStyle=':';
% 
% 
% return;

%Diffrent options to the traffic light programs
program1=[20,20,20];
program2=[50,5,5];
program3=[5,50,5];
program4=[5,5,50];
program5=[40,10,10];
program6=[10,40,10];
program7=[10,10,40];
program8=[30,15,15];
program9=[15,30,15];
program10=[15,15,30];

allPrograms=[program1;program2;program3;program4;program5;program6;program7;program8;program9;program10];



time_simulation=210;

%Total time of cycle= 27 + 15 + 15 + 4 + 3 + 3 = 70seconds


%round[1]= num of vehicles from 1L lane
%round[2]= num of vehicles from 1T lane
%round[3]= num of vehicles from 1R lane
%round[4]= num of vehicles from 3 lanes
%round[5]= num of vehicles from 5 lanes
%round[6]= num of vehicles from 7 lanes

%num of vehicles from every way for 'time_simulation' seconds 
round1=[5,5,5,100,10,60];
round2=[0,5,0,140,10,120];
round3=[10,10,0,66,10,50];
round4=[5,5,5,100,15,100];
round5=[5,5,0,70,20,150];
round6=[10,10,10,20,70,25];
round7=[0,5,10,10,90,14];
round8=[5,5,10,20,75,8];
round9=[5,5,10,20,150,5];
round10=[5,5,15,25,175,22];
round11=[5,5,4,15,200,15];
round12=[5,5,20,30,60,28];
round13=[25,20,40,20,50,20];
round14=[25,20,50,10,30,10];
round15=[25,29,50,6,20,10];
round16=[20,20,20,14,15,15];
round17=[30,40,30,15,10,10];

num_vehicle_arrival_every_round=[round1;round2;round3;round4;round5;round6;round7;round8;round9;round10;round11;round12;round13;round14;round15;round16;round17];


num_of_cycles_for_hour=17.4; % 3600/210 = 17.4 --> cycles per hour 


t_avg_delay=0; %contain total delay
t_arrival=0;  %contain total arrivals vechiles
t_dis=0; %contain total discharged vechiles

%delete(gcp('nocreate'))

p = gcp('nocreate'); % If no pool, do not create new one.
if isempty(p)
    myCluster = parcluster('local'); 
    myCluster.NumWorkers = 10; % 'Modified' property now TRUE
    saveProfile(myCluster);   % 'local' profile now updated,
    parpool('local',10); %Create 10 works to run in parallel
end

newProgram=[20,20,20]; % Program for traffic lights

  recArrival=rectangle('Position', [700, 300, 0, 0 ]);
recPass=rectangle('Position', [700, 320, 0, 0]);
 recPassDefault=rectangle('Position', [700, 340, 0, 0]);


lastProg=newProgram;
for i=1 : 8
    program = sprintf('Program choose for round %.0f is: \n Lanes 3,7 - %.0f Seconds \n Lane   1  - %.0f Seconds \n Lane   5  - %.0f Seconds \n \n',i,newProgram(1),newProgram(2),newProgram(3));
  set(handles.text_details, 'String',program);

   if i>1
      if(isequal(newProgram,lastProg)~=1)
            for j=1:5

                recAttetion=rectangle('Position', [100, 100, 150, 5 ]);
                recAttetion.EdgeColor='y';
                recAttetion.FaceColor='y';
                recAttetion.LineWidth=4;
      
                pause(1);
                delete(recAttetion);
                pause(1);


            end
      end
       
       
   end
       
       % line([400 500], [500 50]);
        pause(5);
                delete(recArrival);
                delete(recPass);
                 delete(recPassDefault);

    fprintf('Program choose for round %.0f is: \n Lanes 3,7 - %.0f Seconds \n Lane   1  - %.0f Seconds \n Lane   5  - %.0f Seconds \n \n',i,newProgram(1),newProgram(2),newProgram(3));
   % fprintf('Program choose for round %.0f is: \n Lanes 3,7 - %.0f Seconds \n Lane   1  - %.0f Seconds \n Lane   5  - %.0f Seconds \n \n',i,newProgram(1),newProgram(2),newProgram(3));

%     %initalize num of vehicles in the junction every 3.5 minutes 
    [lamda1L,lamda1R,lamda1T,lamda3,lamda5,lamda7]=...
       setLamdaValues(num_of_cycles_for_hour,num_vehicle_arrival_every_round(i,:));  
    % Run the simulation with 'newProgram'
    [average_delay,average_vehicle_delay,average_ped_delay,total_num_vehicle,total_num_discharge,total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7,num_vehicle_1_L_T_R_arrival,num_vehicle_3_arrival,num_vehicle_5_arrival,num_vehicle_7_arrival,num_vehicle_1_L_T_R_discharge,num_vehicle_3_discharge,num_vehicle_5_discharge,num_vehicle_7_discharge,arrival_vehicle_every_second_3,avg_cycle_1_L_T_R,avg_cycle_3,avg_cycle_5,avg_cycle_7] ...
     =average_total_intersection_delay_equal(time_simulation,newProgram,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);
 
  recArrival=rectangle('Position', [700, 300, num_vehicle_7_arrival*2, 5 ]);
 recArrival.EdgeColor='r';
  recArrival.FaceColor='r';
  recArrival.LineWidth=4;

   %  'EdgeColor','r','FaceColor','r', 'LineWidth', 3);

recPass=rectangle('Position', [700, 320, num_vehicle_7_discharge*2, 5],...
	'EdgeColor','g', 'LineWidth', 1); 
 recPass.EdgeColor='g';
  recPass.FaceColor='g';
  recPass.LineWidth=5;

    arrival_7 = sprintf('Arrival: %d', round(num_vehicle_7_arrival));
  set(handles.text_arrival_7, 'String',arrival_7);
  
      discharge_7 = sprintf('Discharge: %d', round(num_vehicle_7_discharge));

    set(handles.text_discharge_7, 'String',discharge_7);

 
    
    newProgram=[20,20,20];
     [average_delay,average_vehicle_delay,average_ped_delay,total_num_vehicle,total_num_discharge,total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7,num_vehicle_1_L_T_R_arrival,num_vehicle_3_arrival,num_vehicle_5_arrival,num_vehicle_7_arrival,num_vehicle_1_L_T_R_discharge,num_vehicle_3_discharge,num_vehicle_5_discharge,num_vehicle_7_discharge,arrival_vehicle_every_second_3,avg_cycle_1_L_T_R,avg_cycle_3,avg_cycle_5,avg_cycle_7] ...
     =average_total_intersection_delay_equal(time_simulation,newProgram,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);
 recPassDefault=rectangle('Position', [700, 340, num_vehicle_7_discharge*2, 5],...
	'EdgeColor','w', 'LineWidth', 3); 
      

 recPassDefault.EdgeColor='w';
  recPassDefault.FaceColor='w';
  recPassDefault.LineWidth=5;
    
 
     fprintf('in round %.0f is: \n  to lane 7 arrivel - %.0f , dishcarge - %.0f  \n',i,num_vehicle_7_arrival,num_vehicle_7_discharge);



%      t_avg_delay=t_avg_delay+average_delay;
%      t_arrival=t_arrival+total_num_vehicle;
%      t_dis=t_dis+total_num_discharge;
%      
%      %run in parllar all the programs on the current sitatuion on junction
     parfor j = 1 : 10
          [all_delays(j),average_vehicle_delay,average_ped_delay,total_num_vehicle,total_num_discharge,total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7,num_vehicle_1_L_T_R_arrival,num_vehicle_3_arrival,num_vehicle_5_arrival,num_vehicle_7_arrival,num_vehicle_1_L_T_R_discharge,num_vehicle_3_discharge,num_vehicle_5_discharge,num_vehicle_7_discharge,arrival_vehicle_every_second_3,avg_cycle_1_L_T_R,avg_cycle_3,avg_cycle_5,avg_cycle_7] ...
           =average_total_intersection_delay_equal(time_simulation,allPrograms(j,:),lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);
     end
%            
      %Take the program that give the min avg delay in junction   
     [minVal,minIndex]=min(all_delays);
      newProgram=allPrograms(minIndex,:);
%            
end



% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)