%This function gets the time simlation , vector of how many cars arrival
%every second to junction in any way , vector of how many cars discharged
%in every second in any way of junction , and return vectors of the time
%that the cars is arrivval and delay 

function [avg_cycle_delay_1,avg_cycle_delay_3,avg_cycle_delay_5,arrival_time_veh_1L,arrival_time_veh_1T,arrival_time_veh_1R,arrival_time_veh_5,arrival_time_veh_3,arrival_time_veh_7,delay_veh_1L,delay_veh_1T,delay_veh_1R,delay_veh_5,delay_veh_3,delay_veh_7,average_delay_veh_1L,average_delay_veh_1T,average_delay_veh_1R,average_delay_veh_5,average_delay_veh_3,average_delay_veh_7]=...
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
    cycle_delay_1L=0;
else
    for i = 1 : length(arrival_time_veh_1L)
        if i<= num_veh_1L_discharged
            delay_veh_1L(i) = discharge_time_veh_1L(i)- arrival_time_veh_1L(i);
        else
            delay_veh_1L(i)= time_simulation - arrival_time_veh_1L(i);

        end
        
          cycle_delay_1L(i)=delay_veh_1L(i)/time_simulation;

        
    end
end


if(flag1T==true)
    delay_veh_1T=0;
    cycle_delay_1T=0;
else
    for i = 1 : length(arrival_time_veh_1T)

        if i<= num_veh_1T_discharged
            delay_veh_1T(i) = discharge_time_veh_1T(i)- arrival_time_veh_1T(i);
        else 
                delay_veh_1T(i)= time_simulation - arrival_time_veh_1T(i);
        end
        
                        cycle_delay_1T(i)=delay_veh_1T(i)/time_simulation;


    end
end



if(flag1R==true)
    delay_veh_1R=0;
    cycle_delay_1R=0;
else
    for i = 1 : length(arrival_time_veh_1R)

        if i<= num_veh_1R_discharged
            delay_veh_1R(i) = discharge_time_veh_1R(i)- arrival_time_veh_1R(i);
         else 

                delay_veh_1R(i)= time_simulation - arrival_time_veh_1R(i);
        end
                cycle_delay_1R(i)=delay_veh_1R(i)/time_simulation;

       

    end
end

av_temp_1R=mean(cycle_delay_1R);
av_temp_1T=mean(cycle_delay_1T);
av_temp_1L=mean(cycle_delay_1L);

avg_cycle_delay_1=mean([av_temp_1R,av_temp_1T,av_temp_1L]);

if(flag5==true)
    delay_veh_5=0;
    cycle_delay_5=0;
else
    for i = 1 : length(arrival_time_veh_5)

        if i<= num_veh_5_discharged
            delay_veh_5(i) = discharge_time_veh_5(i)- arrival_time_veh_5(i);
         else 
                delay_veh_5(i)= time_simulation - arrival_time_veh_5(i);
        end
        cycle_delay_5(i)=delay_veh_5(i)/time_simulation;
    end
end

        avg_cycle_delay_5=mean(cycle_delay_5);

if(flag3==true)
    delay_veh_3=0;
    cycle_delay_3=0;
else
    for i = 1 : length(arrival_time_veh_3)

        if i<= num_veh_3_discharged
            delay_veh_3(i) = discharge_time_veh_3(i)- arrival_time_veh_3(i);
         else 
            delay_veh_3(i)= time_simulation - arrival_time_veh_3(i);
        end
        cycle_delay_3(i)=delay_veh_3(i)/time_simulation;
    end
end

        avg_cycle_delay_3=mean(cycle_delay_3);

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


% 
% r=sum(arrival_vehicle_every_second_3);
% result = sum(arrival_vehicle_every_second_3(1:70));
% result1 = sum(arrival_vehicle_every_second_3(70:140));
% result2 = sum(arrival_vehicle_every_second_3(140:210));
% 
% result_5 = sum(arrival_vehicle_every_second_5(1:70));
% result_5_2 = sum(arrival_vehicle_every_second_5(70:140));
% result_5_3 = sum(arrival_vehicle_every_second_5(70:140));
% 
% average_delay_veh_112121212 = mean([result_5,result_5_2,result_5_3]);

% calculate the avrage delay by function mean 

test=sum(arrival_vehicle_every_second_3(1:70));
test1=sum(arrival_vehicle_every_second_3(70:140));
test2=sum(arrival_vehicle_every_second_3(140:210));

        test_mean=mean([test,test1,test2]);

        test=sum(discharge_veh_7(1:70));
test1=sum(discharge_veh_7(70:140));
test2=sum(discharge_veh_7(140:210));

        test_mean1=mean([test,test1,test2]);

        
                test=sum(discharge_veh_5(1:70));
test1=sum(discharge_veh_5(70:140));
test2=sum(discharge_veh_5(140:210));

        test_mean2=mean([test,test1,test2]);
        
               test=sum(discharge_veh_1T(1:70));
test1=sum(discharge_veh_1T(70:140));
test2=sum(discharge_veh_1T(140:210));

        test_mean3=mean([test,test1,test2]);

average_delay_veh_1L = mean(delay_veh_1L);
average_delay_veh_1T = mean(delay_veh_1T);
average_delay_veh_1R = mean(delay_veh_1R);
average_delay_veh_5 = mean(delay_veh_5);
average_delay_veh_3 = mean(delay_veh_3);
average_delay_veh_7 = mean(delay_veh_7);


                