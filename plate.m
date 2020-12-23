% the function of plate
function n=plate(num)
    n="";
    j=1;
    while j<=num
        plate=randomplate;
        n(j)=plate;
        j=j+1;
    end
end

% add the extra letter and the space
function plate=randomplate
    a=rand*25;
    plate=strcat(string(char(65+floor(a))),string(char(0)));
    ran=random;
    plate=change(ran,plate);
end

% the function to generate a random array
function ran=random
    a=[];
    % since there are five digits or letters in the second part of the
    % plate, and they can be the same elements, so I generate 0-9 and A-Z
    % for 5 times in the array
    for h=1:5
        for k=1:36
            a=[a,k];
        end
    end
    % we need to generate 5 digits or letters
    l=5;
    len=length(a);
    b=[];
    ran=recur(b,l,len,a);
end

% the recursion
function ran=recur(b,l,len,a)
    % base case
    if l==0
        ran=b;
    else
        i=ceil(rand*len);
        b=[b,a(i)];
        c=a;
        % after generate a(i) as the former one, delete it and use the
        % remain array to generate the next one, to accomplish permutation
        c(i)=[];
        ran=recur(b,l-1,len-1,c);
    end
    l=l+1;
    len=len+1;
    if isempty(b)==0
        b(end)=[];
    end
end

% change the array into corresponding 0-9 or A-Z
function plate=change(ran,plate)
    for i=1:5
        if ran(i)>10
            plate=strcat(plate,string(char(54+floor(ran(i)))));
        elseif ran(i)<10
            plate=strcat(plate,string(char(48+floor(ran(i)))));
        else
            plate=strcat(plate,"A");
        end
    end
end
