%This function check if the phase A still active- still have a time

function [A_active,current_A,interstage_AC_active,green_A_vector] = ...
    phase_A_pre_timed(t,green_A_vector,current_A,t_A)

extend_A = 0; % Flag that represents if the time of pahse A is still active(1) or not(0)
A_active = 1;
green_A_vector(t)=1; %initalize the vector of the time green of phase A
interstage_AC_active = 0; %the time between phase A to C, now not active 

if current_A < t_A 
    extend_A = 1; 
else 
   extend_A = 0;              
end
            
if extend_A == 1 %Still have time to phase A
    current_A = current_A + 1; 
else %Phase A time is finish...now need to activate the time between pahse A to C
    A_active = 0;
    current_A = 1;
    interstage_AC_active = 1;
end