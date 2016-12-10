%This function get the all data and initalize the vehicles arrival time in
%every second 

function [arrival_vehicle_every_second_1L,arrival_vehicle_until_second_1L,arrival_vehicle_every_second_1T,arrival_vehicle_until_second_1T,arrival_vehicle_every_second_1R,arrival_vehicle_until_second_1R,arrival_vehicle_every_second_5,arrival_vehicle_until_second_5,arrival_vehicle_every_second_3,arrival_vehicle_until_second_3,arrival_vehicle_every_second_7,arrival_vehicle_until_second_7] =...
    draw_private_vehicles(time_simulation,lamda1L,lamda1T,lamda1R,lamda5,lamda3,lamda7,min_gap)

%initalize the arrivel_vehicle_every_second vectors
arrival_vehicle_every_second_1L=zeros(1,time_simulation);
arrival_vehicle_every_second_1T=zeros(1,time_simulation);
arrival_vehicle_every_second_1R=zeros(1,time_simulation);
arrival_vehicle_every_second_5=zeros(1,time_simulation);
arrival_vehicle_every_second_3=zeros(1,time_simulation);
arrival_vehicle_every_second_7=zeros(1,time_simulation);
    

%poissrnd(lambda) generates random numbers from the Poisson distribution with mean parameter lambda.
%poissrnd(lambda,1,time_simlation)generates an 1,time_simulation array 
detect_vehicle_every_second_1L = poissrnd(lamda1L,1,time_simulation);
detect_vehicle_every_second_1T = poissrnd(lamda1T,1,time_simulation);
detect_vehicle_every_second_1R = poissrnd(lamda1R,1,time_simulation);
detect_vehicle_every_second_5 = poissrnd(lamda5,1,time_simulation);
detect_vehicle_every_second_3 = poissrnd(lamda3,1,time_simulation);
detect_vehicle_every_second_7 = poissrnd(lamda7,1,time_simulation);


%initalize the detect_vehicle_lane vector

detect_vehicle_1L_lane=repmat(detect_vehicle_every_second_1L,1);
detect_vehicle_1T_lane=repmat(detect_vehicle_every_second_1T,1);
detect_vehicle_1R_lane=repmat(detect_vehicle_every_second_1R,1);

% for i = 1: time_simulation
%     detect_vehicle_1L_lane(i) =  detect_vehicle_every_second_1L(i);
%     detect_vehicle_1T_lane(i) =  detect_vehicle_every_second_1T(i);
%     detect_vehicle_1R_lane(i) =  detect_vehicle_every_second_1R(i);
% end

critical_volume =  (lamda1T + lamda1R)/2;
T_lane_R_lane_ratio = round(critical_volume/(lamda1T-critical_volume));
lane_ratio = T_lane_R_lane_ratio/(T_lane_R_lane_ratio + 1);

for i = 1 : time_simulation

if detect_vehicle_every_second_1T(i) >= 1
    for j = 1 : detect_vehicle_every_second_1T(i)
    u = rand(1);
    if u > lane_ratio
       detect_vehicle_1T_lane(i) = detect_vehicle_1T_lane(i) - 1;
       detect_vehicle_1R_lane(i) = detect_vehicle_1R_lane(i) + 1;
    end
    end
end
end

for i = 1 : (time_simulation - min_gap)
    arrival_vehicle_every_second_1L(i+min_gap) = detect_vehicle_1L_lane(i); 
    arrival_vehicle_every_second_1T(i+min_gap) = detect_vehicle_1T_lane(i);
    arrival_vehicle_every_second_1R(i+min_gap) = detect_vehicle_1R_lane(i);
    arrival_vehicle_every_second_5(i+min_gap) = detect_vehicle_every_second_5(i);
    arrival_vehicle_every_second_3(i+min_gap) = detect_vehicle_every_second_3(i);
    arrival_vehicle_every_second_7(i+min_gap) = detect_vehicle_every_second_7(i);
end 
arrival_vehicle_until_second_1L(1)= arrival_vehicle_every_second_1L(1);
arrival_vehicle_until_second_1T(1)= arrival_vehicle_every_second_1T(1);
arrival_vehicle_until_second_1R(1)= arrival_vehicle_every_second_1R(1);
arrival_vehicle_until_second_5(1)= arrival_vehicle_every_second_5(1);
arrival_vehicle_until_second_3(1)= arrival_vehicle_every_second_3(1);
arrival_vehicle_until_second_7(1)= arrival_vehicle_every_second_7(1);


for i = 2 : time_simulation
    arrival_vehicle_until_second_1L(i) = arrival_vehicle_every_second_1L(i)+ arrival_vehicle_until_second_1L(i-1); %???? ??????? ??????? ?????? ?? ????? ??????
    arrival_vehicle_until_second_1T(i) = arrival_vehicle_every_second_1T(i)+ arrival_vehicle_until_second_1T(i-1);
    arrival_vehicle_until_second_1R(i) = arrival_vehicle_every_second_1R(i)+ arrival_vehicle_until_second_1R(i-1);
    arrival_vehicle_until_second_5(i) = arrival_vehicle_every_second_5(i)+ arrival_vehicle_until_second_5(i-1);
    arrival_vehicle_until_second_3(i) = arrival_vehicle_every_second_3(i)+ arrival_vehicle_until_second_3(i-1);
    arrival_vehicle_until_second_7(i) = arrival_vehicle_every_second_7(i)+ arrival_vehicle_until_second_7(i-1);
end








