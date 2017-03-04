% The function calaculate Average intersection delay
%When:
%x= Vector of 3 paramters: x(1)- Green time for phase 1 , x(2)-Green time
%for pahse 2 , x(3) - Green timr for pahse 3 .
% lamda1L/T/R,lamda5/3/7- vechiles for hour in this way

function [average_delay,average_vehicle_delay,average_ped_delay,total_num_vehicle,total_num_discharge,total_delay_1_L_T_R,total_delay_3,total_delay_5,total_delay_7,num_vehicle_1_L_T_R_arrival,num_vehicle_3_arrival,num_vehicle_5_arrival,num_vehicle_7_arrival,num_vehicle_1_L_T_R_discharge,num_vehicle_3_discharge,num_vehicle_5_discharge,num_vehicle_7_discharge,arrival_vehicle_every_second_3,avg_cycle_1_L_T_R,avg_cycle_3,avg_cycle_5,avg_cycle_7] = ...
 average_total_intersection_delay_equal(time_simulation,x,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7)


% Data of pedestrian crossing 
% The data say 0.1 of pededstrian for second .

lamda = 0.1; % for d,e,f,g the pedestrian crossing 

% for a,b,c of the pedestrian crossing 
lamda_a = 0.1;
lamda_b = 0.1;
lamda_c = 0.1;

%x=phaseTime;

%time_simulation = 300; %The simlation run 3600 seconds -> 1 hour
total_intersection_delay = 0;
total_vehicle_delay = 0;
total_ped_delay = 0;
num_replications=100; % Num of repications to get good reasult of the simulation
total_delay_1_L_T_R=0; % Total dealy just in 1_l_r_t
total_delay_3=0; % Total delay in 3
total_delay_5=0; % Total delay in 5
total_delay_7=0; % Total delay in 7

num_vehicle_1_L_T_R_arrival=0; % Total arrival vechiles in 1
num_vehicle_3_arrival=0;% Total arrival vechiles in 3
num_vehicle_5_arrival=0;% Total arrival vechiles in 5
num_vehicle_7_arrival=0;% Total arrival vechiles in 7

total_num_vehicle=0; % Total vechils in junction


num_vehicle_1_L_T_R_discharge=0;% Total discharge vechiles in 1
num_vehicle_3_discharge=0;% Total discharge vechiles in 3
num_vehicle_5_discharge=0;% Total discharge vechiles in 5
num_vehicle_7_discharge=0;% Total discharge vechiles in 7

total_num_discharge=0;

avg_cycle_1_L_T_R=0;
avg_cycle_3=0;
avg_cycle_5=0;
avg_cycle_7=0;

% The simulation run 100 times to get good simtaltion result
for i = 1 : num_replications
   
    %give to funciton the traffic volum ( lamd..) and time for pahse and
    %the function discharge vechile from some way in junction
   [green_A_vector,green_C_vector,green_B_vector,AC_vector,CB_vector,BA_vector,discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged,detect_ped_d,detect_ped_e,detect_ped_f,detect_ped_g,arrival_vehicle_every_second_1L,arrival_vehicle_every_second_1T,arrival_vehicle_every_second_1R,arrival_vehicle_every_second_5,arrival_vehicle_every_second_3,arrival_vehicle_every_second_7] ...
   = main_program_pre_timed(time_simulation,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7,lamda,x(1),x(2),x(3)); 

    num_vehicle_1_L_T_R_arrival=num_vehicle_1_L_T_R_arrival+sum(arrival_vehicle_every_second_1L)+sum(arrival_vehicle_every_second_1T)+sum(arrival_vehicle_every_second_1R);
    num_vehicle_3_arrival=num_vehicle_3_arrival+sum(arrival_vehicle_every_second_3);
    num_vehicle_5_arrival=num_vehicle_5_arrival+sum(arrival_vehicle_every_second_5);
    num_vehicle_7_arrival=num_vehicle_7_arrival+sum(arrival_vehicle_every_second_7);

    num_vehicle_1_L_T_R_discharge=num_vehicle_1_L_T_R_discharge+sum(discharge_veh_1L)+sum(discharge_veh_1R)+sum(discharge_veh_1T);
    num_vehicle_3_discharge=num_vehicle_3_discharge+sum(discharge_veh_3);
    num_vehicle_5_discharge=num_vehicle_5_discharge+sum(discharge_veh_5);
    num_vehicle_7_discharge=num_vehicle_7_discharge+sum(discharge_veh_7);

   
   %the function calaculate dealay of vehicle 
    [avg_cycle_delay_1,avg_cycle_delay_3,avg_cycle_delay_5,arrival_time_veh_1L,arrival_time_veh_1T,arrival_time_veh_1R,arrival_time_veh_5,arrival_time_veh_3,arrival_time_veh_7,delay_veh_1L,delay_veh_1T,delay_veh_1R,delay_veh_5,delay_veh_3,delay_veh_7,average_delay_veh_1L,average_delay_veh_1T,average_delay_veh_1R,average_delay_veh_5,average_delay_veh_3,average_delay_veh_7] ...    
   = calculate_delay_vehicle(time_simulation,arrival_vehicle_every_second_1L,arrival_vehicle_every_second_1T,arrival_vehicle_every_second_1R,arrival_vehicle_every_second_5,arrival_vehicle_every_second_3,arrival_vehicle_every_second_7,discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged);
    
