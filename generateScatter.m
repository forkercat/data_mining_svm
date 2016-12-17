function generateScatter(x, y, z)

% x: m x 1
% y: n x 1
% z: m x n

X = [];
Y = [];
Z = [];


for i=1:size(x,2)
    for j=1:size(y,2)
        X = [X x(i)];
        Y = [Y y(j)];
    end
end

Z = z(:);


figure;
plot3(X,Y,Z, 'b.', 'MarkerSize', 0.5)

end