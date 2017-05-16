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

% Last Modified by GUIDE v2.5 10-May-2017 20:09:05

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


%Set the junction image insixe the axes 1 and delete the axis
axes(handles.axes1)
matlabImage = imread('junc-final.png');
imshow(matlabImage)
axis off

%Delete the axis from axes 2 , axes 2 is for the program results
axes(handles.axes2)
axis off

axes(handles.axes1)

set(handles.check_box_static_sim,'value',1); 
set(handles.plan1button,'value',1); 



% --- Outputs from this function are returned to the command line.
function varargout = gui1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_start_sim.
function button_start_sim_Callback(hObject, eventdata, handles)
% hObject    handle to button_start_sim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%Take values of choosen simulation type 
selected_sim_static = get(handles.check_box_static_sim, 'Value');
selected_sim_dynamic = get(handles.check_box_dynamic_sim, 'Value');

if selected_sim_static==0 && selected_sim_dynamic==0
    msgbox('Invalid input , must select simulaiton type', 'Error','error');
    return;
end

%Take value of choosen plan and initalize by the choise
selected_plan = get(get(handles.button_group_select_plan,'SelectedObject'), 'Tag');
[num_vehicle_arrival_every_round]=set_values_for_arrival_vehicles(selected_plan);


%Take value of choosen plan and initalize by the choise

selected_time = get(get(handles.button_group_select_time,'SelectedObject'), 'Tag');
total_second_sim_time=3600;
if strcmp(selected_time, 'onehourbutton')
    num_of_cycles_for_hour=3600/210;
elseif strcmp(selected_time, 'halfhourbutton')
    num_of_cycles_for_hour=1800/210;
    total_second_sim_time=1800;
else
     num_of_cycles_for_hour=900/210;
     total_second_sim_time=900;
end







%Set the button of start sim disabled until the simulation end 
set(handles.button_start_sim,'enable','off');
set(handles.export_statics_button,'visible','off')


%set(handles.check_box_static_sim,'Enable','off');
% set(handles.check_box_dynamic_sim,'Enable','off');
% set(handles.check_box_dynamic_sim,'Enable','off');

% set(handles.plan1button,'Enable','off');
% 
% set(handles.plan2button,'Enable','off');
% set(handles.plan3button,'Enable','off');

total_phase_time=60; %total phaseTime


%Initalize the diffrent options to the traffic light programs
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


time_simulation=210; %Time that simulation run , 3.5 minutes
%Total time of cycle= 27 + 15 + 15 + 4 + 3 + 3 = 70seconds


%Initalize variables for statics system
[total_vechiles_arrival_all,total_vechiles_arrival_1,total_vechiles_arrival_3,total_vechiles_arrival_5,total_vechiles_arrival_7,total_new_avg_delay_all,total_new_avg_delay_1,total_new_avg_delay_3,total_new_avg_delay_5,total_new_avg_delay_7, ...
total_new_dis_all,total_new_dis_1,total_new_dis_3,total_new_dis_5,total_new_dis_7,total_old_avg_delay_all,total_old_avg_delay_1,total_old_avg_delay_3,total_old_avg_delay_5,total_old_avg_delay_7, ...
total_old_dis_all,total_old_dis_1,total_old_dis_3,total_old_dis_5,total_old_dis_7 ] = initialize_variables(); 


%First initalize of all the rectangles that represents how many vechiles arrivael/discharged in every round
rec_Arrival_1=rectangle('Position', [0, 0, 0, 0 ]);
rec_discharged_1=rectangle('Position', [0, 0, 0, 0]);
rec_discharged_old_1=rectangle('Position', [0, 0, 0, 0]);

rec_Arrival_3=rectangle('Position', [0, 0, 0, 0 ]);
rec_discharged_3=rectangle('Position', [0, 0, 0, 0 ]);
rec_discharged_old_3=rectangle('Position', [0, 0, 0, 0 ]);

rec_Arrival_5=rectangle('Position', [0, 0, 0, 0 ]);
rec_discharged_5=rectangle('Position', [0, 0, 0, 0]);
rec_discharged_old_5=rectangle('Position', [0, 0, 0, 0]);

