%This function is initalize the num of vehicle for the time_simaltion by num cycles

function [ lamda1L,lamda1R,lamda1T,lamda3,lamda5,lamda7 ] = setLamdaValues( num_cycles,time_in_seconds,lamda_Values)

lamda1L=(lamda_Values(1)/time_in_seconds)*num_cycles;
lamda1R=(lamda_Values(2)/time_in_seconds)*num_cycles;
lamda1T=(lamda_Values(3)/time_in_seconds)*num_cycles;

lamda3=(lamda_Values(4)/time_in_seconds)*num_cycles;
lamda5=(lamda_Values(5)/time_in_seconds)*num_cycles;
lamda7=(lamda_Values(6)/time_in_seconds)*num_cycles;

end

