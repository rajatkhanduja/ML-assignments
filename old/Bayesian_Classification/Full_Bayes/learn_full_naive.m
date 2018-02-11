% Function that learns the model for Full Bayesian classification (using 
% discriminant function, etc.) given the dataset
%
% Input
%   dataset : training vectors, with the last column corresponding
%             to the class label
%   nClasses: number of classes
%
% Output
%   meanVectors
%   covarianceMatrix
function [priors meanVectors covarianceMatrix] = learn_full_naive (dataset, nClasses)
  [nRows nCols] = size (dataset);
  nFeatures = nCols - 1;
  meanVectors = zeros (nClasses, nFeatures);
  covarianceMatrix = zeros (nFeatures, nFeatures, nClasses);
  priors = zeros (1, nClasses);
  
  for i = 1 : nClasses
    dataInClassI = [];
    for j = 1 : nRows
      if dataset(j, nCols) == i
        dataInClassI = [dataInClassI ; dataset(j, 1 : nFeatures)] ;
      end
    end
    priors(i) = size (dataInClassI)(1) / nRows;
    % Find variance and mean   
    meanVectors(i, :) = (mean(dataInClassI))';
    varianceVector = var (dataInClassI);
    for j = 1 : nFeatures
      covarianceMatrix(j, j, i) = varianceVector(j);
    end
  end
end
