%This function is initalize the num of vehicle for every round from every lane

function [num_vehicle_arrival_every_round] = set_values_for_arrival_vehicles(plan_number)


%roundX[1]= num of vehicles from 1L lane
%roundX[2]= num of vehicles from 1T lane
%roundX[3]= num of vehicles from 1R lane
%roundX[4]= num of vehicles from 3 lanes
%roundX[5]= num of vehicles from 5 lanes
%roundX[6]= num of vehicles from 7 lanes

if strcmp(plan_number, 'plan1button')
    round1=[5,5,5,100,10,60];
    round2=[0,5,0,140,10,120];
    round3=[10,10,0,66,10,50];
    round4=[5,5,5,100,15,100];
    round5=[5,5,0,70,20,150];
    round6=[10,10,10,20,70,25];
    round7=[0,5,10,10,90,14];
    round8=[5,5,10,20,75,8];
    round9=[5,5,10,20,150,5];
    round10=[5,5,15,25,175,22];
    round11=[5,5,4,15,200,15];
    round12=[5,5,20,30,60,28];
    round13=[25,20,40,20,50,20];
    round14=[25,20,50,10,30,10];
    round15=[25,29,50,6,20,10];
    round16=[20,20,20,14,15,15];
    round17=[30,40,30,15,10,10];
elseif strcmp(plan_number, 'plan2button')
    round1=[5,5,5,100,10,60];
    round2=[0,5,0,140,10,120];
    round3=[10,10,0,66,10,50];
    round4=[5,5,5,100,15,100];
    round5=[5,5,0,70,20,150];
    round6=[10,10,10,20,70,25];
    round7=[0,5,10,10,90,14];
    round8=[5,5,10,20,75,8];
    round9=[5,5,10,20,150,5];
    round10=[5,5,15,25,175,22];
    round11=[5,5,4,15,200,15];
    round12=[5,5,20,30,60,28];
    round13=[25,20,40,20,50,20];
    round14=[25,20,50,10,30,10];
    round15=[25,29,50,6,20,10];
    round16=[20,20,20,14,15,15];
    round17=[30,40,30,15,10,10];
else
    round1=[5,5,5,100,10,60];
    round2=[0,5,0,140,10,120];
    round3=[10,10,0,66,10,50];
    round4=[5,5,5,100,15,100];
    round5=[5,5,0,70,20,150];
    round6=[10,10,10,20,70,25];
    round7=[0,5,10,10,90,14];
    round8=[5,5,10,20,75,8];
    round9=[5,5,10,20,150,5];
    round10=[5,5,15,25,175,22];
    round11=[5,5,4,15,200,15];
    round12=[5,5,20,30,60,28];
    round13=[25,20,40,20,50,20];
    round14=[25,20,50,10,30,10];
    round15=[25,29,50,6,20,10];
    round16=[20,20,20,14,15,15];
    round17=[30,40,30,15,10,10];
    
end

num_vehicle_arrival_every_round=[round1;round2;round3;round4;round5;round6;round7;round8;round9;round10;round11;round12;round13;round14;round15;round16;round17];


end

