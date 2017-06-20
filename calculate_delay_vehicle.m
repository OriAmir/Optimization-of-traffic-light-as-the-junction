%This function get:
%-the time simlation
%-vector of how many cars arrival every second to junction in any way
%-how many cars discharged in any way
%The function return:
%-vectors of the time that the cars is arrivval in any way
%- delay in any way

function [arrival_time_veh_1L,arrival_time_veh_1T,arrival_time_veh_1R,arrival_time_veh_5,arrival_time_veh_3,arrival_time_veh_7,delay_veh_1L,delay_veh_1T,delay_veh_1R,delay_veh_5,delay_veh_3,delay_veh_7,average_delay_veh_1L,average_delay_veh_1T,average_delay_veh_1R,average_delay_veh_5,average_delay_veh_3,average_delay_veh_7]=...
    calculate_delay_vehicle(time_simulation,arrival_vehicle_every_second_1L,arrival_vehicle_every_second_1T,arrival_vehicle_every_second_1R,arrival_vehicle_every_second_5,arrival_vehicle_every_second_3,arrival_vehicle_every_second_7,discharge_veh_1L,discharge_veh_1T,discharge_veh_1R,discharge_veh_5,discharge_veh_3,discharge_veh_7,num_veh_1L_discharged,num_veh_1T_discharged,num_veh_1R_discharged,num_veh_5_discharged,num_veh_3_discharged,num_veh_7_discharged )

%Flags for say if the num of vehicles that discharged is 0
flag1L =false;
flag1T=false;
flag1R=false;
flag3=false;
flag5=false;
flag7=false;

%initalize the num_veh_X_discharged vectors if the num of cars is 0 

if num_veh_1L_discharged==0
   arrival_time_veh_1L=[];
   flag1L=true;
else 
    arrival_time_veh_1L=zeros(1,num_veh_1L_discharged);
end

if num_veh_1T_discharged==0
   arrival_time_veh_1T=[];
   flag1T=true;
else
    arrival_time_veh_1T=zeros(1,num_veh_1T_discharged);
end


if num_veh_1R_discharged==0
   arrival_time_veh_1R=[];
   flag1R=true;
else
    arrival_time_veh_1R=zeros(1,num_veh_1R_discharged);
end


if num_veh_3_discharged==0
   arrival_time_veh_3=[];
   flag3=true;
else
    arrival_time_veh_3=zeros(1,num_veh_3_discharged);
end

if num_veh_5_discharged==0
   arrival_time_veh_5=[];
   flag5=true;
else
    arrival_time_veh_5=zeros(1,num_veh_5_discharged);
end

if num_veh_7_discharged==0
   arrival_time_veh_7=[];
   flag7=true;
else
    arrival_time_veh_7=zeros(1,num_veh_7_discharged);
end


%update the second that all the vehicles come to the junction in
%arrival_time_veh_X vector . 
%it's check the arrival_vehicle_every_second that conatin vector of every
%sceond how many cars is coming from some way in junction and updated in
%by this the arrivel_time array in the real second 
% 

place1L=1;
place1T=1;
place1R=1;
place3=1;
place5=1;
place7=1;

for i = 1 : time_simulation
    
        if arrival_vehicle_every_second_1L(i) >= 1
            for k = 1 : arrival_vehicle_every_second_1L(i) 
                arrival_time_veh_1L(place1L) = i;
                place1L = place1L + 1;
            end
        end
 
        
        if arrival_vehicle_every_second_1T(i) >= 1
            for k = 1 : arrival_vehicle_every_second_1T(i) 
                arrival_time_veh_1T(place1T) = i;
                place1T = place1T + 1;
            end
        end
    
        
        if arrival_vehicle_every_second_1R(i) >= 1
            for k = 1 : arrival_vehicle_every_second_1R(i) 
                arrival_time_veh_1R(place1R) = i;
                place1R = place1R + 1;
            end
        end
         
           if arrival_vehicle_every_second_5(i) >= 1
                for k = 1 : arrival_vehicle_every_second_5(i) 
                    arrival_time_veh_5(place5) = i;
                    place5 = place5 + 1;
                end
           end
           
           if arrival_vehicle_every_second_3(i) >= 1
                for k = 1 : arrival_vehicle_every_second_3(i) 
                    arrival_time_veh_3(place3) = i;
                    place3 = place3+ 1;
                end
           end
           
           if arrival_vehicle_every_second_7(i) >= 1
                for k = 1 : arrival_vehicle_every_second_7(i) 
                    arrival_time_veh_7(place7) = i;
                    place7 = place7 + 1;
                end
            end
    
    
