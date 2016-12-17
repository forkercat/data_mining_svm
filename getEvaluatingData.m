function [TP, TN, FP, FN] = getEvaluatingData(PREDICTION, TESTING)

% TP - True Positive
TP = 0;
% TN - True Negative
TN = 0;
% FP - False Positive
FP = 0;
% FN - False Negative
FN = 0;

% data size
m = size(TESTING, 1);

for i=1:m
    
    p = PREDICTION(i);
    t = TESTING(i);
    
    if (p == 1) & (t == 1)
        TP = TP + 1;
    end
    
    if (p == 0) & (t == 1)
        TN = TN + 1;
    end
    
    if (p == 1) & (t == 0)       
        FP = FP + 1;
    end
    
    if (p == 0) & (t == 0)
        FN = FN + 1;
    end
end

end