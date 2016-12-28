%This function is initalize the num of vehicle for the time_simaltion by
%num cycles

function [ lamda1L,lamda1R,lamda1T,lamda3,lamda5,lamda7 ] = setLamdaValues( num_cycles,lamda_Values)

lamda1L=(lamda_Values(1)/3600)*num_cycles;
lamda1R=(lamda_Values(2)/3600)*num_cycles;
lamda1T=(lamda_Values(3)/3600)*num_cycles;

lamda3=(lamda_Values(4)/3600)*num_cycles;
lamda5=(lamda_Values(5)/3600)*num_cycles;
lamda7=(lamda_Values(6)/3600)*num_cycles;

end

