x = [1:10];
y = [1:10];
z = rand(10);
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
