function [precision, recall] = calculatePrecisionAndRecall(TP, TN, FP, FN)

precision = TP / (TP + FP);

recall = TP / (TP + FN);

end