function [G] = MyReconstruction(E,a,b,c)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    G = [];
    G(1,1) = E(1,1);
    for j = 2:size(E,2)
        G(1,j) = G(1,j-1) + E(1,j);
    end
    for i = 2:size(E,1)
        G(i,1) = G(i-1,1) + E(i,1);
    end
    for i = 2:size(E,1)
        for j = 2:size(E,2)
            G(i,j) = a*G(i,j-1)+b*G(i-1,j-1)+c*G(i-1,j)+E(i,j);
        end
    end
    

end