end



% j=1;
% for i = 1 : time_simulation
%     if arrival_vehicle_every_second_1L(i) >= 1
%         for k = 1 : arrival_vehicle_every_second_1L(i) 
%             arrival_time_veh_1L(j) = i;
%             j = j + 1;
%         end
%     end
% end
% 
% 
%     
% j=1;
% for i = 1 : time_simulation
%     if arrival_vehicle_every_second_1T(i) >= 1
%         for k = 1 : arrival_vehicle_every_second_1T(i) 
%         arrival_time_veh_1T(j) = i;
%         j = j + 1;
%         end
%     end
% end
% 
% j=1;
% for i = 1 : time_simulation
%     if arrival_vehicle_every_second_1R(i) >= 1
%         for k = 1 : arrival_vehicle_every_second_1R(i) 
%         arrival_time_veh_1R(j) = i;
%         j = j + 1;
%         end
%     end
% end
% 
% 
% j=1;
% for i = 1 : time_simulation
%     if arrival_vehicle_every_second_5(i) >= 1
%         for k = 1 : arrival_vehicle_every_second_5(i) 
%         arrival_time_veh_5(j) = i;
%         j = j + 1;
%         end
%     end
% end
% 
% 
% 
% j=1;
% for i = 1 : time_simulation
%     if arrival_vehicle_every_second_3(i) >= 1
%         for k = 1 : arrival_vehicle_every_second_3(i) 
%         arrival_time_veh_3(j) = i;
%         j = j + 1;
%         end
%     end
% end
% 
% 
% j=1;
% for i = 1 : time_simulation
%     if arrival_vehicle_every_second_7(i) >= 1
%         for k = 1 : arrival_vehicle_every_second_7(i) 
%         arrival_time_veh_7(j) = i;
%         j = j + 1;
%         end
%     end
% end


place1L=1;
place1T=1;
place1R=1;
place3=1;
place5=1;
place7=1;

%Run on all the time simulation and updated all the vectors of
%discharge_time_veh_X in how how many vechiles discharge from the junction
%every second .
for i = 1 : time_simulation
    if discharge_veh_1L(i) >= 1
        discharge_time_veh_1L(place1L) = i;
        place1L = place1L + 1;
    end
    
    if discharge_veh_1T(i) >= 1 
        discharge_time_veh_1T(place1T) = i;
        place1T = place1T + 1;
    end 
    
    if discharge_veh_1R(i) >= 1
        discharge_time_veh_1R(place1R) = i;
        place1R = place1R + 1;    
    end
    
      if discharge_veh_5(i) >= 1
        for k = 1 : discharge_veh_5(i) 
            discharge_time_veh_5(place5) = i;
            place5 = place5 + 1;
        end
     end
    
    if discharge_veh_3(i) >= 1
        for k = 1 : discharge_veh_3(i) 
            discharge_time_veh_3(place3) = i;
            place3 = place3 + 1;
        end
    end
    
    
        if discharge_veh_7(i) >= 1
            for k = 1 : discharge_veh_7(i) 
                discharge_time_veh_7(place7) = i;
                place7 = place7 + 1;
            end
       end
    
end



