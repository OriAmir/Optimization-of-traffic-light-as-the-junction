%This function get the time of the simulation and the vechile traffic from
%all the ways and return :
%green_X_vector_ - vector of the green time of every phase X
%discharge_veh_X - vector of how many vecheils discharge every second from  way  X in junction
%num_veh_X_discharged - total number of discharged vechiles from way X in the junction 
%detect_ped_x-
%arrival_vehicle_every_second_X -vector of how many vecheils arrival to the
%junction from way X

function [green_A_vector,green_C_vector,green_B_vector,AC_vector,CB_vector,BA_vector,discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged,detect_ped_d,detect_ped_e,detect_ped_f,detect_ped_g,arrival_vehicle_every_second_1L,arrival_vehicle_every_second_1T,arrival_vehicle_every_second_1R,arrival_vehicle_every_second_5,arrival_vehicle_every_second_3,arrival_vehicle_every_second_7] = ...
    main_program_pre_timed(time_simulation,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7,lamda,t_A,t_B,t_C)

% need to check for what is this
min_gap = 0; 

%initalize the vehicles by the data
[arrival_vehicle_every_second_1L,arrival_vehicle_until_second_1L,arrival_vehicle_every_second_1T,arrival_vehicle_until_second_1T,arrival_vehicle_every_second_1R,arrival_vehicle_until_second_1R,arrival_vehicle_every_second_5,arrival_vehicle_until_second_5,arrival_vehicle_every_second_3,arrival_vehicle_until_second_3,arrival_vehicle_every_second_7,arrival_vehicle_until_second_7] = ...
    draw_private_vehicles(time_simulation,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7,min_gap);


%initalize the pedestrians by the data
[detect_ped_d,detect_ped_e,detect_ped_f,detect_ped_g] = draw_pedestrians(lamda,time_simulation);


%The time of the red before forward to another pahse
int_AC = 4;
int_CB = 3;
int_BA = 3;



t=0; % current time in the simulation

%initalize of variables for using in the program
[current_A,current_C,current_B,current_int_AC,current_int_CB,current_int_BA,green_A_vector,green_C_vector,green_B_vector,A_active,B_active,C_active,interstage_AC_active,interstage_CB_active,interstage_BA_active,discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged,AC_vector,CB_vector,BA_vector] = ...
first_secend_actions(time_simulation);


%Run every second of the simulation
for i = 1 : time_simulation 

    t = t + 1;
    [discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged] = ...
     discharge_vehicle(t,arrival_vehicle_until_second_1L,arrival_vehicle_until_second_1T,arrival_vehicle_until_second_1R,arrival_vehicle_until_second_5,arrival_vehicle_until_second_3,arrival_vehicle_until_second_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged,A_active,B_active,C_active,discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7);
    
    %Update the vectors of time of green for every phase 
    if A_active == 1
            [A_active,current_A,interstage_AC_active,green_A_vector] =...
            phase_A_pre_timed(t,green_A_vector,current_A,t_A);
    elseif interstage_AC_active == 1
            [interstage_AC_active,C_active,current_int_AC,AC_vector] =...
             interstage_AC(t,current_int_AC,int_AC,AC_vector);
    elseif C_active == 1
             [interstage_CB_active, C_active, current_C, green_C_vector] =...
              phase_C_pre_timed(t_C,current_C,t,green_C_vector);
    elseif interstage_CB_active == 1
             [interstage_CB_active,B_active,current_int_CB,CB_vector] =...
             interstage_CB(t,current_int_CB,int_CB,CB_vector);
    elseif B_active == 1
             [interstage_BA_active, B_active, current_B, green_B_vector] =...
             phase_B_pre_timed(t_B,current_B,t,green_B_vector);
     else
            [interstage_BA_active,A_active,current_int_BA,BA_vector] =...
             interstage_BA_pre_timed(t,current_int_BA,int_BA,BA_vector);

    end
    
end


                