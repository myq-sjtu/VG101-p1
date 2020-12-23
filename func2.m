% func2 is to control all the cars' movement
% function named as 'car+direction' is the function to control car coming
% from this direction, these four function are nearly the same, except for
% the position of the car.
function [car1,car2,car3,car4,car5,car6,car7,car8,...
    t1,t2,t3,t4,t5,t6,t7,t8,...
    rush1,rush2,rush3,rush4,rush5,rush6,rush7,rush8,...
    turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8]=func2(j,width,r,g,all,...
    car1,car2,car3,car4,car5,car6,car7,car8,...
    t1,t2,t3,t4,t5,t6,t7,t8,...
    rush1,rush2,rush3,rush4,rush5,rush6,rush7,rush8,...
    turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8,...
    west1,west2,east1,east2,south1,south2,north1,north2)
    [car1,car5,t1,t5,rush1,rush5,turn1,turn5]=carwest(car1,car5,west1,west2,t1,t5,width,r,j,all,g,rush1,rush5,turn1,turn5);
    [car2,car6,t2,t6,rush2,rush6,turn2,turn6]=careast(car2,car6,east1,east2,t2,t6,width,r,j,all,g,rush2,rush6,turn2,turn6);
    [car3,car7,t3,t7,rush3,rush7,turn3,turn7]=carsouth(car3,car7,south1,south2,t3,t7,width,j,all,g,rush3,rush7,turn3,turn7);
    [car4,car8,t4,t8,rush4,rush8,turn4,turn8]=carnorth(car4,car8,north1,north2,t4,t8,width,j,all,g,rush4,rush8,turn4,turn8);
end

% car's(west to east) related function
function [car1,car5,t1,t5,rush1,rush5,turn1,turn5]=carwest(car1,car5,west1,west2,t1,t5,width,r,j,all,g,rush1,rush5,turn1,turn5)
    % erase the last 0.1 seconds picture
    if j~=0
        for o=1:west1
            delete(car1(o));
        end
        for o=1:west2
            delete(car5(o));
        end
    end 
    % check if it meet a red light or yellow light
    for o=1:west1
        if  abs(t1(o)-1.4*width)<0.01  
            if mod(j,all)<=r || mod(j,all)>=r+g
                % if rushing the red light
                if rush1(o)==1 
                    car1(o)=rectangle('Position',[-t1(o),-0.4*width,0.4*width,0.3*width],'facecolor','r');
                    rush1(o)=2;
                    t1(o)=t1(o)-0.1;
                % no rush
                else
                    car1(o)=rectangle('Position',[-t1(o),-0.4*width,0.4*width,0.3*width],'facecolor','r');     
                    % if the former car meet a red light and stop the
                    % following car should stop as well
                    if west1~=1 && o~=west1
                        for m=o+1:west1
                            t1(m)=t1(m)+0.1;
                        end
                    end
                end
            % go to the crossroad but it is green light    
            else
                car1(o)=rectangle('Position',[-t1(o),-0.4*width,0.4*width,0.3*width],'facecolor','r');
                t1(o)=t1(o)-0.1;
            end
        % check if it turns, if it did turn, the value 'turn' become '2' 
        % after turning, follow a new moving method
        elseif (abs(t1(o)+0.1*width)<0.01 && turn1(o)==1) || turn1(o)==2
            car1(o)=rectangle('Position',[0.1*width,-(t1(o)+0.5*width),0.3*width,0.4*width],'facecolor','r');
            t1(o)=t1(o)-0.1;
            turn1(o)=2;  
        % not meeting a light nor need to turn
        else
            car1(o)=rectangle('Position',[-t1(o),-0.4*width,0.4*width,0.3*width],'facecolor','r');
            t1(o)=t1(o)-0.1;
        end         
    end
    for o=1:west2
        if  abs(t5(o)-1.4*width)<0.01  
            if mod(j,all)<=r || mod(j,all)>=r+g
                % rushing the red light
                if rush5(o)==1 
                    car5(o)=rectangle('Position',[-t5(o),-0.9*width,0.4*width,0.3*width],'facecolor','r');
                    rush5(o)=2;
                    t5(o)=t5(o)-0.1;
                else
                    car5(o)=rectangle('Position',[-t5(o),-0.9*width,0.4*width,0.3*width],'facecolor','r');     
                    % if the former car meet a red light and stop the
                    % following car should stop as well
                    if west2~=1 && o~=west2
                        for m=o+1:west2
                            t5(m)=t5(m)+0.1;
                        end
                    end
                end
            else
                car5(o)=rectangle('Position',[-t5(o),-0.9*width,0.4*width,0.3*width],'facecolor','r');
                t5(o)=t5(o)-0.1;
            end
        % check if it turns    
        elseif (abs(t5(o)-width)<0.01 && turn5(o)==1) || turn5(o)==2
            car5(o)=rectangle('Position',[-0.9*width,t5(o)-2*width,0.3*width,0.4*width],'facecolor','r');
            t5(o)=t5(o)-0.1;
            turn5(o)=2;    
        else
            car5(o)=rectangle('Position',[-t5(o),-0.9*width,0.4*width,0.3*width],'facecolor','r');
            t5(o)=t5(o)-0.1;
        end         
    end
    drawnow;
