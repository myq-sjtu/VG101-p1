% this function is to draw the initial func1 is used to calculate the car's 
% initial positon, decide whether it will rush or turn 
% and attach a certain plate to it
% every function named as 'drawcar+direction' is to calculate all the
% cars(coming from this direction)'initial position, these four function
% are nearly the same, except for the position of the car
% function plate is to random a plate for each car
function [t1,t2,t3,t4,t5,t6,t7,t8,...
    west1,west2,east1,east2,south1,south2,north1,north2,...
    turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8,...
    rush1,rush2,rush3,rush4,rush5,rush6,rush7,rush8,...
    car1,car2,car3,car4,car5,car6,car7,car8,...
    n1,n2,n3,n4,n5,n6,n7,n8]=func1(west,east,south,north,width,p,choice)
    [t1,t5,rush1,rush5,west1,west2,turn1,turn5]=drawcarwest(west,width,p,choice);
    n1=plate(west1);
    n5=plate(west2);
    [t2,t6,rush2,rush6,east1,east2,turn2,turn6]=drawcareast(east,width,p,choice);
    n2=plate(east1);
    n6=plate(east2);
    [t3,t7,rush3,rush7,south1,south2,turn3,turn7]=drawcarsouth(south,width,p,choice);
    n3=plate(south1);
    n7=plate(south2);
    [t4,t8,rush4,rush8,north1,north2,turn4,turn8]=drawcarnorth(north,width,p,choice);
    n4=plate(north1);
    n8=plate(north2);
    % give these variables an initial values
    car1=0;
    car2=0;
    car3=0;
    car4=0;
    car5=0;
    car6=0;
    car7=0;
    car8=0;
end

% locate the initial position of the car moving from west to east
function [t1,t5,rush1,rush5,west1,west2,turn1,turn5]=drawcarwest(west,width,p,choice)   
    o=1;
   % west1 is the number of the car moving west to east(upper), west2 is
   % the lower one
    west1=round(1+rand*(west-2));
    west2=west-west1;
    while o<=west1
        % t1 is a variable to store (west to east(upper))car's position
        t1(o)=(3.4+o)*width;
        p1=rand;
        % the possibility of this car to rush the red light, if it is going
        % to rush then it is noted as '1' if it will turn then turn will be
        % '1'
        if p>=p1
            rush1(o)=1;
        else
            rush1(o)=0;
        end
        % if the user choose the car to freely turn
        if choice=="Y"
            if p1>=0.5
                turn1(o)=1;
            else
                turn1(o)=0;
            end
        else 
            turn1(o)=0;
       end
        o=o+1;
    end
    o=1;
    while o<=west2
        % t5 is a variable to store (west to east(lower))car's position
        t5(o)=(3.4+o)*width;
        p1=rand;
        % the possibility of this car to rush the red light, if it is going
        % to rush than it is noted as '1'
        if p>=p1
            rush5(o)=1;
        else
            rush5(o)=0;
        end
        if choice=="Y" 
            if p1>=0.5
                turn5(o)=1;
            else
                turn5(o)=0;
            end
        else 
            turn5(o)=0;
        end
        o=o+1;
    end
end

% locate the initial position of the car moving from east to west
function [t2,t6,rush2,rush6,east1,east2,turn2,turn6]=drawcareast(east,width,p,choice)
    o=1;
    east1=round(1+rand*(east-2));
    east2=east-east1;
    while o<=east1
        % t2 is a variable to store (east to west(upper))car's position
        t2(o)=(3+o)*width;
        p1=rand;
        % the possibility of this car to rush the red light, if it is going
        % to rush than it is noted as '1' if it will turn, then turn will
        % be '1'
        if p>=p1
            rush2(o)=1;
        else
            rush2(o)=0;
        end
        if choice=="Y" 
            if p1>=0.5
                turn2(o)=1;
            else
                turn2(o)=0;
            end
        else
            turn2(o)=0;
       end
        o=o+1;
    end
    o=1;
    while o<=east2
        % t6 is a variable to store (east to west(lower))car's position
        t6(o)=(3+o)*width;
        p1=rand;
        % the possibility of this car to rush the red light, if it is going
        % to rush than it is noted as '1'
        if p>=p1
            rush6(o)=1;
        else
            rush6(o)=0;
        end
        if choice=="Y" 
            if p1>=0.5
                turn6(o)=1;
            else
                turn6(o)=0;
            end
        else
            turn6(o)=0;
       end
        o=o+1;
    end
end

% locate the initial position of the car moving from south to north
function [t3,t7,rush3,rush7,south1,south2,turn3,turn7]=drawcarsouth(south,width,p,choice)
    o=1;
    south1=round(1+rand*(south-2));
    south2=south-south1;
    while o<=south1
        %t3 is a variable to store (south to north(left))car's position
        t3(o)=(3.4+o)*width;
        p1=rand;
        % the possibility of this car to rush the red light, if it is going
        % to rush than it is noted as '1'
        if p>=p1
            rush3(o)=1;
        else
            rush3(o)=0;
        end
        if choice=="Y" 
            if p1>=0.5
                turn3(o)=1;
            else
                turn3(o)=0;
            end
        else
            turn3(o)=0;
       end
        o=o+1;
    end
    o=1;
    while o<=south2
        %t3 is a variable to store (south to north(right))car's position
        t7(o)=(3.4+o)*width;
        p1=rand;
        % the possibility of this car to rush the red light, if it is going
        % to rush than it is noted as '1'
        if p>=p1
            rush7(o)=1;
        else
            rush7(o)=0;
        end
        if choice=="Y" 
            if p1>=0.5
                turn7(o)=1;
            else
                turn7(o)=0;
            end
        else
            turn7(o)=0;
       end
        o=o+1;
    end
end

% locate the initial position of the car moving from north to south
function [t4,t8,rush4,rush8,north1,north2,turn4,turn8]=drawcarnorth(north,width,p,choice)
    o=1;
    north1=round(1+rand*(north-2));
    north2=north-north1;
    while o<=north1
        %t4 is a variable to store (north to south)car's position
        t4(o)=(3+o)*width;
        p1=rand;
        % the possibility of this car to rush the red light, if it is going
        % to rush than it is noted as '1'
        if p>=p1
            rush4(o)=1;
        else
            rush4(o)=0;
        end
        if choice=="Y" 
            if p1>=0.5
                turn4(o)=1;
            else
                turn4(o)=0;
            end
        else
            turn4(o)=0;
       end
        o=o+1;
    end
    o=1;
    while o<=north2
        %t4 is a variable to store (north to south)car's position
        t8(o)=(3+o)*width;
        p1=rand;
        % the possibility of this car to rush the red light, if it is going
        % to rush than it is noted as '1'
        if p>=p1
            rush8(o)=1;
        else
            rush8(o)=0;
        end
        if choice=="Y" 
            if p1>=0.5
                turn8(o)=1;
            else
                turn8(o)=0;
            end
        else
            turn8(o)=0;
       end
        o=o+1;
    end
end
