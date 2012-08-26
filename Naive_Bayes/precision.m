% Function to compute the precision corresponding to each class and 
% averaged precision
%
% Input
%   metricsMatrix : Computed using "metrics"

function [precisions avgPrecision] = precision (metricsMatrix)
  totalTP = 0;
  totalFP = 0;
  nClasses = size(metricsMatrix)(3)
  precisions = zeros (1, nClasses);
  for i = 1 : nClasses
    tp = metricsMatrix(1, 1, i);
    fp = metricsMatrix(2, 1, i);
    
    precisions(i) = tp / (tp + fp);

    totalTP += tp;
    totalFP += fp;
  end
  avgPrecision = totalTP / (totalTP + totalFP);
end
