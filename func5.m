% this function is to change the traffic light
function all=func5(x1,x2,x3,x4,y1,y2,y3,y4,j,r,g,o)
    all=g+o+r;
    if floor(mod(j,all))==r
        fill(x1,y1,'g');
        fill(x2,y2,'g');
    end
    if floor(mod(j,all))==r+g
        fill(x1,y1,[1,0.5,0]);
        fill(x2,y2,[1,0.5,0]);
    end
    % since the time of the loop of two kinds of light is the same 
    if floor(mod(j,all))==0
        fill(x1,y1,'r');
        fill(x2,y2,'r');
        fill(x3,y3,'g');
        fill(x4,y4,'g');
    end
    if floor(mod(j,all))==g
        fill(x3,y3,[1,0.5,0]);
        fill(x4,y4,[1,0.5,0]);
    end
    if floor(mod(j,all))==g+o
        fill(x3,y3,'r');
        fill(x4,y4,'r');
    end
end