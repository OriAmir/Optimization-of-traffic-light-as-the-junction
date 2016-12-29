function MainStatic

format short g
  
%program[1]= Work first , green time for phase A ( lanes 3,7 )
%program[2]= Work third , green time for phase B ( lanes 1L,1T,1R )
%program[3]=Work second , green time for phase C ( lane 5 )

%Total phase time = 60 seconds .

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
round5=[5,5,0,70,20,30];
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

for i=1 : round(num_of_cycles_for_hour)
       
    fprintf('Program choose for round %.0f is: \n Lanes 3,7 - %.0f Seconds \n Lane   1  - %.0f Seconds \n Lane   5  - %.0f Seconds \n \n',i,newProgram(1),newProgram(2),newProgram(3));

    %initalize num of vehicles in the junction every 3.5 minutes 
    [lamda1L,lamda1R,lamda1T,lamda3,lamda5,lamda7]=...
       setLamdaValues(num_of_cycles_for_hour,num_vehicle_arrival_every_round(i,:));  
    
    % Run the simulation with 'newProgram'
    [average_delay,average_vehicle_delay,average_ped_delay,total_num_vehicle,total_num_discharge,total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7,num_vehicle_1_L_T_R_arrival,num_vehicle_3_arrival,num_vehicle_5_arrival,num_vehicle_7_arrival,num_vehicle_1_L_T_R_discharge,num_vehicle_3_discharge,num_vehicle_5_discharge,num_vehicle_7_discharge,arrival_vehicle_every_second_3,avg_cycle_1_L_T_R,avg_cycle_3,avg_cycle_5,avg_cycle_7] ...
     =average_total_intersection_delay_equal(time_simulation,newProgram,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);
 
     t_avg_delay=t_avg_delay+average_delay;
     t_arrival=t_arrival+total_num_vehicle;
     t_dis=t_dis+total_num_discharge;
     
     %run in parllar all the programs on the current sitatuion on junction
     parfor j = 1 : 10  
          [all_delays(j),average_vehicle_delay,average_ped_delay,total_num_vehicle,total_num_discharge,total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7,num_vehicle_1_L_T_R_arrival,num_vehicle_3_arrival,num_vehicle_5_arrival,num_vehicle_7_arrival,num_vehicle_1_L_T_R_discharge,num_vehicle_3_discharge,num_vehicle_5_discharge,num_vehicle_7_discharge,arrival_vehicle_every_second_3,avg_cycle_1_L_T_R,avg_cycle_3,avg_cycle_5,avg_cycle_7] ...
           =average_total_intersection_delay_equal(time_simulation,allPrograms(j,:),lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);
     end
           
      %Take the program that give the min avg delay in junction   
     [minVal,minIndex]=min(all_delays);
      newProgram=allPrograms(minIndex,:);
           
end

fprintf('\nAverage dealy on junction in 1 hour : %.2f Seconds\n',t_avg_delay/round(num_of_cycles_for_hour));
fprintf('Total Arrival vehicles in 1 hour : %.0f\n',round(t_arrival));
fprintf('Total discharged vehicles in 1 hour : %.0f\n',round(t_dis));


end