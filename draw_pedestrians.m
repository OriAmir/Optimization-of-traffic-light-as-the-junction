%This function set pedestrians in the simulation by the data
function [detect_ped_d,detect_ped_e,detect_ped_f,detect_ped_g] = ...
    draw_pedestrians(lamda,time_simulation)

%poissrnd(lambda) generates random numbers from the Poisson distribution with mean parameter lambda.
%poissrnd(lambda,1,time_simlation)generates an 1,time_simulation array 

detect_ped_d = poissrnd(lamda,1,time_simulation);
detect_ped_e = poissrnd(lamda,1,time_simulation);
detect_ped_f = poissrnd(lamda,1,time_simulation);
detect_ped_g = poissrnd(lamda,1,time_simulation);

end

