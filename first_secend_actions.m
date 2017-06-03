%This funciton initialize values for the simulation

function [current_A,current_C,current_B,current_int_AC,current_int_CB,current_int_BA,green_A_vector,green_C_vector,green_B_vector,A_active,B_active,C_active,interstage_AC_active,interstage_CB_active,interstage_BA_active,discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged,AC_vector,CB_vector,BA_vector] =...
    first_secend_actions(time_simulation)

current_A=1;
current_B=1;
current_C=1;

current_int_AC=1;
current_int_CB=1;
current_int_BA=1;

A_active = 1;
B_active = 0;
C_active = 0;

interstage_AC_active = 0;
interstage_CB_active = 0;
interstage_BA_active = 0;

num_veh_1L_discharged = 0;
num_veh_1T_discharged = 0;
num_veh_1R_discharged = 0;
num_veh_5_discharged = 0;
num_veh_3_discharged = 0;
num_veh_7_discharged = 0;

green_A_vector = zeros(1,time_simulation);
green_C_vector = zeros(1,time_simulation);
green_B_vector = zeros(1,time_simulation);

AC_vector = zeros(1,time_simulation);
CB_vector = zeros(1,time_simulation);
BA_vector = zeros(1,time_simulation);

discharge_veh_1L = zeros(1,time_simulation);
discharge_veh_1T = zeros(1,time_simulation);
discharge_veh_1R = zeros(1,time_simulation);
discharge_veh_5 = zeros(1,time_simulation);
discharge_veh_3 = zeros(1,time_simulation);
discharge_veh_7 = zeros(1,time_simulation);    