function phi_X = transformFeatures( X )
% to compute the design matrix

phi_X = [ones(size(X,1),1) X];

for M=2:6
    phi_X = [phi_X X(:,1).^M];
    j = M;
    for i=1:M-1
        j = j-1;
        phi_X = [phi_X X(:,1).^i.*X(:,2).^j];
    end
    
    phi_X = [phi_X  X(:,2).^M];
end
end

