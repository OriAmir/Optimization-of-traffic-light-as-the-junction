%This function check if the time between phase B to Phase A still active- still have a time

function [interstage_BA_active,A_active,current_int_BA,BA_vector] = ...
    interstage_BA_pre_timed(t,current_int_BA,int_BA,BA_vector)

BA_vector(t)=1;  %initalize the vector of the time between phase B to A

if current_int_BA < int_BA  %Still have time between the 2 phase
    interstage_BA_active = 1;
    current_int_BA = current_int_BA + 1;
    A_active = 0;
else
    interstage_BA_active = 0;
    current_int_BA = 1;
    A_active = 1;
end
