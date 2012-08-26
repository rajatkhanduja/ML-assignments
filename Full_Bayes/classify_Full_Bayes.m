% Function that classifies the data based on the Full Bayesian model
% built using the learn_full_naive.
%
% Input    
%   priors
%   meanVectors
%   covarianceMatrix
%   testVectors
% Output
%   classified : Vector of classes corresponding to each value.

function classified = classify_Full_Bayes (priors, meanVectors, covarianceMatrix, testVectors)
  nRows = size (testVectors)(1);
  [nClasses nFeatures] = size (meanVectors);
   
  classified = zeros (1, nRows);

  % Check if determinant of any case is zero. Return without classifying.
  for i = 1 : nClasses
    sigma = covarianceMatrix ( : , : , i);
    if det (sigma) == 0
      return
    end
  end

  for i = 1 : nRows
    x  = (testVectors(i, :))';
    maxDiscriminant = -inf; 
    for j = 1 : nClasses
      mu = (meanVectors(j, :))';
      sigma = covarianceMatrix ( : , : , j);
      discriminant = -0.5 * (x - mu)' * inv(sigma) * (x - mu) - nFeatures * 0.5 * log (2 * pi) - 0.5 * log (det (sigma)) + log (priors(j));
      if discriminant > maxDiscriminant
        maxDiscriminant = discriminant;
        classified (i) = j;
      end
  end
end
