function mainDynamic
format short g
  
%phaseTime[1]= Work first , green time for phase A ( lanes 3,7 )
%phaseTime[2]= Work third , green time for phase B ( lanes 1L,1T,1R )
%phaseTime[3]=Work second , green time for phase C ( lane 5 )

phaseTime=[20,20,20]; % Normal time 

total_phase_time=60; %total phaseTime
%Total time of cycle= 27 + 15 + 15 + 4 + 3 + 3 = = 70seconds

time_simulation=210;
num_of_cycles_for_hour=17.4;

t_3=0;
t_1=0;
t_7=0;
t_5=0;
t_all=0;



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


t_avg_delay=0;
t_arrival=0;
t_dis=0;


newProgram=[20,20,20]; % Program for traffic lights



for i=1 : round(num_of_cycles_for_hour)
    
    %initalize num of vehicles in the junction every 3.5 minutes 
    [lamda1L,lamda1R,lamda1T,lamda3,lamda5,lamda7]=...
       setLamdaValues(num_of_cycles_for_hour,num_vehicle_arrival_every_round(i,:));  
    
    
    fprintf('Iteration num %d \n \n',i);
    disp('  [3,7]    [1]     [5] ' );

   disp(newProgram);
    
        % Run the simulation with 'newProgram'
    [average_delay,average_vehicle_delay,average_ped_delay,total_num_vehicle,total_num_discharge,total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7,num_vehicle_1_L_T_R_arrival,num_vehicle_3_arrival,num_vehicle_5_arrival,num_vehicle_7_arrival,num_vehicle_1_L_T_R_discharge,num_vehicle_3_discharge,num_vehicle_5_discharge,num_vehicle_7_discharge,arrival_vehicle_every_second_3,avg_cycle_1_L_T_R,avg_cycle_3,avg_cycle_5,avg_cycle_7] ...
     =average_total_intersection_delay_equal(time_simulation,newProgram,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7);
 
 [sortArray,sortIndex]=sort([total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7]);

 t_avg_delay=t_avg_delay+average_delay;
     t_arrival=t_arrival+total_num_vehicle;
     t_dis=t_dis+total_num_discharge;
     
    
     max_3_7_dealy=max([total_delay_3,total_delay_7]);
     totalDealy=sum([total_delay_1_L_T_R,max_3_7_dealy,total_delay_5]);
     
         phase_3_7_new=round((max_3_7_dealy/totalDealy)*total_phase_time);
          phase_5_new=round((total_delay_5/totalDealy)*total_phase_time);
          phase_1_new=round((total_delay_1_L_T_R/totalDealy)*total_phase_time);
          
         [maxVal,maxIndex]=max([phase_3_7_new,phase_5_new,phase_1_new]);
         [minVal,minIndex]=min([phase_3_7_new,phase_5_new,phase_1_new]);

         
         total_phase=(phase_3_7_new)+(phase_5_new)+(phase_1_new);
         
         if total_phase>60
             disp('ih');
              if(maxIndex==0)
                 phase_3_7_new=phase_3_7_new+1;
             elseif(maxIndex==1)
                 phase_5_new=phase_5_new+1;
             else
                 phase_1_new=phase_1_new+1;
             end
         elseif total_phase<60
                          disp('ibbh');

             if(minIndex==0)
                 phase_3_7_new=phase_3_7_new-1;
             elseif(minIndex==1)
                 phase_5_new=phase_5_new-1;
             else
                 phase_1_new=phase_1_new-1;
             end
         end
         
        
         
  [newProgram]=[(phase_3_7_new),(phase_1_new),(phase_5_new)];
  
  
    fprintf('arrival to 3 : %.2f , discharged: %.2f , delay :  %.2f\n', num_vehicle_3_arrival,num_vehicle_3_discharge,total_delay_3);
    fprintf('arrival to 7 : %.2f , discharged: %.2f , delay :  %.2f\n', num_vehicle_7_arrival,num_vehicle_7_discharge,total_delay_7);
    fprintf('arrival to 5 : %.2f , discharged: %.2f , delay :  %.2f\n', num_vehicle_5_arrival,num_vehicle_5_discharge,total_delay_5);
    fprintf('arrival to 1 : %.2f , discharged: %.2f , delay :  %.2f\n', num_vehicle_1_L_T_R_arrival,num_vehicle_1_L_T_R_arrival,total_delay_1_L_T_R);
    fprintf('\n');  
    fprintf('-----------------------\n \n');  
    
        t_1=t_1+total_delay_1_L_T_R;

        t_3=t_3+total_delay_3;
        t_5=t_5+total_delay_5;
        t_7=t_7+total_delay_7;
        t_all=t_all+average_delay;

