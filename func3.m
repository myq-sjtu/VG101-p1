% func3 is to test if it crashes.
% function named as 'crash+direction+number' is used to check if the car
% coming from the specific lane in this direction crashes with others
% these 6 functions are nearly the same, except for the condition of break
% f1 means protential fail case 1, if it crash, f1 becomes 1;the same to
% others;
function [f1,f2,f3,f4,f5,f6]=func3(t1,t2,t3,t4,t5,t6,t7,t8,...
    west1,west2,east1,east2,south1,south2,north1,north2,...
    turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8,width)
    f1=0;
    % fail case 1 means the car(west to east(upper)) crash
    f2=0;
    % fail case 2 means the car(west to east(lower)) crash
    f3=0;
    % fail case 3 means the car(east to west(upper)) crash
    f4=0;
    % fail case 4 means the car(east to west(lower)) crash
    f5=0;
    % fail case 5 means the car(south to north(left)) crash
    f6=0;
    % fail case 6 means the car(north to south(right)) crash
    % check if the car(west to east(upper)) crash with the car(north to south
    % or south to north) and the already turned left car(east to west(lower)) 
    f1=crashwest1(f1,width,t1,t2,t3,t4,t7,t8,west1,east1,south1,south2,north1,north2,turn1,turn2,turn3,turn4,turn7,turn8);
    % check if the car(west to east(lower)) crash with the car(north to south
    % or south to north) and the already turned left car(east to west(lower))
    f2=crashwest2(f2,width,t5,t2,t3,t4,t7,t8,west2,east1,south1,south2,north1,north2,turn5,turn2,turn3,turn4,turn7,turn8);
    % check if the car(east to west(lower)) crash with the car(north to south
    % or south to north) and the already turned left car (west to east(upper))
    f3=crasheast1(f3,width,t2,t1,t3,t4,t7,t8,east1,west1,south1,south2,north1,north2,turn2,turn1,turn3,turn4,turn7,turn8);
    % check if the car(east to west(upper)) crash with the car(north to south
    % or south to north) and the already turned left car (west to east(upper))
    f4=crasheast2(f4,width,t6,t1,t3,t4,t7,t8,east2,west1,south1,south2,north1,north2,turn6,turn1,turn3,turn4,turn7,turn8);
    % check if the already turned left car(south to north) crash with
    % car(north to south)
    f5=crashsouth1(f5,width,t3,t4,t8,south1,north1,north2,turn3,turn4,turn8);
    % check if the already turned left car(north to south) crash with
    % car(south to north)
    f6=crashnorth1(f6,width,t4,t3,t7,north1,south1,south2,turn4,turn3,turn7);
end