% 
% j=1;
% 
% for i = 1 : time_simulation
%     if discharge_veh_1L(i) >= 1
%         discharge_time_veh_1L(j) = i;
%         j = j + 1;
%     end
% end
% 
% 
% j=1;
% for i = 1 : time_simulation
%     if discharge_veh_1T(i) >= 1 
%         discharge_time_veh_1T(j) = i;
%         j = j + 1;
%     end   
% end
% 
% j=1;
% for i = 1 : time_simulation
%     if discharge_veh_1R(i) >= 1
%         discharge_time_veh_1R(j) = i;
%         j = j + 1;    
%     end
% end
% 
% j=1;
% for i = 1 : time_simulation
%     if discharge_veh_5(i) >= 1
%         for k = 1 : discharge_veh_5(i) 
%             discharge_time_veh_5(j) = i;
%         j = j + 1;
%         end
%     end
% end
% 
% j=1;
% for i = 1 : time_simulation
%     if discharge_veh_3(i) >= 1
%         for k = 1 : discharge_veh_3(i) 
%             discharge_time_veh_3(j) = i;
%         j = j + 1;
%         end
%     end
% end
% 
% 
% j=1;
% for i = 1 : time_simulation
%     if discharge_veh_7(i) >= 1
%         for k = 1 : discharge_veh_7(i) 
%             discharge_time_veh_7(j) = i;
%         j = j + 1;
%         end
%     end
% end


%Now calculate the dealy of every way in the junction .
% If no vechiles ( flag is true ) - > dealy is 0 for vechiles .
% If exist vechiles so we run on the second that every vechiles in arrive
% to the junction and delay will be the time that the vechile discharged
% minus the time she arrive to the junction . If the vechile not dischrged
% in all the time of the the simlation is the delay will be the time of
% simulation - the arrival time 

if(flag1L==true)
    delay_veh_1L=0;
else
    for i = 1 : length(arrival_time_veh_1L)
        if i<= num_veh_1L_discharged
            delay_veh_1L(i) = discharge_time_veh_1L(i)- arrival_time_veh_1L(i);
        else
            delay_veh_1L(i)= time_simulation - arrival_time_veh_1L(i);

        end 
    end
end


if(flag1T==true)
    delay_veh_1T=0;
else
    for i = 1 : length(arrival_time_veh_1T)

        if i<= num_veh_1T_discharged
            delay_veh_1T(i) = discharge_time_veh_1T(i)- arrival_time_veh_1T(i);
        else 
                delay_veh_1T(i)= time_simulation - arrival_time_veh_1T(i);
        end

    end
end



if(flag1R==true)
    delay_veh_1R=0;
else
    for i = 1 : length(arrival_time_veh_1R)

        if i<= num_veh_1R_discharged
            delay_veh_1R(i) = discharge_time_veh_1R(i)- arrival_time_veh_1R(i);
         else 
            delay_veh_1R(i)= time_simulation - arrival_time_veh_1R(i);
        end
    end
end



if(flag5==true)
    delay_veh_5=0;
else
    for i = 1 : length(arrival_time_veh_5)

        if i<= num_veh_5_discharged
            delay_veh_5(i) = discharge_time_veh_5(i)- arrival_time_veh_5(i);
         else 
                delay_veh_5(i)= time_simulation - arrival_time_veh_5(i);
        end
    end
end


if(flag3==true)
    delay_veh_3=0;
else
    for i = 1 : length(arrival_time_veh_3)
        if i<= num_veh_3_discharged
            delay_veh_3(i) = discharge_time_veh_3(i)- arrival_time_veh_3(i);
         else 
            delay_veh_3(i)= time_simulation - arrival_time_veh_3(i);
        end
    end
end


if(flag7==true)
    delay_veh_7=0;
else
    for i = 1 : length(arrival_time_veh_7)

        if i<= num_veh_7_discharged
            delay_veh_7(i) = discharge_time_veh_7(i)- arrival_time_veh_7(i);
        else 
            delay_veh_7(i)= time_simulation - arrival_time_veh_7(i);
        end

   end
end



% calculate the avrage delay by function mean 

average_delay_veh_1L = mean(delay_veh_1L);
average_delay_veh_1T = mean(delay_veh_1T);
average_delay_veh_1R = mean(delay_veh_1R);
average_delay_veh_5 = mean(delay_veh_5);
average_delay_veh_3 = mean(delay_veh_3);
average_delay_veh_7 = mean(delay_veh_7);


                