rec_Arrival_7=rectangle('Position', [0, 0, 0, 0 ]);
rec_discharged_7=rectangle('Position', [0, 0, 0, 0 ]);
rec_discharged_old_7=rectangle('Position', [0, 0, 0, 0 ]);

all_rec=[rec_Arrival_1;rec_discharged_1;rec_discharged_old_1;rec_Arrival_3;rec_discharged_3;rec_discharged_old_3;rec_Arrival_5;rec_discharged_5;rec_discharged_old_5;rec_Arrival_7;rec_discharged_7;rec_discharged_old_7];


%delete(gcp('nocreate'))

if selected_sim_static==1          %Create the threadpool for run program in parller
         p = gcp('nocreate'); % If no pool, do not create new one.
         if isempty(p)
             myCluster = parcluster('local');
             myCluster.NumWorkers = 10; % 'Modified' property now TRUE
             saveProfile(myCluster);   % 'local' profile now updated,
             parpool('local',10); %Create 10 works to run in parallel
         end
end



newProgram=[20,20,20]; % Default Program for traffic lights
lastProgram=newProgram; % Save the last program for check if there is change in any round

roundTime=0;
for i=1 : round(num_of_cycles_for_hour)
    roundTime=roundTime+3.5;

 
            roundString = sprintf('Round %.0f , %.1f min ',i,roundTime);     
