function [new_phase_time] = calculate_new_phase_time(phaseTime,num_cycle_to_wait_1,num_cycle_to_wait_3,num_cycle_to_wait_7,num_cycle_to_wait_5,next_time_arrival_1,next_time_arrival_3,next_time_arrival_7,next_time_arrival_5)

normal_cycle_to_wait=0.5;
high_cycle_to_wait=1.5;
hugh_cycle_to_wait=2.5;

array=[num_cycle_to_wait_1,num_cycle_to_wait_3,num_cycle_to_wait_7,num_cycle_to_wait_5];
[sortArray,sortIndex]=sort(array);
     disp(sortArray);
     disp(sortIndex);
          disp(array);



%  if all(sortArray < 2)
%       new_phase_time=phaseTime;
%       return;
%  elseif (((high_cycle_to_wait<num_cycle_to_wait_1)&&(num_cycle_to_wait_1<hugh_cycle_to_wait) ...
%           && (high_cycle_to_wait<num_cycle_to_wait_5)&& (num_cycle_to_wait_5<hugh_cycle_to_wait)) ...
%           && (((high_cycle_to_wait<num_cycle_to_wait_3)&&(num_cycle_to_wait_3<hugh_cycle_to_wait) ...
%           && num_cycle_to_wait_7<normal_cycle_to_wait) || ...
%              (((high_cycle_to_wait<num_cycle_to_wait_7)&&(num_cycle_to_wait_7<hugh_cycle_to_wait))...
%              && (num_cycle_to_wait_3<normal_cycle_to_wait))))
%      new_phase_time=phaseTime;
%       return;
%  end
  biggestCycle= sortIndex(4);
  
  new_time=phaseTime;
  if(biggestCycle==1) %lane 1L,1T,1R is with tht biggest cycle time...try to give him more time
      
      if(num_cycle_to_wait_3<normal_cycle_to_wait && num_cycle_to_wait_7<normal_cycle_to_wait)
          [new_time_3,temp_num_cycle_to_wait_1,num_cycle_to_wait_3]=calculate_updrage(normal_cycle_to_wait,2,1,new_time(3),new_time(1),num_cycle_to_wait_1,num_cycle_to_wait_3,next_time_arrival_1, next_time_arrival_3);
          [new_time_7,temp1_num_cycle_to_wait_1,num_cycle_to_wait_7]=calculate_updrage(normal_cycle_to_wait,2,1,new_time(3),new_time(1),num_cycle_to_wait_1,num_cycle_to_wait_7,next_time_arrival_1, next_time_arrival_7);
          [maxValue,maxIndex]=max([new_time_3(1),new_time_7(1)]);
          
          if(maxIndex==1)
              new_time(1)=new_time_3(1);
              new_time(3)=new_time_3(2);
              num_cycle_to_wait_1=temp_num_cycle_to_wait_1;
          else
              new_time(1)=new_time_7(1);
              new_time(3)=new_time_7(2);
              num_cycle_to_wait_1=temp1_num_cycle_to_wait_1;
          end

      end
      
      if(num_cycle_to_wait_5<normal_cycle_to_wait)
          [new_time_5,num_cycle_to_wait_1,num_cycle_to_wait_5]=calculate_updrage(normal_cycle_to_wait,2,1,new_time(3),new_time(2),num_cycle_to_wait_1,num_cycle_to_wait_5,next_time_arrival_1, next_time_arrival_5)
          new_time(3)=new_time_5(1);
          new_time(2)=new_time_5(2);
      end
          
