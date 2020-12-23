% the overall function
function main
    clearvars,clc,clf;
    width=input('the width of lane(time units)(integer): ');
    g=input('the green light will last for(integer): ');
    o=input('the yellow light will last for(integer): ');
    r=input('the red light will last for(integer): ');
    n=input('the total number of car(integer): ');
    p=input('the possiblility of rushing a red light(less than 1): ');
    choice=input('able to freely turn left or right (Y/N): ','s');
    level=input('choose a difficulty level(1~3): ');
    % the adjustment function is to adjust some parameters according to
    % the users' input
    [n,width,choice,p]=adjustment(n,width,choice,level,p);
    % the carnumber function is to determine the number of car in each
    % direction
    [west,east,north,south]=carnumber(n);
    % plotting is to plot the road
    totalwidth=plotting(width);
    % the function related to time
    times(width,g,o,r,p,west,east,south,north,totalwidth,choice);
end

% plotting the road
function totalwidth=plotting(width)
    totalwidth=4*width;
    plot([-totalwidth -width],[width width],'k','linewidth',2);
    hold on;
    plot([-totalwidth -width],[width/2 width/2],'--k','linewidth',1);
    hold on;
    plot([width totalwidth],[width width],'k','linewidth',2);
    hold on;
    plot([width totalwidth],[width/2 width/2],'--k','linewidth',1);
    hold on;
    plot([-totalwidth -width],[-width -width],'k','linewidth',2);
    hold on;
    plot([-totalwidth -width],[-width/2 -width/2],'--k','linewidth',1);
    hold on;
    plot([width totalwidth],[-width -width],'k','linewidth',2);
    hold on;
    plot([width totalwidth],[-width/2 -width/2],'--k','linewidth',1);
    hold on;
    plot([-width -width],[-totalwidth -width],'k','linewidth',2);
    hold on;
    plot([-width/2 -width/2],[-totalwidth -width],'--k','linewidth',1);
    hold on;
    plot([width width],[-totalwidth -width],'k','linewidth',2);
    hold on;
    plot([width/2 width/2],[-totalwidth -width],'--k','linewidth',1);
    hold on;
    plot([-width -width],[width totalwidth],'k','linewidth',2);
    hold on;
    plot([-width/2 -width/2],[width totalwidth],'--k','linewidth',1);
    hold on;
    plot([width width],[width totalwidth],'k','linewidth',2);
    hold on;
    plot([width/2 width/2],[width totalwidth],'--k','linewidth',1);
    hold on;
    plot([0 0],[-totalwidth -width],'--k','linewidth',2);
    hold on;
    plot([0 0],[width totalwidth],'--k','linewidth',2);
    hold on;
    plot([width totalwidth],[0 0],'--k','linewidth',2);
    hold on;
    plot([-totalwidth -width],[0 0],'--k','linewidth',2);
    drawnow;
end