%     else
%         roundString = sprintf('Round %.0f , %d:00 min ',i,round(roundTime));

   
          
    
        %Set num of current round in the GUI text

    set(handles.text_round_num, 'String',roundString);

    fprintf('Program choose for round %.0f is: \n Lanes 3,7 - %.0f Seconds \n Lane   1  - %.0f Seconds \n Lane   5  - %.0f Seconds \n \n',i,newProgram(1),newProgram(2),newProgram(3));

    %Set program choosen in the GUI text
    program = sprintf('Lanes 3,7 - %.0f Seconds \n\nLane 1  - %.0f Seconds \n\nLane 5 - %.0f Seconds',newProgram(1),newProgram(2),newProgram(3));
    set(handles.text_program, 'String',program);

    %Delete all current rectangles from screen before repaint them
    for t=1 : size(all_rec)
       delete(all_rec(t));
    end


   %Initalize num of vehicles in the junction every 3.5 minutes by the num_vehicle_arrival_every_round array 
   [lamda1L,lamda1R,lamda1T,lamda3,lamda5,lamda7]=setLamdaValues(num_of_cycles_for_hour,total_second_sim_time,num_vehicle_arrival_every_round(i,:)); 


   %Run the simulation with 'newProgram' - the program that give the min avg dealty in junction
   [average_delay_new,average_vehicle_delay_new,average_ped_delay_new,total_num_vehicle_new,total_num_discharge_new,total_delay_1_L_T_R_new,total_delay_3_new,total_delay_5_new,total_delay_7_new,num_vehicle_1_L_T_R_arrival_new,num_vehicle_3_arrival_new,num_vehicle_5_arrival_new,num_vehicle_7_arrival_new,num_vehicle_1_L_T_R_discharge_new,num_vehicle_3_discharge_new,num_vehicle_5_discharge_new,num_vehicle_7_discharge_new,total_num_ped_discharge,num_ped_1_L_T_R_arrival,num_ped_1_L_T_R_discharge,num_ped_3_arrival,num_ped_3_discharge,num_ped_5_arrival,num_ped_5_discharge,num_ped_7_arrival,num_ped_7_discharge] ...
   =average_total_intersection_delay_equal(time_simulation,newProgram,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);

    
    %Draw the rectangles for every lane , this rectangles represents how
    %many cars arrival and how many cars discharged in the last 3.5 minutes
    %Red rectangle - how many cars arrivel to lane in the last 3.5 minutes
    %Green recatngle - how many cars discharged with the current program
    %Blue rectangle - how many cars need to be discharged with default program
    %
    
    [rec_Arrival_1]=drawRec(handles.axes1,570,592,num_vehicle_1_L_T_R_arrival_new,'r','h');
    [rec_discharged_1]=drawRec(handles.axes1,542,592,num_vehicle_1_L_T_R_discharge_new,'g','h');

    [rec_Arrival_3]=drawRec(handles.axes1,269-num_vehicle_3_arrival_new*2,495,num_vehicle_3_arrival_new,'r','w');    
    [rec_discharged_3]=drawRec(handles.axes1,269-num_vehicle_3_discharge_new*2,471,num_vehicle_3_discharge_new,'g','w');
      
    [rec_Arrival_5]=drawRec(handles.axes1,403,219-num_vehicle_5_arrival_new*2,num_vehicle_5_arrival_new,'r','h');
    [rec_discharged_5]=drawRec(handles.axes1,425,219-num_vehicle_5_discharge_new*2,num_vehicle_5_discharge_new,'g','h');

    [rec_Arrival_7]=drawRec(handles.axes1,700,300,num_vehicle_7_arrival_new,'r','w');
    [rec_discharged_7]=drawRec(handles.axes1,700,323,num_vehicle_7_discharge_new,'g','w');

    all_rec=[rec_Arrival_1;rec_discharged_1;rec_discharged_old_1;rec_Arrival_3;rec_discharged_3;rec_discharged_old_3;rec_Arrival_5;rec_discharged_5;rec_discharged_old_5;rec_Arrival_7;rec_discharged_7;rec_discharged_old_7];

      
    %Update the values of arrivael/discharged vehicles in every lange in the text fields
    set(handles.text_arrival_1, 'String',sprintf('Arrival: %d', round(num_vehicle_1_L_T_R_arrival_new)));
    set(handles.text_discharge_1, 'String',sprintf('Discharge: %d', round(num_vehicle_1_L_T_R_discharge_new)));
    set(handles.text_arrival_3, 'String',sprintf('Arrival: %d', round(num_vehicle_3_arrival_new)));
    set(handles.text_discharge_3, 'String',sprintf('Discharge: %d', round(num_vehicle_3_discharge_new)));
    set(handles.text_arrival_5, 'String',sprintf('Arrival: %d', round(num_vehicle_5_arrival_new)));
    set(handles.text_discharge_5, 'String',sprintf('Discharge: %d', round(num_vehicle_5_discharge_new)));
    set(handles.text_arrival_7, 'String',sprintf('Arrival: %d', round(num_vehicle_7_arrival_new)));
    set(handles.text_discharge_7, 'String',sprintf('Discharge: %d', round(num_vehicle_7_discharge_new)));
    
    %Run again the simulation with the default program to check the diffrent between results
    defaultProgram=[20,20,20];
    [average_delay_old,average_vehicle_delay_old,average_ped_delay_old,total_num_vehicle_old,total_num_discharge_old,total_delay_1_L_T_R_old,total_delay_3_old,total_delay_5_old,total_delay_7_old,num_vehicle_1_L_T_R_arrival_old,num_vehicle_3_arrival_old,num_vehicle_5_arrival_old,num_vehicle_7_arrival_old,num_vehicle_1_L_T_R_discharge_old,num_vehicle_3_discharge_old,num_vehicle_5_discharge_old,num_vehicle_7_discharge_old,total_num_ped,total_num_ped_discharge,num_ped_1_L_T_R_arrival,num_ped_1_L_T_R_discharge,num_ped_3_arrival,num_ped_3_discharge,num_ped_5_arrival,num_ped_5_discharge,num_ped_7_arrival,num_ped_7_discharge] ...
     = average_total_intersection_delay_equal(time_simulation,defaultProgram,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);
 
     
     % Update how many cars need to be dischareg with deafult program and draw the rectangles
     set(handles.text_discharge_old_1, 'String',sprintf('Old Discharge: %d', round(num_vehicle_1_L_T_R_discharge_old)));
     [rec_discharged_old_1]=drawRec(handles.axes1,518,592,num_vehicle_1_L_T_R_discharge_old,'b','h');
     set(handles.text_discharge_old_3, 'String',sprintf('Old Discharge: %d', round(num_vehicle_3_discharge_old)));
     [rec_discharged_old_3]=drawRec(handles.axes1,269-num_vehicle_3_discharge_old*2,445,num_vehicle_3_discharge_old,'b','w');
     set(handles.text_discharge_old_5, 'String',sprintf('Old Discharge: %d', round(num_vehicle_5_discharge_old)));
    [rec_discharged_old_5]=drawRec(handles.axes1,453,219-num_vehicle_5_discharge_old*2,num_vehicle_5_discharge_old,'b','h');
     set(handles.text_discharge_old_7, 'String',sprintf('Old Discharge: %d', round(num_vehicle_7_discharge_old)));
    [rec_discharged_old_7]=drawRec(handles.axes1,700,347,num_vehicle_7_discharge_old,'b','w');
     
     pause(3); %The pause set that we could see the diffrens between the rounds

     
     
     
        
     if selected_sim_static==1
         %Run in parllar all the programs on the current sitatuion on junction
         parfor j = 1 : 10
             [all_delays(j),average_vehicle_delay,average_ped_delay,total_num_vehicle,total_num_discharge,total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7,num_vehicle_1_L_T_R_arrival,num_vehicle_3_arrival,num_vehicle_5_arrival,num_vehicle_7_arrival,num_vehicle_1_L_T_R_discharge,num_vehicle_3_discharge,num_vehicle_5_discharge,num_vehicle_7_discharge,total_num_ped,total_num_ped_discharge,num_ped_1_L_T_R_arrival,num_ped_1_L_T_R_discharge,num_ped_3_arrival,num_ped_3_discharge,num_ped_5_arrival,num_ped_5_discharge,num_ped_7_arrival,num_ped_7_discharge] ...
                 =average_total_intersection_delay_equal(time_simulation,allPrograms(j,:),lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);
         end
           %Take the program that give the min avg delay in junction   
           [minVal,minIndex]=min(all_delays);
           newProgram=allPrograms(minIndex,:);
     else
         
           max_3_7_dealy=max([total_delay_3_new,total_delay_7_new]);
           totalDealy=sum([total_delay_1_L_T_R_new,max_3_7_dealy,total_delay_5_new]);
     
          phase_3_7_new=round((max_3_7_dealy/totalDealy)*total_phase_time);
          phase_5_new=round((total_delay_5_new/totalDealy)*total_phase_time);
          phase_1_new=round((total_delay_1_L_T_R_new/totalDealy)*total_phase_time);
          
         [maxVal,maxIndex]=max([phase_3_7_new,phase_5_new,phase_1_new]);
         [minVal,minIndex]=min([phase_3_7_new,phase_5_new,phase_1_new]);
          newProgram=[(phase_3_7_new),(phase_1_new),(phase_5_new)];
         
     end
     
    
     
     %Check if the program is changed from the previous program 
     if(isequal(newProgram,lastProgram)~=1)
          %Draw in axes 2 yellow rectangle to mark that there is a changed between the program
        program = sprintf('Lanes 3,7 - %.0f Seconds \n\nLane 1  - %.0f Seconds \n\nLane 5 - %.0f Seconds',newProgram(1),newProgram(2),newProgram(3));
        set(handles.text_program, 'String',program);
        for j=1:6
           recProgramChanged=rectangle(handles.axes2,'Position', [0, 0, 2, 2],'EdgeColor','y', 'LineWidth', 3);
           pause(0.5);
           delete(recProgramChanged);
           pause(0.5);
        end
     end
     
     lastProgram=newProgram; %Update the last program to last one 

     
     %Create statics for the current round with all the available details 
     cur_round_statics = {    sprintf('---')                  sprintf('---')                             roundString                         sprintf('---')                      sprintf('---')                       sprintf('---') ;                    ...
                              'Lane '                          sprintf('1')                              sprintf('3')                        sprintf('5')                        sprintf( '7')                        'All';                              ...
                              'Total vehicle arrivel'          round(num_vehicle_1_L_T_R_arrival_new)    round(num_vehicle_3_arrival_new)    round(num_vehicle_5_arrival_new)    round(num_vehicle_7_arrival_new)     round(total_num_vehicle_new);       ...
                              'Total vehicle discharge-New'    round(num_vehicle_1_L_T_R_discharge_new)  round(num_vehicle_3_discharge_new)  round(num_vehicle_5_discharge_new)  round(num_vehicle_7_discharge_new)   round(total_num_discharge_new);     ...
                              'Total vehicle discharge-Old'    round(num_vehicle_1_L_T_R_discharge_old)  round(num_vehicle_3_discharge_old)  round(num_vehicle_5_discharge_old)  round(num_vehicle_7_discharge_old)   round(total_num_discharge_old);     ...
                              'Total pedestrian arrivel'       round(num_ped_1_L_T_R_arrival)            round(num_ped_3_arrival)            round(num_ped_5_arrival)            round(num_ped_7_arrival)             round(total_num_ped);               ...
                              'Total pedestrian discharge'     round(num_ped_1_L_T_R_discharge)          round(num_ped_3_discharge)          round(num_ped_5_discharge)          round(num_ped_7_discharge)           round(total_num_ped_discharge);     ...
                              'Average delay-New program'      (total_delay_1_L_T_R_new)                 (total_delay_3_new)                 (total_delay_5_new)                 (total_delay_7_new)                  (average_vehicle_delay_new);        ...
                              'Average delay-Old program'      (total_delay_1_L_T_R_old)                 (total_delay_3_old)                 (total_delay_5_old)                 (total_delay_7_old)                  (average_vehicle_delay_old)             }; 
                     
      if i==1
           finalStatics=cur_round_statics;
      else
          finalStatics=[finalStatics;cur_round_statics];
      end
      
      
      %Calculate total statics until now
      total_vechiles_arrival_all=total_vechiles_arrival_all+round(total_num_vehicle_new);  
      total_vechiles_arrival_1=total_vechiles_arrival_1+round(num_vehicle_1_L_T_R_arrival_new);  
      total_vechiles_arrival_3=total_vechiles_arrival_3+round(num_vehicle_3_arrival_new); 
      total_vechiles_arrival_5=total_vechiles_arrival_5+round(num_vehicle_5_arrival_new);
      total_vechiles_arrival_7=total_vechiles_arrival_7+ round(num_vehicle_7_arrival_new);  
      total_new_avg_delay_all=total_new_avg_delay_all+average_delay_new; 
      total_new_avg_delay_1=total_new_avg_delay_1+total_delay_1_L_T_R_new;
      total_new_avg_delay_3=total_new_avg_delay_3+total_delay_3_new;
      total_new_avg_delay_5=total_new_avg_delay_5+total_delay_5_new;
      total_new_avg_delay_7=total_new_avg_delay_7+total_delay_7_new;
      total_old_avg_delay_all=total_old_avg_delay_all+average_delay_old;
      total_old_avg_delay_1=total_old_avg_delay_1+total_delay_1_L_T_R_old;
      total_old_avg_delay_3=total_old_avg_delay_3+total_delay_3_old;
      total_old_avg_delay_5=total_old_avg_delay_5+total_delay_5_old;
      total_old_avg_delay_7=total_old_avg_delay_7+total_delay_7_old;
      total_new_dis_all=total_new_dis_all+round(total_num_discharge_new);
      total_new_dis_1=total_new_dis_1+round(num_vehicle_1_L_T_R_discharge_new); 
      total_new_dis_3=total_new_dis_3+round(num_vehicle_3_discharge_new); 
      total_new_dis_5=total_new_dis_5+round(num_vehicle_5_discharge_new);
      total_new_dis_7=total_new_dis_7+round(num_vehicle_7_discharge_new);
      total_old_dis_all=total_old_dis_all+round(total_num_discharge_old); 
      total_old_dis_1=total_old_dis_1+round(num_vehicle_1_L_T_R_discharge_old); 
      total_old_dis_3=total_old_dis_3+round(num_vehicle_3_discharge_old); 
      total_old_dis_5=total_old_dis_5+round(num_vehicle_5_discharge_old);
      total_old_dis_7=total_old_dis_7+round(num_vehicle_7_discharge_old);
      
