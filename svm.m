%% load data

% X: data set, Y: result set
DATA = load('data.txt');
X = DATA(:,1:4); y = DATA(:,5);

%% data set, validation set, test set

% determine how to divide training set
val_ptage = 0.2;
test_ptage = 0.2;

% number of training examples
m = size(X,1);
m_val = round(val_ptage * m);
m_test = round(test_ptage * m);
m_data = m - m_val - m_test;

% randomize
sel = randperm(m);
X = X(sel,:); y = y(sel,:);

% data
Xdata = X(1:m_data,:); ydata = y(1:m_data,:);
Xval = X(m_data+1:m_data+1+m_val,:); yval = y(m_data+1:m_data+1+m_val,:);
Xtest = X(m_data+1+m_val+1:end,:); ytest = y(m_data+1+m_val+1:end,:);

%% SVM Algorithm

% finding the optimize parameters
[C, sigma] = dataset3Params(Xdata, ydata, Xval, yval);

% training
model = svmTrain(Xdata, ydata, C, @(x1, x2) gaussianKernel(x1, x2,sigma));


%% Evaluating
p = svmPredict(model, Xtest);

% [TP, TN, FP, FN]
[TP, TN, FP, FN] = getEvaluatingData(p, ytest);

% caculating PRECISION and RECALL
[precision, recall] = calculatePrecisionAndRecall(TP, FN, FP, FN);

% caculating F1 Score
F1 = calculateF1Score(precision, recall);

fprintf('TP: %d\nTN: %d\n FP: %d\n FN: %d\n', TP, TN, FP, FN);
fprintf('\nPrecision = %.3f', precision);
fprintf('\nRecall = %.3f', recall);
fprintf('\nF1 Score = %.3f', F1);




% fprintf(' : %f\n', mean(double(p == ytest)) * 100);

% fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);






