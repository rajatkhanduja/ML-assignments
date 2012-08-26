% Function to classify inputs into a class using prior and likelihood.
%
%   Input
%     prior    ,
%     likelihood,
%     testVectors  - row vectors
%
%   Return Value : 
%     A vector (array), where i-th element indicates the class to which the 
%     i-th input vector belongs.

function classified = naive_bayes_classify (prior, likelihood, testVectors)
  [testRows testCols] = size(testVectors);
  classified = zeros (1, testRows);
  for i = 1 : testRows
    classified(i) = classify (prior, likelihood, testVectors(i,:));
  end
end

function class = classify (prior, likelihood, testVector)
  class = 0;
  nClasses  = size(prior)(2);
  nFeatures = size(likelihood)(1);
  posterior = zeros (nClasses);
  
  maxProd = 0;
  for i = 1 : nClasses
    posterior(i) = prior (i);    
    for j = 1 : nFeatures
      if (testVector(j) != 0)
        posterior(i) *=  likelihood (j, i);
      end
    end
    
    if posterior (i) > maxProd
      maxProd = posterior(i);
      class = i;
    end
  end
end