end

%Calculate total average dealy on old and new program in all the rounds 
total_new_avg_delay_all=total_new_avg_delay_all/num_of_cycles_for_hour;
total_new_avg_delay_1=total_new_avg_delay_1/num_of_cycles_for_hour;
total_new_avg_delay_3=total_new_avg_delay_3/num_of_cycles_for_hour;
total_new_avg_delay_5=total_new_avg_delay_5/num_of_cycles_for_hour;
total_new_avg_delay_7=total_new_avg_delay_7/num_of_cycles_for_hour;
total_old_avg_delay_all=total_old_avg_delay_all/num_of_cycles_for_hour;
total_old_avg_delay_1=total_old_avg_delay_1/num_of_cycles_for_hour;
total_old_avg_delay_3=total_old_avg_delay_3/num_of_cycles_for_hour;
total_old_avg_delay_5=total_old_avg_delay_5/num_of_cycles_for_hour;
total_old_avg_delay_7=total_old_avg_delay_7/num_of_cycles_for_hour;


summry_statics = {    sprintf('---')                   sprintf('---')                            'Summry'                            sprintf('---')                        sprintf('---')                       sprintf('---') ;                     ...
                        'Lane '                          sprintf('1')                              sprintf('3')                        sprintf('5')                          sprintf( '7')                        'All';                               ...
                        'Total vehicle arrivel'          round(total_vechiles_arrival_1)           round(total_vechiles_arrival_3)     round(total_vechiles_arrival_5)       round(total_vechiles_arrival_7)      round(total_vechiles_arrival_all);   ...
                        'Total vehicle discharge-New'    round(total_new_dis_1)                    round(total_new_dis_3)              round(total_new_dis_5)                round(total_new_dis_7)               round(total_new_dis_all);            ...
                        'Total vehicle discharge-Old'    round(total_old_dis_1)                    round(total_old_dis_3)              round(total_old_dis_5)                round(total_old_dis_7)               round(total_old_dis_all);            ...
                        'Avg delay-New'                  (total_new_avg_delay_1)                   (total_new_avg_delay_3)             (total_new_avg_delay_5)               (total_new_avg_delay_7)              (total_new_avg_delay_all);           ...
                        'Avg delay-Old'                  (total_old_avg_delay_1)                   (total_old_avg_delay_3)             (total_old_avg_delay_5)               (total_old_avg_delay_7)              (total_old_avg_delay_all)            };                      