% the function controlling all the values related to time, including car
% moving, color changing and so on, so this function will be a little
% long. There are so many variables in here, and I will clarify them here,
% any variable end with a number ranging from 1 to 8 means different lanes
% 1 stands for the lane(west to east(upper))
% 5 stands for the lane(west to east(lower))
% 2 stands for the lane(east to west(upper))
% 6 stands for the lane(east to west(lower))
% 3 stands for the lane(south to north(left))
% 7 stands for the lane(south to north(right))
% 4 stands for the lane(north to south(right))
% 8 stands for the lane(north to south(left)) e.g.the array car1 means draw
% all car moving west to east(upper);
% and in here car means draw the car, rush means if it will rush the red
% light; turn means if it will turn left or right; and t is the current
% position of the car.
function times(width,g,o,r,p,west,east,south,north,totalwidth,choice)
    % function light is used to plot the initial light color and position
    [x1,x2,x3,x4,y1,y2,y3,y4]=light(totalwidth,width);
    % j is the timer
    j=0;
    % func1 is used to calculate the car's initial positon, decide 
    % whether it will rush or turn and attach a certain plate to it
    [t1,t2,t3,t4,t5,t6,t7,t8,...
    west1,west2,east1,east2,south1,south2,north1,north2,...
    turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8,...
    rush1,rush2,rush3,rush4,rush5,rush6,rush7,rush8,...
    car1,car2,car3,car4,car5,car6,car7,car8,...
    n1,n2,n3,n4,n5,n6,n7,n8]=func1(west,east,south,north,width,p,choice);
    % every 0.1 second check if it should change the color of the light
    while true
        % func5 is used to change the color of the light
        all=func5(x1,x2,x3,x4,y1,y2,y3,y4,j,r,g,o); 
        % func2 is to control all the cars' movement
        [car1,car2,car3,car4,car5,car6,car7,car8,...
        t1,t2,t3,t4,t5,t6,t7,t8,...
        rush1,rush2,rush3,rush4,rush5,rush6,rush7,rush8,...
        turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8]=func2(j,width,r,g,all,...
        car1,car2,car3,car4,car5,car6,car7,car8,...
        t1,t2,t3,t4,t5,t6,t7,t8,...
        rush1,rush2,rush3,rush4,rush5,rush6,rush7,rush8,...
        turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8,...
        west1,west2,east1,east2,south1,south2,north1,north2);
        % move to the next 0.1 second
        pause(0.1);
        j=j+0.1;   
        % func3 is to check if it crashes
        [f1,f2,f3,f4,f5,f6]=func3(t1,t2,t3,t4,t5,t6,t7,t8,...
        west1,west2,east1,east2,south1,south2,north1,north2,...
        turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8,width);
        % break the loop if crash
        if f1==1 || f2==1 || f3==1 || f4==1 || f5==1 || f6==1
            disp('CRASH! You Lose!!');
            break
        end
        % if it doesn't crash and all the car cross the crossroad then you
        % win!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        if max(t1)<=-4.5*width && max(t3)<=-4.5*width && max(t5)<=-4*width ...
                && max(t7)<=-4*width && max(t2)<=-4.4*width && ...
                max(t4)<=-4.9*width && max(t6)<=-4.4*width ...
                && max(t8)<=-4.4*width
            disp('You Win');
            break
        end
    end
    % func4 is to display the plate of car which rush the line
    func4(west1,west2,east1,east2,south1,south2,north1,north2,...
    rush1,rush2,rush3,rush4,rush5,rush6,rush7,rush8,...
    n1,n2,n3,n4,n5,n6,n7,n8);
end

% random number of cars on each direction and make sure each line has at
% least 1 car
function [west,east,north,south]=carnumber(n)
    west=round(2+rand*(n-8));
    east=round(2+rand*(n-west-6));
    north=round(2+rand*(n-west-east-4));
    south=n-west-east-north;
end

% adjustment according to the difficulty level 
function [n,width,choice,p]=adjustment(n,width,choice,level,p)
    if level==1
        if width>=3
            width=ceil(width/2);
        elseif width==2
            width=1;
        end
        if n>=20
            n=ceil(n/2);
        elseif n>=12 && n<20
            n=n-4;
        end
        if choice=="Y"
            choice="N";
        end
        if p~=0
            p=0;
        end
        disp('According to your choice, we automatically adjust some of your parameters to decline the difficulty level');
    end
    if level==3
        if width<=5
            width=2*width;
        elseif width>=10
            width=width+1;
        end
        if n<=10
            n=2*n;
        elseif n>=20
            n=n+3;
        end
        if choice=="N"
            choice="Y";
        end
        if p==0
            p=0.3;
        end
        disp('According to your choiece, we automatically adjust some of your parameters to raise the difficulty level');
    end
end

% plot the initial position and the color of traffic light
function [x1,x2,x3,x4,y1,y2,y3,y4]=light(totalwidth,width)
    % draw the light
    % limit the axis
    axis([-totalwidth totalwidth -totalwidth totalwidth]);
    xlim([-totalwidth totalwidth]);
    ylim([-totalwidth totalwidth]);
    theta=0:pi/100:2*pi;
    x1=width/5*cos(theta)-width;
    y1=width/5*sin(theta)-width;
    x2=width/5*cos(theta)+width;
    y2=width/5*sin(theta)+width;
    x3=width/5*cos(theta)-width;
    y3=width/5*sin(theta)+width;
    x4=width/5*cos(theta)+width;
    y4=width/5*sin(theta)-width;
    plot(x1,y1,x2,y2,x3,y3,x4,y4);
    fill(x1,y1,'r');
    fill(x2,y2,'r');
    fill(x3,y3,'g');
    fill(x4,y4,'g');
end
