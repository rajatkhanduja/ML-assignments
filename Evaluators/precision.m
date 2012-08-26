% Function to compute the precision corresponding to each class and 
% averaged precision
%
% Input
%   metricsMatrix : Computed using "metrics"

function [precisions avgPrecision] = precision (metricsMatrix)
  totalTP = 0;
  totalTPFP = 0;
  nClasses = size(metricsMatrix)(3);
  precisions = zeros (1, nClasses);
  avgPrecision = 0;
  for i = 1 : nClasses
    tp = metricsMatrix(1, 1, i);
    fp = metricsMatrix(2, 1, i);
    if (tp == 0) 
      continue;
    end
    precisions(i) = tp / (tp + fp);
    totalTP += tp;
    totalTPFP += (tp + fp);
  end
  if totalTP != 0
    avgPrecision = totalTP / totalTPFP;
  end
  totalTP
  totalTPFP
end
