% this function is to display all the plates of the car which didn't stop
% at the red light
function func4(west1,west2,east1,east2,south1,south2,north1,north2,...
    rush1,rush2,rush3,rush4,rush5,rush6,rush7,rush8,...
    n1,n2,n3,n4,n5,n6,n7,n8)
    disp('The plates of the cars which rush the red light:');
    for j=1:west1
        if rush1(j)==2
            disp(n1(j));
        end
    end
    for j=1:west2
        if rush5(j)==2
            disp(n5(j));
        end
    end
    for j=1:east1
        if rush2(j)==2
            disp(n2(j));
        end
    end
    for j=1:east2
        if rush6(j)==2
            disp(n6(j));
        end
    end
    for j=1:south1
        if rush3(j)==2
            disp(n3(j));
        end
    end
    for j=1:south2
        if rush7(j)==2
            disp(n7(j));
        end
    end
    for j=1:north1
        if rush4(j)==2
            disp(n4(j));
        end
    end
    for j=1:north2
        if rush8(j)==2
            disp(n8(j));
        end
    end
end