end

% car's(east to north) related function
function [car2,car6,t2,t6,rush2,rush6,turn2,turn6]=careast(car2,car6,east1,east2,t2,t6,width,r,j,all,g,rush2,rush6,turn2,turn6)
    % erase the last 0.1 second picture
    if j~=0
        for o=1:east1
            delete(car2(o));
        end
        for o=1:east2
            delete(car6(o));
        end
    end
    % check if meeting a red light
    for o=1:east1
        if  abs(t2(o)-width)<0.01 
            if mod(j,all)<=r || mod(j,all)>=r+g
                % rushing the red light
                if rush2(o)==1
                    car2(o)=rectangle('Position',[t2(o),0.1*width,0.4*width,0.3*width],'facecolor','c');
                    rush2(o)=2;
                    t2(o)=t2(o)-0.1;
                else                       
                    car2(o)=rectangle('Position',[t2(o),0.1*width,0.4*width,0.3*width],'facecolor','c');     
                    % if the former car meet a red light and stop the
                    % following car should stop as well
                    if east1~=1 && o~=east1
                        for m=o+1:east1
                            t2(m)=t2(m)+0.1;
                        end
                    end
                end
            else
                car2(o)=rectangle('Position',[t2(o),0.1*width,0.4*width,0.3*width],'facecolor','c');            
                t2(o)=t2(o)-0.1;
            end
        elseif (abs(t2(o)+0.5*width)<0.01 && turn2(o)==1) || turn2(o)==2 
            car2(o)=rectangle('Position',[-0.4*width,t2(o)+0.5*width,0.3*width,0.4*width],'facecolor','c');
            t2(o)=t2(o)-0.1;
            turn2(o)=2;     
        else
            car2(o)=rectangle('Position',[t2(o),0.1*width,0.4*width,0.3*width],'facecolor','c');                     
            t2(o)=t2(o)-0.1;        
        end  
    end
    for o=1:east2
        if  abs(t6(o)-width)<0.01 
            if mod(j,all)<=r || mod(j,all)>=r+g
                % rushing the red light
                if rush6(o)==1
                    car6(o)=rectangle('Position',[t6(o),0.6*width,0.4*width,0.3*width],'facecolor','c');
                    rush6(o)=2;
                    t6(o)=t6(o)-0.1;
                else                       
                    car6(o)=rectangle('Position',[t6(o),0.6*width,0.4*width,0.3*width],'facecolor','c');     
                    % if the former car meet a red light and stop the
                    % following car should stop as well
                    if east2~=1 && o~=east2
                        for m=o+1:east2
                            t6(m)=t6(m)+0.1;
                        end
                    end
                end
            else
                car6(o)=rectangle('Position',[t6(o),0.6*width,0.4*width,0.3*width],'facecolor','c');            
                t6(o)=t6(o)-0.1;
            end
        elseif (abs(t6(o)-0.6*width)<0.01 && turn6(o)==1) || turn6(o)==2 
            car6(o)=rectangle('Position',[0.6*width,-(t6(o)-1.2*width),0.3*width,0.4*width],'facecolor','c');
            t6(o)=t6(o)-0.1;
            turn6(o)=2;      
        else
            car6(o)=rectangle('Position',[t6(o),0.6*width,0.4*width,0.3*width],'facecolor','c');                     
            t6(o)=t6(o)-0.1;        
        end  
    end
    drawnow;
end

