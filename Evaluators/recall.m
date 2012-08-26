% Function to calculate the recall given the metrics matrix
% Both the recalls for each class and the average recall are returned
%
% Input
%   metricsMatrix 

function [recalls avgRecall] = recall (metrics)
  totalTP = 0;
  totalFN = 0;
  nClasses = size(metrics)(3);
  recalls = zeros(i);
  for i = 1 : nClasses
    tp = metrics(1, 1, i);
    fn = metrics(1, 2, i);
    if (tp == 0)
      recalls(i) = 0;
    else
      recalls(i) = tp / (tp + fn);
    end
    totalTP += tp;
    totalFN += fn;
  end
  if totalTP == 0
    avgRecall = 0;
  else
    avgRecall = totalTP / (totalTP + totalFN);  
  end
end