%           while((num_cycle_to_wait_3<normal_cycle_to_wait && num_cycle_to_wait_7<normal_cycle_to_wait) ...
%                   || (num_cycle_to_wait_1<normal_cycle_to_wait))
%               pt_3_7=pt_3_7-1;
%               pt_1=pt_1+1;
%                max_num_discharged_3_for_1_cycle=pt_3_7*3; 
%                num_cycle_to_wait_3=next_time_arrival_3/(max_num_discharged_3_for_1_cycle);
%                
%                max_num_discharged_7_for_1_cycle=pt_3_7*3;
%                num_cycle_to_wait_7=next_time_arrival_7/(max_num_discharged_7_for_1_cycle);
%                
%                max_num_discharged_1_for_1_cycle=3*(pt_1/2);
%                num_cycle_to_wait_1=next_time_arrival_1/(max_num_discharged_1_for_1_cycle*3);
%               
%           end
  elseif(biggestCycle==2 || biggestCycle==3) %lane 3,7 is with tht biggest cycle time...try to give him more time
        if(num_cycle_to_wait_1<normal_cycle_to_wait)
            if(biggestCycle==2)
                [new_time_1,num_cycle_to_wait_3,num_cycle_to_wait_1]=calculate_updrage(normal_cycle_to_wait,1,2,new_time(1),new_time(3),num_cycle_to_wait_3,num_cycle_to_wait_1,next_time_arrival_3,next_time_arrival_1);
            else
               [new_time_1,num_cycle_to_wait_7,num_cycle_to_wait_1]=calculate_updrage(normal_cycle_to_wait,1,2,new_time(1),new_time(3),num_cycle_to_wait_7,num_cycle_to_wait_1,next_time_arrival_7,next_time_arrival_1);
            end
          new_time(1)=new_time_1(2);
          new_time(3)=new_time_1(1);
        end
        
        
       if(num_cycle_to_wait_5<normal_cycle_to_wait)
             if(biggestCycle==2)
                [new_time_1,num_cycle_to_wait_3,num_cycle_to_wait_5]=calculate_updrage(normal_cycle_to_wait,1,1,new_time(1),new_time(3),num_cycle_to_wait_3,num_cycle_to_wait_5,next_time_arrival_3,next_time_arrival_5);
            else
               [new_time_1,num_cycle_to_wait_7,num_cycle_to_wait_5]=calculate_updrage(normal_cycle_to_wait,1,1,new_time(1),new_time(3),num_cycle_to_wait_5,num_cycle_to_wait_1,next_time_arrival_7,next_time_arrival_5);
            end
          new_time(1)=new_time_1(2);
          new_time(3)=new_time_1(1);
       end   
  else %lane 5 is with tht biggest cycle time...try to give him more time
      if(num_cycle_to_wait_1<normal_cycle_to_wait)
        [new_time_1,num_cycle_to_wait_5,num_cycle_to_wait_1]=calculate_updrage(normal_cycle_to_wait,1,2,new_time(2),new_time(3),num_cycle_to_wait_5,num_cycle_to_wait_1,next_time_arrival_5,next_time_arrival_1);  
        new_time(3)=new_time_1(1);
        new_time(2)=new_time_1(2);
      end
      
      if(num_cycle_to_wait_3<normal_cycle_to_wait && num_cycle_to_wait_7<normal_cycle_to_wait)
          [new_time_3,num_cycle_to_wait_5,num_cycle_to_wait_3]=calculate_updrage(normal_cycle_to_wait,1,1,new_time(3),new_time(1),num_cycle_to_wait_5,num_cycle_to_wait_3,next_time_arrival_5, next_time_arrival_3);
          [new_time_7,num_cycle_to_wait_5,num_cycle_to_wait_7]=calculate_updrage(normal_cycle_to_wait,1,1,new_time(3),new_time(1),num_cycle_to_wait_5,num_cycle_to_wait_7,next_time_arrival_5, next_time_arrival_7);
          [maxValue,maxIndex]=max([new_time_3(1),new_time_7(1)]);
          
          if(maxIndex==1)
              new_time(3)=new_time_3(1);
              new_time(2)=new_time_3(2);
          else
              new_time(3)=new_time_7(1);
              new_time(2)=new_time_7(2);
          end

      end
      
      
  end
   
  new_phase_time=new_time;
 
 end
 
 