% car's(south to north) related function
function [car3,car7,t3,t7,rush3,rush7,turn3,turn7]=carsouth(car3,car7,south1,south2,t3,t7,width,j,all,g,rush3,rush7,turn3,turn7)
    % erase the last 0.1 second picture
    if j~=0
        for o=1:south1
            delete(car3(o));
        end
        for o=1:south2
            delete(car7(o));
        end
    end  
    % check if meeting the red light
    for o=1:south1
        if  abs(t3(o)-1.4*width)<0.01 
            if mod(j,all)>=g
                % rushing the red light
                if rush3(o)==1 
                    car3(o)=rectangle('Position',[0.1*width,-t3(o),0.3*width,0.4*width],'facecolor','m');
                    rush3(o)=2;
                    t3(o)=t3(o)-0.1;
                else
                    car3(o)=rectangle('Position',[0.1*width,-t3(o),0.3*width,0.4*width],'facecolor','m');     
                    % if the former car meet a red light and stop the
                    % following car should stop as well
                    if south1~=1 && o~=south1
                        for m=o+1:south1
                            t3(m)=t3(m)+0.1;
                        end
                    end
                end
            else
                car3(o)=rectangle('Position',[0.1*width,-t3(o),0.3*width,0.4*width],'facecolor','m');
                t3(o)=t3(o)-0.1;
            end
        elseif (abs(t3(o)+0.1*width)<0.01 && turn3(o)==1) || turn3(o)==2 
            car3(o)=rectangle('Position',[t3(o)+0.1*width,0.1*width,0.4*width,0.3*width],'facecolor','m');
            t3(o)=t3(o)-0.1;
            turn3(o)=2;      
        else
            car3(o)=rectangle('Position',[0.1*width,-t3(o),0.3*width,0.4*width],'facecolor','m');
            t3(o)=t3(o)-0.1;
        end         
    end
    for o=1:south2
        if  abs(t7(o)-1.4*width)<0.01 
            if mod(j,all)>=g
                % rushing the red light
                if rush7(o)==1 
                    car7(o)=rectangle('Position',[0.6*width,-t7(o),0.3*width,0.4*width],'facecolor','m');
                    rush7(o)=2;
                    t7(o)=t7(o)-0.1;
                else
                    car7(o)=rectangle('Position',[0.6*width,-t7(o),0.3*width,0.4*width],'facecolor','m');     
                    % if the former car meet a red light and stop the
                    % following car should stop as well
                    if south2~=1 && o~=south2
                        for m=o+1:south2
                            t7(m)=t7(m)+0.1;
                        end
                    end
                end
            else
                car7(o)=rectangle('Position',[0.6*width,-t7(o),0.3*width,0.4*width],'facecolor','m');
                t7(o)=t7(o)-0.1;
            end
        elseif (abs(t7(o)-width)<0.01 && turn7(o)==1) || turn7(o)==2 
            car7(o)=rectangle('Position',[-(t7(o)-1.6*width),-0.9*width,0.4*width,0.3*width],'facecolor','m');
            t7(o)=t7(o)-0.1;
            turn7(o)=2;       
        else
            car7(o)=rectangle('Position',[0.6*width,-t7(o),0.3*width,0.4*width],'facecolor','m');
            t7(o)=t7(o)-0.1;
        end         
    end
    drawnow;
end

% car's(north to south) related function
function [car4,car8,t4,t8,rush4,rush8,turn4,turn8]=carnorth(car4,car8,north1,north2,t4,t8,width,j,all,g,rush4,rush8,turn4,turn8)
    % erase the last 0.1 second picture
    if j~=0
        for o=1:north1
            delete(car4(o));
        end
        for o=1:north2
            delete(car8(o));
        end
    end
    % check if meeting a red light
    for o=1:north1
        if  abs(t4(o)-width)<0.01 
            if mod(j,all)>=g 
                % rushing the red light
                if rush4(o)==1 
                    car4(o)=rectangle('Position',[-0.4*width,t4(o),0.3*width,0.4*width],'facecolor','b');
                    rush4(o)=2;
                    t4(o)=t4(o)-0.1;
                else
                    car4(o)=rectangle('Position',[-0.4*width,t4(o),0.3*width,0.4*width],'facecolor','b');     
                    % if the former car meet a red light and stop the
                    % following car should stop as well
                    if north1~=1 && o~=north1
                        for m=o+1:north1
                            t4(m)=t4(m)+0.1;
                        end
                    end
                end
            elseif (abs(t4(o)+0.5*width)<0.01 && turn4(o)==1) || turn4(o)==2 
                car4(o)=rectangle('Position',[-(t4(o)+0.9*width),-0.4*width,0.4*width,0.3*width],'facecolor','b');
                t4(o)=t4(o)-0.1;
                turn4(o)=2;         
            else
                car4(o)=rectangle('Position',[-0.4*width,t4(o),0.3*width,0.4*width],'facecolor','b');
                t4(o)=t4(o)-0.1;
            end
        else
            car4(o)=rectangle('Position',[-0.4*width,t4(o),0.3*width,0.4*width],'facecolor','b');
            t4(o)=t4(o)-0.1;
        end         
    end
    for o=1:north2
        if  abs(t8(o)-width)<0.01 
            if mod(j,all)>=g
                % rushing the red light
                if rush8(o)==1 
                    car8(o)=rectangle('Position',[-0.9*width,t8(o),0.3*width,0.4*width],'facecolor','b');
                    rush8(o)=2;
                    t8(o)=t8(o)-0.1;
                else
                    car8(o)=rectangle('Position',[-0.9*width,t8(o),0.3*width,0.4*width],'facecolor','b');     
                    % if the former car meet a red light and stop the
                    % following car should stop as well
                    if north2~=1 && o~=north2
                        for m=o+1:north2
                            t8(m)=t8(m)+0.1;
                        end
                    end
                end
            else
                car8(o)=rectangle('Position',[-0.9*width,t8(o),0.3*width,0.4*width],'facecolor','b');
                t8(o)=t8(o)-0.1;
            end
        elseif (abs(t8(o)-0.6*width)<0.01 && turn8(o)==1) || turn8(o)==2 
            car8(o)=rectangle('Position',[(t8(o)-1.6*width),0.6*width,0.4*width,0.3*width],'facecolor','b');
            t8(o)=t8(o)-0.1;
            turn8(o)=2;       
        else
            car8(o)=rectangle('Position',[-0.9*width,t8(o),0.3*width,0.4*width],'facecolor','b');
            t8(o)=t8(o)-0.1;
        end         
    end
    drawnow;
end