avg_cycle_1_L_T_R=avg_cycle_1_L_T_R+avg_cycle_delay_1;
avg_cycle_3=avg_cycle_3+avg_cycle_delay_3;
avg_cycle_5=avg_cycle_5+avg_cycle_delay_5;
%avg_cycle_7=avg_cycle_7+avg_cycle_delay_7;


   %the function calaculate dealay of pedestrians 
   [arrival_time_ped_d,arrival_time_ped_e,arrival_time_ped_f,arrival_time_ped_g,delay_ped_d,delay_ped_e,delay_ped_f,delay_ped_g,average_delay_ped_d,average_delay_ped_e,average_delay_ped_f,average_delay_ped_g,num_ped_d,num_ped_e,num_ped_f,num_ped_g]...
   = calculate_delay_pedestrians(time_simulation,green_B_vector,green_C_vector,CB_vector,detect_ped_d,detect_ped_e,detect_ped_f,detect_ped_g);

   %the function calaculate dealay of pedestrians calles a,b,c of the junction  
   [green_AC_vector,green_AB_vector,ped_red_AC,ped_red_AB,ped_green_AC,ped_green_AB,num_ped_green_a,num_ped_green_c,num_ped_green_b,num_ped_red_a,num_ped_red_c,num_ped_red_b,delay_ped_a,delay_ped_c,delay_ped_b,average_delay_ped_a,average_delay_ped_c,average_delay_ped_b]...
  = calculate_delay_ped_a_b_c_pre_timed(time_simulation,lamda_a,lamda_b,lamda_c,green_A_vector,green_B_vector,green_C_vector,AC_vector,BA_vector);
     
   %the function calaculate the total dealy of vehicles in the junction 
    total_vehicle_delay =   total_vehicle_delay ...
                            + ((average_delay_veh_1L * length(arrival_time_veh_1L))...
                            + (average_delay_veh_1T * length(arrival_time_veh_1T)) ... 
                            + (average_delay_veh_1R * length(arrival_time_veh_1R)) ...  
                            + (average_delay_veh_5 * length(arrival_time_veh_5)) ... 
                            + (average_delay_veh_3 * length(arrival_time_veh_3)) ... 
                            + (average_delay_veh_7 * length(arrival_time_veh_7))) ... 
                            /(length(arrival_time_veh_1L) + length(arrival_time_veh_1T) + length(arrival_time_veh_1R) + length(arrival_time_veh_5) +  length(arrival_time_veh_3) + length(arrival_time_veh_7));
    
   if(isnan(total_vehicle_delay))
       total_vehicle_delay=0;
   end
                 
     
    %the function calaculate the total dealy of pedestrians in the junction   
    total_ped_delay = total_ped_delay ... 
                    + ((average_delay_ped_d *num_ped_d + average_delay_ped_e *num_ped_e + average_delay_ped_f *num_ped_f +average_delay_ped_g *num_ped_g) + (average_delay_ped_a * (sum(num_ped_red_a)+num_ped_green_a)) + (average_delay_ped_b * (sum(num_ped_red_b)+num_ped_green_b)) + (average_delay_ped_c * (sum(num_ped_red_c)+num_ped_green_c))) ...
                     / (num_ped_d + num_ped_e + num_ped_f + num_ped_g + sum(num_ped_red_a)+num_ped_green_a + sum(num_ped_red_b)+num_ped_green_b + sum(num_ped_red_c)+num_ped_green_c);
    
  if(isnan(total_ped_delay))
       total_ped_delay=0;
   end
   %the function calaculate the dealy includes the vehicles  & pedestrians  
    total_intersection_delay =  total_intersection_delay+ ...
                                +( (average_delay_veh_1L * length(arrival_time_veh_1L)) ... 
                                +  (average_delay_veh_1T * length(arrival_time_veh_1T)) ... 
                                +  (average_delay_veh_1R * length(arrival_time_veh_1R)) ... 
                                +  (average_delay_veh_5 * length(arrival_time_veh_5)) ...
                                +  (average_delay_veh_3 * length(arrival_time_veh_3))...
                                +  (average_delay_veh_7 * length(arrival_time_veh_7))...
                                +  (average_delay_ped_d *num_ped_d)...
                                +  (average_delay_ped_e *num_ped_e) ...
                                +  (average_delay_ped_f *num_ped_f) ...
                                +  (average_delay_ped_g *num_ped_g) ...
                                +  (average_delay_ped_a * (sum(num_ped_red_a)+num_ped_green_a)) ...
                                +  (average_delay_ped_b * (sum(num_ped_red_b)+num_ped_green_b))...
                                +  (average_delay_ped_c * (sum(num_ped_red_c)+num_ped_green_c)) ) ...
                                / (length(arrival_time_veh_1L) ...
                                  + length(arrival_time_veh_1T) ...
                                  + length(arrival_time_veh_1R) ...
                                  + length(arrival_time_veh_5) ...
                                  + length(arrival_time_veh_3) ...
                                  + length(arrival_time_veh_7) ...
                                  + num_ped_d + num_ped_e + num_ped_f + num_ped_g ...
                                  + sum(num_ped_red_a)+num_ped_green_a + sum(num_ped_red_b)...
                                  +num_ped_green_b + sum(num_ped_red_c)+num_ped_green_c );  
                              
   if(isnan(total_intersection_delay))
       total_intersection_delay=0;
   end      
   
   
    total_delay_7=(total_delay_7)+((average_delay_veh_7*length(arrival_time_veh_7) +average_delay_ped_f*num_ped_f +average_delay_ped_g*num_ped_g)...
        /(num_ped_f+num_ped_g+ length(arrival_time_veh_7)));
    
    total_delay_5=(total_delay_5)+((average_delay_veh_5*length(arrival_time_veh_5) +average_delay_ped_e*num_ped_e +average_delay_ped_d*num_ped_d)...
        /(num_ped_d+num_ped_e+ length(arrival_time_veh_5)));
    
    total_delay_3=(total_delay_3)+(( average_delay_veh_3*length(arrival_time_veh_3)+ average_delay_ped_b * (sum(num_ped_red_b)+num_ped_green_b)...
                    +average_delay_ped_c * (sum(num_ped_red_c)+num_ped_green_c))...
                  /(sum(num_ped_red_b)+num_ped_green_b + sum(num_ped_red_c)+num_ped_green_c +length(arrival_time_veh_3)));
    
    d_1=average_delay_veh_1L * length(arrival_time_veh_1L) ... 
        +  average_delay_veh_1T * length(arrival_time_veh_1T) ... 
        +  average_delay_veh_1R * length(arrival_time_veh_1R)...
        +(average_delay_ped_a * (sum(num_ped_red_a)+num_ped_green_a));
                            
     d2=    length(arrival_time_veh_1L)  + length(arrival_time_veh_1T)+ length(arrival_time_veh_1R) ...
         +sum(num_ped_red_a)+num_ped_green_a;
             
     total_delay_1_L_T_R=total_delay_1_L_T_R+ (d_1/d2);
