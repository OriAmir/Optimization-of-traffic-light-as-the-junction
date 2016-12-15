%This function calculate how many vehicles discharged the junction in the
%second t . It's return the number of the vechiles that discharged and
%update the vector of the discharged vehicles

function [discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged] = ...
    discharge_vehicle(t,arrival_vehicle_until_second_1L,arrival_vehicle_until_second_1T,arrival_vehicle_until_second_1R,arrival_vehicle_until_second_5,arrival_vehicle_until_second_3,arrival_vehicle_until_second_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged,A_active,B_active,C_active,discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7)

if  (B_active == 1) && (arrival_vehicle_until_second_1L(t) > sum(discharge_veh_1L(1:t-1))) && (discharge_veh_1L(t-1) == 0)
        discharge_veh_1L(t) = 1;
        num_veh_1L_discharged = num_veh_1L_discharged + 1;
end

if  (B_active == 1) && (arrival_vehicle_until_second_1T(t) > sum(discharge_veh_1T(1:t-1))) && (discharge_veh_1T(t-1) == 0)
        discharge_veh_1T(t) = 1;
        num_veh_1T_discharged = num_veh_1T_discharged + 1; 
end
    
if  (B_active == 1) && (arrival_vehicle_until_second_1R(t) > sum(discharge_veh_1R(1:t-1))) && (discharge_veh_1R(t-1) == 0)
        discharge_veh_1R(t) = 1;
        num_veh_1R_discharged = num_veh_1R_discharged + 1; 
end   


if  (C_active == 1) && (arrival_vehicle_until_second_5(t) > sum(discharge_veh_5(1:t-1))) && (discharge_veh_5(t-1) == 0)
    if (arrival_vehicle_until_second_5(t) - sum(discharge_veh_5(1:t-1))) == 1
        discharge_veh_5(t) = 1;
        num_veh_5_discharged = num_veh_5_discharged + 1;
    else
        discharge_veh_5(t) = 2;
        num_veh_5_discharged = num_veh_5_discharged + 2;
    end
    
end

if t==1
    k=1;
else
    k=t-1;
end
    
if  (A_active == 1) && (arrival_vehicle_until_second_3(t) > sum(discharge_veh_3(1:k))) && (discharge_veh_3(k) == 0)
    if (arrival_vehicle_until_second_3(t) - sum(discharge_veh_3(1:k))) == 1
        discharge_veh_3(t) = 1;
        num_veh_3_discharged = num_veh_3_discharged + 1;
    else
        discharge_veh_3(t) = 2;
        num_veh_3_discharged = num_veh_3_discharged + 2;
    end
    
end

if  (A_active == 1) && (arrival_vehicle_until_second_7(t) > sum(discharge_veh_7(1:k))) && (discharge_veh_7(k) == 0)
    if (arrival_vehicle_until_second_7(t) - sum(discharge_veh_7(1:k))) == 1
        discharge_veh_7(t) = 1;
        num_veh_7_discharged = num_veh_7_discharged + 1;
    else
        discharge_veh_7(t) = 2;
        num_veh_7_discharged = num_veh_7_discharged + 2;
    end
    
end             