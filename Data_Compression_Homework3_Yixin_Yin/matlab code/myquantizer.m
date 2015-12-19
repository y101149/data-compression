function [ index ] = myquantizer(sample,split )
% sample is the original array
% split is the decision levels include d0 and dn
    for i = 1:length(sample)
        for j = 1:length(split)-1
            if (sample(i) >= split(j) && sample(i) < split(j+1))
                index(i) = j-1;
            end
        end
    end
end