finalStatics=[finalStatics;summry_statics];


handles.statics =finalStatics;
guidata(hObject, handles);

%Set the 'export statics' button visible and the simulation button enabled
set(handles.export_statics_button,'visible','on')
set(handles.button_start_sim,'enable','on');
     

%Function draw recatnalge on the axes in xPos and yPos  the length of the rectangle is num_vehicle
%and flag represent if to draw the rectanlge horiziontal or vertical
function [rec]= drawRec(axes,xPos,yPos,num_vehicle,color,flag)
    if(flag=='h')
            cur_rec=rectangle(axes,'Position', [xPos, yPos, 5,num_vehicle*2 ]);
    else
       cur_rec=rectangle(axes,'Position', [xPos, yPos, num_vehicle*2, 5 ]);
    end
    cur_rec.EdgeColor=color;
    cur_rec.FaceColor=color;
    cur_rec.LineWidth=12;
    rec=cur_rec;

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


% --- Executes on button press in export_statics_button.
function export_statics_button_Callback(hObject, eventdata, handles)
% hObject    handle to export_statics_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

     %Get the cell from the handles object and convert it to table
    C = handles.statics(1:end,:);
    T = cell2table(C);

    %Open a dialog box to save the excel file with the statics to computer
   [FileNameBodeWrite, PathNameBodeWrite] = uiputfile({'*.xlsx';'*.csv'},'Save As...',['statics' '.xlsx']);
     if FileNameBodeWrite ~=0
        if exist([PathNameBodeWrite FileNameBodeWrite],'file')
            delete([PathNameLachWrite FileNameBodeWrite ]);
        end
        s = strcat(PathNameBodeWrite,'/',FileNameBodeWrite);

        writetable(T,s,'Range','A1', 'WriteVariableNames',false)
     end


% --- Executes on button press in check_box_static_sim.
function check_box_static_sim_Callback(hObject, eventdata, handles)
% hObject    handle to check_box_static_sim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.check_box_dynamic_sim,'value',0); 


% Hint: get(hObject,'Value') returns toggle state of check_box_static_sim


% --- Executes on button press in check_box_dynamic_sim.
function check_box_dynamic_sim_Callback(hObject, eventdata, handles)
% hObject    handle to check_box_dynamic_sim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.check_box_static_sim,'value',0); 

% Hint: get(hObject,'Value') returns toggle state of check_box_dynamic_sim
