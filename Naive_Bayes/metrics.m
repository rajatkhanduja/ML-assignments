% Function to find the number of true positives, true negatives, 
% false positives and false negatives
% 
% Input 
%   confusionMatrix
%
% Output
%   A 3D matrix where metrics[:,:,i] gives a 2 x 2 matrix
%   
%          TP FN
%          FP TN

function metricsMatrix = metrics (confusionMatrix)
  %Confusion matrix is assumed to be a square matrix. No checks
  nClasses = size(confusionMatrix)(1);
  diagonalSum = 0;
  metricsMatrix = zeros(2, 2, nClasses);
  for i = 1 : nClasses
    diagonalSum += confusionMatrix(i, i);
  end

  for i = 1 : nClasses
    % True positives
    tp = confusionMatrix(i, i);
    metricsMatrix (1, 1, i) = tp;

    % True Negatives
    metricsMatrix (2, 2, i) = diagonalSum - tp;

    % False Positives
    metricsMatrix (1, 2, i) = sum (confusionMatrix ( : , i)) - tp;

    %False Negatives
    metricsMatrix (2, 1, i) = sum (confusionMatrix (i , : )) - tp;
  end
end
