function [number,times ] = MyRLE( input )
    number = [];
    times = [];
    ind = 1;
    number(ind) = input(1);
    times(ind) = 1;
    for i = 2 : length(input)
        if input(i-1) == input(i)
            times(ind) = times(ind) + 1;
        else
            ind = ind + 1;
            number(ind) = input(i);
            times(ind) = 1;
        end
    end           
end

