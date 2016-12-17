function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%


test_values = [0.01 0.03 0.1 0.3 1 3 10 30];
PRED_MATRIX = zeros(length(test_values), length(test_values));

for i=1:length(test_values)
    for j=1:length(test_values)
        C_val = test_values(i);
        sigma_val = test_values(j);

        model = svmTrain(X, y, C_val, @(x1,x2) gaussianKernel(x1, x2, sigma_val));

        predictions = svmPredict(model, Xval);

        PRED_MATRIX(i, j) = mean(double(predictions ~= yval));
    end
end

for i=1:length(test_values)
    for j=1:length(test_values)
        C_val = test_values(i);
        sigma_val = test_values(j);
        fprintf('C = %.2f, sigma = %.2f, %.5f\n', C_val, sigma_val, PRED_MATRIX(i,j) * 100);
    end
end


generateScatter(test_values,test_values,PRED_MATRIX)



[M,I] = min(PRED_MATRIX(:));
[I_row, I_col] = ind2sub(size(PRED_MATRIX),I);

C = test_values(I_row);
sigma = test_values(I_col);

C
sigma

% =========================================================================

end
