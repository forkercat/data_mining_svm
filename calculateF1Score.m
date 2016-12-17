function F1 = calculateF1Score(precision, recall)

F1 = 2 * precision * recall / (precision + recall);

end