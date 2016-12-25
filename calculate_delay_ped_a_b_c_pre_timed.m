function [green_AC_vector,green_AB_vector,ped_red_AC,ped_red_AB,ped_green_AC,ped_green_AB,num_ped_green_a,num_ped_green_c,num_ped_green_b,num_ped_red_a,num_ped_red_c,num_ped_red_b,delay_ped_a,delay_ped_c,delay_ped_b,average_delay_ped_a,average_delay_ped_c,average_delay_ped_b] =...
    calculate_delay_ped_a_b_c_pre_timed(time_simulation,lamda_a,lamda_b,lamda_c,green_A_vector,green_B_vector,green_C_vector,AC_vector,BA_vector)


for i = 1 : time_simulation
    
green_AC_vector(i) = green_A_vector(i) + green_C_vector(i) + AC_vector(i);
green_AB_vector(i) = green_A_vector(i) + green_B_vector(i) + BA_vector(i);

end

ped_red_AC(1)=0;
k=1;
start_red = 0;
for i = 1 : time_simulation
    if start_red == 0
         if green_AC_vector(i)== 0
            start_red = i;
         end
    end
        if start_red ~= 0
            if green_AC_vector(i) == 1
                end_red =i;
                ped_red_AC(k)=end_red-start_red;
                k=k+1;
                start_red = 0;
            else if i == time_simulation
                    end_red = i+1;
                    ped_red_AC(k)=end_red-start_red;
                end
            end
        end
end
ped_green_AC = time_simulation-sum(ped_red_AC);
num_ped_green_a = poissrnd(lamda_a*ped_green_AC);
num_ped_green_c = poissrnd(lamda_c*ped_green_AC);


for j = 1 : length(ped_red_AC)
    num_ped_red_a(j)= poissrnd(lamda_a*ped_red_AC(j));
    delay_ped_a(j)=num_ped_red_a(j)*ped_red_AC(j)/2;
    num_ped_red_c(j)= poissrnd(lamda_c*ped_red_AC(j));
    delay_ped_c(j)=num_ped_red_c(j)*ped_red_AC(j)/2;
end


average_delay_ped_a = sum(delay_ped_a)/(sum(num_ped_red_a)+num_ped_green_a);
if(isnan(average_delay_ped_a))
    average_delay_ped_a=0;
end

average_delay_ped_c = sum(delay_ped_c)/(sum(num_ped_red_c)+num_ped_green_c);
if(isnan(average_delay_ped_c))
    average_delay_ped_c=0;
end

ped_red_AB(1)=0;
k=1;
start_red = 0;
for i = 1 : time_simulation
    if start_red == 0
         if green_AB_vector(i)== 0
            start_red = i;
         end
    end
        if start_red ~= 0
            if green_AB_vector(i) == 1
                end_red =i;
                ped_red_AB(k)=end_red-start_red;
                k=k+1;
                start_red = 0;
            else if i == time_simulation
                    end_red = i+1;
                    ped_red_AB(k)=end_red-start_red;
                end
            end
        end
end
ped_green_AB = time_simulation-sum(ped_red_AB);
num_ped_green_b = poissrnd(lamda_b*ped_green_AB);


for j = 1 : length(ped_red_AB)
    num_ped_red_b(j)= poissrnd(lamda_b*ped_red_AB(j));
    delay_ped_b(j)=num_ped_red_b(j)*ped_red_AB(j)/2;
end


average_delay_ped_b = sum(delay_ped_b)/(sum(num_ped_red_b)+num_ped_green_b);

if(isnan(average_delay_ped_b))
    average_delay_ped_b=0;
end
                
                


                