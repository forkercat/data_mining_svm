function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)

% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

rand_count = 50;

for i = 1:m

    for j = 1:rand_count

        % randomly choose i examples
        sel = randperm(m);
        sel = sel(1:i); % 3 5 10 4 ... (i rows in total)
        X_cur = X(sel, :);
        y_cur = y(sel);

        % traning
        theta = trainLinearReg(X_cur, y_cur, lambda);

        % error
        error_train(i) += linearRegCostFunction(X_cur, y_cur, theta, 0);
        error_val(i) += linearRegCostFunction(Xval, yval, theta, 0);
    end
    error_train(i) /= rand_count;
    error_val(i) /= rand_count;
end



% -------------------------------------------------------------

% =========================================================================

end
