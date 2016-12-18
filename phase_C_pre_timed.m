%This function check if the phase C still active- still have a time to run

function [interstage_CB_active, C_active, current_C, green_C_vector] =  ...
    phase_C_pre_timed(t_C,current_C,t,green_C_vector)

extend_C = 0;
green_C_vector(t)=1; %initalize the vector of the time green of phase C


if current_C < t_C
    extend_C = 1; 
else 
    extend_C = 0;    
end

    

if extend_C == 1 %Still have time to phase C
    current_C = current_C + 1;
    C_active = 1;
    interstage_CB_active = 0;     
else  %Phase A time is finish...now need to activate the time between pahse C to B
    C_active = 0;
    current_C = 1;
    interstage_CB_active = 1;

end