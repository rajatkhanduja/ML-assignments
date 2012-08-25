% Function to learn the prior and likelihood from the dataset
%   Input
%     dataset  - contains the sets to learn from.
%                Each row contains one entry (set of features) with the last entry 
%                being the class it belongs to.
%                The classes should be numeric, i.e., from 1 to nClasses
%     nClasses - The number of classes
%
%   Return value : 
%     prior      - Array of prior for each class. i-th element is the prior 
%                  for class 'i'
%     likelihood - Matrix (nFeatures * nClasses) of likelihood of j-th class 
%                  for i-th feature.

function [prior,likelihood] = learn_naive (dataset, nClasses)
  
  prior = ones (1, nClasses);     % ones instead of zeros to avoid divison by zero
  % Until the last step, priors contains the number of elements observed 
  % corresponding to each class.

  [nRows nCols] = size(dataset);

  likelihood = ones (nCols - 1, nClasses); 
  % Until the last step, this only contains the number of instances for 
  % which the feature is set corresponding to a class
  
  for i = 1 : nRows
    class = dataset (i, nCols);
    if class == 0
      continue;
    end
    prior(class)++;    

    for j = 1 : nCols - 1
      likelihood(j, class) += (dataset (i, j) != 0);
    end
  end

  % Now compute the actual prior and likelihood, i.e. probabilities
  for i = 1 : nCols - 1
    likelihood(i,:) ./= prior;
  end    
  prior ./= nRows;
end
