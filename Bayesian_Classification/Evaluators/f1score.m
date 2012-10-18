% Function to compute the F1-score for each class given the precisions
% and recalls.
%
% INPUT
%   precisions   : Precision values for each class
%   avgPrecision : Average precision observed
%   recalls      : Recall values for each class
%   avgRecall    : Average recall observed
%
% Output
%   f1scores     : F1 scores for each class
%   avgF1Score   : average F1-scores calculated using avgPrecision and avgRecall

function [f1scores avgF1Score] = f1score (precisions, avgPrecision, recalls, avgRecall)
  
  nClasses = size(precisions)(2);
  f1scores = zeros (1, nClasses);
  avgF1Score = 0;
  for i = 1 : nClasses
    if precisions(i) == 0 || recalls == 0
      continue;
    end
    f1scores(i) = 2 * precisions(i) * recalls(i) / (precisions(i) + recalls(i));
  end
  avgF1Score = 2 * avgPrecision * avgRecall / (avgPrecision + avgRecall);
end
