% Function used to compute the confusion matrix
% Input :
%   predictedClasses
%   actualClasses
%   nClasses

function confusionMatrix = confusion_matrix (predictedClasses, actualClasses, nClasses)
  confusionMatrix = zeros (nClasses, nClasses);
  nRows = size(predictedClasses)(1);

  for i = 1 : nRows
    actual = actualClasses(i, 1);
    predicted = predictedClasses(i, 1);
    if actual > 0 && predicted > 0
      confusionMatrix (actual, predicted)++;
    end
  end
end
