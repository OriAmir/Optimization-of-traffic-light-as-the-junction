%This function initizlie variables for the final statics of simultion 

function [total_vechiles_arrival_all,total_vechiles_arrival_1,total_vechiles_arrival_3,total_vechiles_arrival_5,total_vechiles_arrival_7,...
          total_new_avg_delay_all,total_new_avg_delay_1,total_new_avg_delay_3,total_new_avg_delay_5,total_new_avg_delay_7, ...
          total_new_dis_all,total_new_dis_1,total_new_dis_3,total_new_dis_5,total_new_dis_7, ...
          total_old_avg_delay_all,total_old_avg_delay_1,total_old_avg_delay_3,total_old_avg_delay_5,total_old_avg_delay_7 ...
          total_old_dis_all,total_old_dis_1,total_old_dis_3,total_old_dis_5,total_old_dis_7 ] = ...  
          initialize_variables()
 
 
 %Contain total arrivals vechiles from every lane
total_vechiles_arrival_all=0; 
total_vechiles_arrival_1=0;
total_vechiles_arrival_3=0;
total_vechiles_arrival_5=0;
total_vechiles_arrival_7=0;

%Contain the delay of new program from every lane
total_new_avg_delay_all=0; 
total_new_avg_delay_1=0; 
total_new_avg_delay_3=0; 
total_new_avg_delay_5=0; 
total_new_avg_delay_7=0; 

%Contain total discharge of new program vechiles from every lane
total_new_dis_all=0; 
total_new_dis_1=0; 
total_new_dis_3=0;
total_new_dis_5=0; 
total_new_dis_7=0; 

%Contain the delay of old program from every lane
total_old_avg_delay_all=0; 
total_old_avg_delay_1=0; 
total_old_avg_delay_3=0; 
total_old_avg_delay_5=0; 
total_old_avg_delay_7=0;

%Contain total discharge of old program vechiles from every lane
total_old_dis_all=0; 
total_old_dis_1=0; 
total_old_dis_3=0;
total_old_dis_5=0; 
total_old_dis_7=0; 