%          sprintf('llaa: %d',num_vehicle_3_arrival);
%          
% 
   %  disp(num_vehicle_3_discharge);
%          disp(total_delay_7);
%                  disp(total_delay_5);
       


     % Now check what is the biggest dealy in junction ....
     

   % disp(' 3 - num of arrival vehicle and num of dischare :');
    % how many vehciles come next 3 iteration junction ....
%    next_time_arrival_3=num_vehicle_3_arrival;
%    next_time_arrival_5=num_vehicle_5_arrival;
%    next_time_arrival_7=num_vehicle_7_arrival;
%    next_time_arrival_1=num_vehicle_1_L_T_R_arrival;
   
   
   % calc how many cars max could pass for 1 cycle and how many cycles need
   % to wait..
%       max_num_discharged_1_for_1_cycle=3*(phaseTime(3)/2);
%       next_time_arrival_1=avg_cycle_1_L_T_R*(max_num_discharged_1_for_1_cycle);
% 
%       
%      max_num_discharged_3_for_1_cycle=3*phaseTime(1); 
%      next_time_arrival_3=num_vehicle_3_arrival/3;
%      stt=next_time_arrival_3-num_vehicle_3_discharge/3; %stay!
%    
%       max_num_discharged_7_for_1_cycle=3*phaseTime(1); 
%      next_time_arrival_7=avg_cycle_7*(max_num_discharged_7_for_1_cycle); 
%    
%      
%      
%      
%        max_num_discharged_5_for_1_cycle=3*phaseTime(2); 
%      next_time_arrival_5=avg_cycle_5*(max_num_discharged_5_for_1_cycle); 
%    
%      
%          sprintf('delay : %f', total_delay_3)

    % [phaseTime]=calculate_new_phase_time(phaseTime,avg_cycle_1_L_T_R,avg_cycle_3,avg_cycle_7,avg_cycle_5,next_time_arrival_1,next_time_arrival_3,next_time_arrival_7,next_time_arrival_5);
       

     %Now Calculate time for every phase
     %Case 1- >
     
     
%      max_num_discharged_3_for_1_cycle=phaseTime(1)+5; % how many cars max could pass for 1 cycle
%    numCycleToWait=next_time_arrival_3/(max_num_discharged_3_for_1_cycle*3); %how many cycles take
%    
% 
%        disp(num_vehicle_3_arrival);
% 
%     disp(num_vehicle_3_discharge);
%     
    

   % total=total+num_vehicle_3_arrival;
 %   disp();
    
%     disp(' 1 - num of vehicle and avg delay:');
%     disp(total_delay_1_L_T_R);
%     disp(lamda1L);
%     disp(lamda1T);
%     disp(lamda1R);

     
end

fprintf('avg delay 1: %.2f \n',t_1/round(num_of_cycles_for_hour));
fprintf('avg delay 3: %.2f \n',t_3/round(num_of_cycles_for_hour));
fprintf('avg delay 5: %.2f \n',t_5/round(num_of_cycles_for_hour));
fprintf('avg delay 7: %.2f \n',t_7/round(num_of_cycles_for_hour));

fprintf('avg all : %.2f \n',t_all/round(num_of_cycles_for_hour));


fprintf('\nAverage dealy on junction in 1 hour : %.2f Seconds\n',t_avg_delay/round(num_of_cycles_for_hour));
fprintf('Total Arrival vehicles in 1 hour : %.0f\n',round(t_arrival));
fprintf('Total discharged vehicles in 1 hour : %.0f\n',round(t_dis));




end
