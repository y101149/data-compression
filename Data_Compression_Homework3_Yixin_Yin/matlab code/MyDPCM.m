function [R] = MyDPCM(G,a,b,c )
% initial
    G = double(G);
    R = [];
    R = double(R);
    R(1,1) = G(1,1);
%     first row
    for j = 2:size(G,2)
        R(1,j) = G(1,j) - G(1,j-1);
    end
%     first column
    for i = 2:size(G,1)
        R(i,1) = G(i,1) - G(i-1,1);
    end
    for i = 2:size(G,1)
        for j = 2:size(G,2)
            R(i,j) = floor(G(i,j)-(a*G(i,j-1)+b*G(i-1,j-1)+c*G(i-1,j)));
        end
    end

end