%    total_delay_1_L_T_R=(total_delay_1_L_T_R)+((average_delay_veh_1L * length(arrival_time_veh_1L))+(average_delay_veh_1T * length(arrival_time_veh_1T)) ...         
%                         + (average_delay_veh_1R * length(arrival_time_veh_1R)) ... 
%                         + (average_delay_ped_a * (sum(num_ped_red_a)+num_ped_green_a)) ...
%                         /(length(arrival_time_veh_1L)  + length(arrival_time_veh_1T)+ length(arrival_time_veh_1R) ...
%                           +sum(num_ped_red_a)+num_ped_green_a));  
                        
              
end


average_vehicle_delay = total_vehicle_delay/num_replications;
average_ped_delay = total_ped_delay/num_replications;
average_delay = total_intersection_delay/num_replications;

total_delay_7=total_delay_7/num_replications;
total_delay_3=total_delay_3/num_replications;
total_delay_5=total_delay_5/num_replications;
total_delay_1_L_T_R=total_delay_1_L_T_R/num_replications;

num_vehicle_1_L_T_R_arrival=num_vehicle_1_L_T_R_arrival/num_replications;
num_vehicle_3_arrival=num_vehicle_3_arrival/num_replications;
num_vehicle_5_arrival=num_vehicle_5_arrival/num_replications;
num_vehicle_7_arrival=num_vehicle_7_arrival/num_replications;

total_num_vehicle=num_vehicle_1_L_T_R_arrival+num_vehicle_3_arrival+num_vehicle_5_arrival+num_vehicle_7_arrival;



num_vehicle_1_L_T_R_discharge=num_vehicle_1_L_T_R_discharge/num_replications;
num_vehicle_3_discharge=num_vehicle_3_discharge/num_replications;
num_vehicle_5_discharge=num_vehicle_5_discharge/num_replications;
num_vehicle_7_discharge=num_vehicle_7_discharge/num_replications;

total_num_discharge=num_vehicle_1_L_T_R_discharge+num_vehicle_3_discharge+num_vehicle_5_discharge+num_vehicle_7_discharge;

avg_cycle_1_L_T_R=avg_cycle_1_L_T_R/num_replications;
avg_cycle_3=avg_cycle_3/num_replications;
avg_cycle_5=avg_cycle_5/num_replications;
avg_cycle_7=avg_cycle_7/num_replications;


% 
% disp('total avg delay:');
% disp(average_delay);

% 
% disp(' 7 - avg delay:');
% disp(total_delay_7);
% 
% disp(' 5 - avg delay:');
% disp(total_delay_5);
% 
% disp(' 3 - avg delay:');
% disp(total_delay_3);
% 
% disp(' 1 - avg delay:');
% disp(total_delay_1_L_T_R);



                