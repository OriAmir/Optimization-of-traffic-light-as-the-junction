function [arrival_time_ped_d,arrival_time_ped_e,arrival_time_ped_f,arrival_time_ped_g,delay_ped_d,delay_ped_e,delay_ped_f,delay_ped_g,average_delay_ped_d,average_delay_ped_e,average_delay_ped_f,average_delay_ped_g,num_ped_d,num_ped_e,num_ped_f,num_ped_g] = ...
    calculate_delay_pedestrians(time_simulation,green_B_vector,green_C_vector,CB_vector,detect_ped_d,detect_ped_e,detect_ped_f,detect_ped_g)


flag_detect_ped_d=false;
flag_detect_ped_e=false;
flag_detect_ped_f=false;
flag_detect_ped_g=false;


%initalize the arrival_time_ped array in which second every pedestrian is arrival 

j=1;
for i = 1 : time_simulation
    if detect_ped_d(i) >= 1
        for k = 1 : detect_ped_d(i) 
        arrival_time_ped_d(j) = i;
        j = j + 1;
        end
        flag_detect_ped_d=true;
    end
end

if(flag_detect_ped_d==false)
    arrival_time_ped_d=[];
end


j=1;

for i = 1 : time_simulation
    if detect_ped_e(i) >= 1
        for k = 1 : detect_ped_e(i) 
        arrival_time_ped_e(j) = i;
        j = j + 1;
        end
        flag_detect_ped_e=true;
    end
end

if(flag_detect_ped_e==false)
    arrival_time_ped_e=[];
end


j=1;

for i = 1 : time_simulation
    if detect_ped_f(i) >= 1
        for k = 1 : detect_ped_f(i) 
        arrival_time_ped_f(j) = i;
        j = j + 1;
        end
        flag_detect_ped_f=true;
    end
end

if(flag_detect_ped_f==false)
    arrival_time_ped_f=[];
end

j=1;

for i = 1 : time_simulation
    if detect_ped_g(i) >= 1
        for k = 1 : detect_ped_g(i) 
        arrival_time_ped_g(j) = i;
        j = j + 1;
        end
        flag_detect_ped_g=true;
    end
end

if(flag_detect_ped_g==false)
    arrival_time_ped_g=[];
end

%Calculate how total pedestrians arrival
num_ped_d = length(arrival_time_ped_d); 
num_ped_e = length(arrival_time_ped_e);
num_ped_f = length(arrival_time_ped_f);
num_ped_g = length(arrival_time_ped_g);


if(num_ped_d==0)
    delay_ped_d=0;
end

if(num_ped_e==0)
    delay_ped_e=0;
end

if(num_ped_f==0)
    delay_ped_f=0;
end

if(num_ped_g==0)
    delay_ped_g=0;
end


%Calcualte the dealy of the pedestrians - take the time that pedestrians can pass the junction and
%deduct the time that pedestrians is arrival to junction

for i = 1 : num_ped_d
    
    for j = arrival_time_ped_d(i) : time_simulation
        
        if green_C_vector(j) == 1 || green_B_vector(j)== 1 || CB_vector(j) == 1
             delay_ped_d(i) = j - arrival_time_ped_d(i);
            break;  
        else j = j + 1;   
        end
        
        if j == (time_simulation + 1)
            delay_ped_d(i) = time_simulation - arrival_time_ped_d(i);
        end
    end
    
    i = i + 1;
end

for i = 1 : num_ped_e
    
    for j = arrival_time_ped_e(i) : time_simulation
        
        if green_C_vector(j) == 1 
             delay_ped_e(i) = j - arrival_time_ped_e(i);
            break;  
        else j = j + 1;   
        end
        
        if j == (time_simulation + 1)
            delay_ped_e(i) = time_simulation - arrival_time_ped_e(i);
        end
    end
    
    i = i + 1;
end

for i = 1 : num_ped_f
    
    for j = arrival_time_ped_f(i) : time_simulation
        
        if green_C_vector(j) == 1 || green_B_vector(j)== 1 || CB_vector(j) == 1
             delay_ped_f(i) = j - arrival_time_ped_f(i);
            break;  
        else j = j + 1;   
        end
        
        if j == (time_simulation + 1)
            delay_ped_f(i) = time_simulation - arrival_time_ped_f(i);
        end
    end
    
    i = i + 1;
end

for i = 1 : num_ped_g
    
    for j = arrival_time_ped_g(i) : time_simulation
        
        if green_B_vector(j)== 1 
             delay_ped_g(i) = j - arrival_time_ped_g(i);
            break;  
        else j = j + 1;   
        end
        
        if j == (time_simulation + 1)
            delay_ped_g(i) = time_simulation - arrival_time_ped_g(i);
        end
    end
    
    i = i + 1;
end

average_delay_ped_d = mean(delay_ped_d);
average_delay_ped_e = mean(delay_ped_e);
average_delay_ped_f = mean(delay_ped_f);
average_delay_ped_g = mean(delay_ped_g);
                