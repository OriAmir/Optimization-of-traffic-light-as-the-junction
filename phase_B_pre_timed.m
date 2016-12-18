%This function check if the phase B still active- still have a time to run

function [interstage_BA_active, B_active, current_B, green_B_vector] = phase_B_pre_timed(t_B,current_B,t,green_B_vector)

extend_B = 0;  % Flag that represents if the time of pahse B is still active(1) or not(0)
green_B_vector(t)=1;%initalize the vector of the time green of phase A


if current_B < t_B
    extend_B = 1;
else 
    extend_B = 0;    
end

if extend_B == 1 %Still have time to phase 
    current_B = current_B + 1;
    B_active = 1;
    interstage_BA_active = 0;
else  
    B_active = 0;
    current_B = 1;
    interstage_BA_active = 1;
            
end