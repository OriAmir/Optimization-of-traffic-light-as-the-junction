%This function check if the time between phase C to Phase B still active- still have a time

function [interstage_CB_active,B_active,current_int_CB,CB_vector] = ...
    interstage_CB(t,current_int_CB,int_CB,CB_vector)

CB_vector(t)=1;%initalize the vector of the time between phase C to B

if current_int_CB < int_CB %Still have  time between the 2 phase
    interstage_CB_active = 1;
    current_int_CB = current_int_CB + 1;
    B_active = 0;
else
    interstage_CB_active = 0;
    current_int_CB = 1;
    B_active = 1;
end