% the following 6 function are to check if it crashes
% check if west to east(upper) crash
function f1=crashwest1(f1,width,t1,t2,t3,t4,t7,t8,west1,east1,south1,south2,north1,north2,turn1,turn2,turn3,turn4,turn7,turn8)
    % if it crash with car(south to north(left))
    for q=1:west1
        if t1(q)<=0.3*width && t1(q)>=-0.4*width && turn1(q)~=2
            for m=1:south1
                if t3(m)<=0.8*width && t3(m)>=0.1*width && turn3(m)~=2                   
                    f1=1;
                    break
                end
            end
        end
        if f1==1
            break
        % check if crash with car(south to north(right))
        elseif t1(q)<=-0.2*width && t1(q)>=-0.9*width && turn1(q)~=2
            for m=1:south2
                if t7(m)<=0.8*width && t7(m)>=0.1*width && turn7(m)~=2                 
                    f1=1;
                    break
                end
            end
        end
        if f1==1
            break
        % check if crash with car(north to south(right) and car(east to
        % west) which has already turned left
        elseif t1(q)<=0.8*width && t1(q)>=0.1*width && turn1(q)~=2
            for m=1:north1
                if t4(m)<=-0.1*width && t4(m)>=-0.8*width && turn4(m)~=2
                    f1=1;
                    break;
                end
            end
            for m=1:east1
                if t2(m)<=-0.6*width && t2(m)>=-1.3*width && turn2(m)==2
                    f1=1;
                    break;
                end
            end
        end
        if f1==1
            break
        % check if crash with car(north to south(right))
        elseif t1(q)<=1.3*width && t1(q)>=0.6*width && turn1(q)~=2
            for m=1:north2
                if t8(m)<-0.1*width && t8(m)>=-0.8*width && turn8(m)~=2
                    f1=1;
                    break;
                end
            end
        end
    end
end

% check if west to east(lower) crash
function f2=crashwest2(f2,width,t5,t2,t3,t4,t7,t8,west2,east1,south1,south2,north1,north2,turn5,turn2,turn3,turn4,turn7,turn8)
    for q=1:west2
        if t5(q)<=0.3*width && t5(q)>=-0.4*width && turn5(q)~=2
            for m=1:south1
                if t3(m)<=1.3*width && t3(m)>=0.6*width && turn3(m)~=2                     
                    f2=1;
                    break
                end
            end
        end
        if f2==1
            break
        elseif t5(q)<=-0.2*width && t5(q)>=-0.9*width && turn5(q)~=2
            for m=1:south2
                if t7(m)<=1.3*width && t7(m)>=0.6*width && turn7(m)~=2                    
                    f2=1;
                    break
                end
            end
        end
        if f2==1
            break
        elseif t5(q)<=0.8*width && t5(q)>=0.1*width && turn5(q)~=2
            for m=1:north1
                if t4(m)<-0.6*width && t4(m)>=-1.3*width && turn4(m)~=2
                    f2=1;
                    break;
                end
            end
            for m=1:east1
                if t2(m)<-1.1*width && t2(m)>=-1.8*width && turn2(m)==2
                    f2=1;
                    break;
                end
            end
        end
        if f2==1
            break
        elseif t5(q)<=1.3*width && t5(q)>=0.6*width && turn5(q)~=2
            for m=1:north2
                if t8(m)<-0.6*width && t8(m)>=-1.3*width && turn8(m)~=2
                    f2=1;
                    break;
                end
            end
        end
    end
end   

% check if east to west(lower) crash
function f3=crasheast1(f3,width,t2,t1,t3,t4,t7,t8,east1,west1,south1,south2,north1,north2,turn2,turn1,turn3,turn4,turn7,turn8)
    for q=1:east1
        if t2(q)<=0.4*width && t2(q)>=-0.3*width && turn2(q)~=2
            for m=1:south1
                if t3(m)<=0.2*width && t3(m)>=-0.3*width && turn3(m)~=2                     
                    f3=1;
                    break
                end
            end
            for m=1:west1
                if t1(m)<=-0.2*width && t1(m)>=-0.9*width && turn1(m)==2                     
                    f3=1;
                    break
                end
            end
        end
        if f3==1
            break
        elseif t2(q)<=0.9*width && t2(q)>=0.2*width && turn2(q)~=2
            for m=1:south2
                if t7(m)<=0.2*width && t7(m)>=-0.3*width && turn7(m)~=2                    
                    f3=1;
                    break
                end
            end
        end
        if f3==1
            break
        elseif t2(q)<=-0.1*width && t2(q)>=-0.8*width && turn2(q)~=2
            for m=1:north1
                if t4(m)<=0.3*width && t4(m)>=-0.2*width && turn4(m)~=2
                    f3=1;
                    break;
                end
            end
        end
        if f3==1
            break
        elseif t2(q)<=-0.6*width && t2(q)>=-1.3*width && turn2(q)~=2
           for m=1:north2
                if t8(m)<=0.3*width && t8(m)>=-0.2*width && turn8(m)~=2 
                    f3=1;
                    break;
                end
           end
        end
    end
end

% check if east to west(upper) crash
function f4=crasheast2(f4,width,t6,t1,t3,t4,t7,t8,east2,west1,south1,south2,north1,north2,turn6,turn1,turn3,turn4,turn7,turn8)
    for q=1:east2
        if t6(q)<=0.4*width && t6(q)>=-0.3*width && turn6(q)~=2
            for m=1:south1
                if t3(m)<=-0.3*width && t3(m)>=-0.8*width && turn3(m)~=2                    
                    f4=1;
                    break
                end
            end
            for m=1:west1
                if t1(m)<=-0.7*width && t1(1)>=-1.4*width && turn1(m)==2                    
                    f4=1;
                    break
                end
            end
        end
        if f4==1
            break
        elseif t6(q)<=0.9*width && t6(q)>=0.2*width && turn6(q)~=2
            for m=1:south2
                if t7(m)<=-0.3*width && t7(m)>=-0.8*width && turn7(m)~=2                 
                    f4=1;
                    break
                end
            end
        end
        if f4==1
            break
        elseif t6(q)<=-0.1*width && t6(q)>=-0.8*width && turn6(q)~=2
            for m=1:north1
                if t4(m)<=0.8*width && t4(m)>=0.3*width && turn4(m)~=2
                    f4=1;
                    break;
                end
            end
        end
        if f4==1
            break
        elseif t6(q)<=-0.6*width && t6(q)>=-1.3*width && turn6(q)~=2
           for m=1:north2
                if t8(m)<=0.8*width && t8(m)>=0.3*width && turn8(m)~=2
                    f4=1;
                    break;
                end
           end
        end
    end
end

% check if south to north rush after turning
function f5=crashsouth1(f5,width,t3,t4,t8,south1,north1,north2,turn3,turn4,turn8)
    for q=1:south1
        if t3(q)<=-0.2*width && t3(q)>=-0.9*width && turn3(q)==2
            for m=1:north1
                if t4(m)<=0.4*width && t4(m)>=-0.5*width && turn4(m)~=2                    
                    f5=1;
                    break
                end
            end
        end
        if f5==1
            break
        elseif t3(q)<=-0.7*width && t3(q)>=-1.4*width && turn3(q)==2
            for m=1:north2
                if t8(m)<=0.4*width && t8(m)>=-0.5*width && turn8(m)~=2                    
                    f5=1;
                    break
                end
            end
        end
    end
end

% check if north to south rush after turning
function f6=crashnorth1(f6,width,t4,t3,t7,north1,south1,south2,turn4,turn3,turn7)
    for q=1:north1
        if t4(q)<=-0.6*width && t4(q)>=-1.3*width && turn4(q)==2
            for m=1:south1
                if t3(m)<=0.8*width && t3(m)>=0.1*width && turn3(m)~=2                    
                    f6=1;
                    break
                end
            end
        end
        if f6==1
            break
        elseif t4(q)<=-1.1*width && t4(q)>=-1.8*width && turn4(q)==2
            for m=1:south2
                if t7(m)<=0.8*width && t7(m)>=0.1*width && turn7(m)~=2                    
                    f6=1;
                    break
                end
            end
        end
    end
end

