%This function is initalize the num of vehicle for every round from every lane

function [num_vehicle_arrival_every_round] = set_values_for_arrival_vehicles(plan_number)

%roundX[1]= num of vehicles from 1L lane
%roundX[2]= num of vehicles from 1T lane
%roundX[3]= num of vehicles from 1R lane
%roundX[4]= num of vehicles from 3 lanes
%roundX[5]= num of vehicles from 5 lanes
%roundX[6]= num of vehicles from 7 lanes

if strcmp(plan_number, 'plan1button') % Heavy traffic from lane 3 & 7 for 1 hour 
    round1=[6,5,5,35,13,35];
    round2=[3,5,2,85,13,85];
    round3=[10,10,0,100,10,80];
    round4=[5,5,5,100,5,100];
    round5=[5,5,0,90,9,85];
    round6=[10,5,3,85,15,85];
    round7=[0,5,8,50,22,50];
    round8=[5,5,10,82,15,70];
    round9=[9,2,3,88,9,60];
    round10=[0,5,15,100,5,66];
    round11=[2,5,4,100,11,90];
    round12=[5,5,0,60,30,60];
    round13=[0,7,4,90,30,92];
    round14=[5,5,5,90,8,75];
    round15=[6,1,6,89,4,99];
    round16=[7,0,0,101,10,115];
    round17=[5,0,2,80,9,85];
elseif strcmp(plan_number, 'plan2button')  % Heavy traffic from lane 5
    round1=[15,5,5,20,33,20];
    round2=[10,10,10,15,50,15];
    round3=[6,5,8,8,112,10];
    round4=[10,5,10,15,145,5];
    round5=[7,7,7,9,149,4];
    round6=[8,5,3,17,155,6];
    round7=[9,10,8,19,90,10];
    round8=[5,11,10,8,70,11];
    round9=[5,15,2,12,122,9];
    round10=[11,5,6,7,129,9];
    round11=[4,4,4,10,138,8];
    round12=[11,12,3,15,130,10];
    round13=[5,20,4,20,126,6];
    round14=[13,5,9,9,88,7];
    round15=[12,5,7,12,77,11];
    round16=[5,3,3,8,97,9];
    round17=[9,2,9,15,84,8];
else  % traffic change....
    round1=[5,5,5,25,10,33];
    round2=[0,5,0,90,10,75];
    round3=[10,10,0,100,10,99];
    round4=[5,5,5,111,11,93];
    round5=[15,20,12,19,10,11];
    round6=[30,15,29,11,5,12];
    round7=[55,39,65,10,7,11];
    round8=[55,65,80,10,7,8];
    round9=[59,58,90,5,5,5];
    round10=[40,39,35,25,30,22];
    round11=[12,13,14,12,49,11];
    round12=[5,5,3,5,80,6];
    round13=[5,3,5,23,99,25];
    round14=[8,8,8,9,110,10];
    round15=[9,7,10,14,40,25];
    round16=[6,6,6,30,30,30];
    round17=[7,7,7,15,35,10];
    
end

num_vehicle_arrival_every_round=[round1;round2;round3;round4;round5;round6;round7;round8;round9;round10;round11;round12;round13;round14;round15;round16;round17];


end

