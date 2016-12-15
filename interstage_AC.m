%This function check if the time between phase A to Phase C still active- still have a time

function [interstage_AC_active,C_active,current_int_AC,AC_vector] = ...
    interstage_AC(t,current_int_AC,int_AC,AC_vector)

AC_vector(t) = 1; ;%initalize the vector of the time between phase A to C

if current_int_AC < int_AC %Still have time  between the 2 phase
    interstage_AC_active = 1;
    current_int_AC = current_int_AC + 1;
    C_active = 0;
else
    interstage_AC_active = 0;
    current_int_AC = 1;
    C_active = 1;
end
