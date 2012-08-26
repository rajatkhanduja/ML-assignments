% Octave script to use the data and functions defined in the Naive Bayes class to
% test classification using Naive Bayes on the data in "class.csv"

datafile = "fhr.csv";
dataset = csvread (datafile);

% Modify dataset using threshold values. (TODO)


% Add required folders to the path
addpath("./Naive_Bayes");
addpath("./Evaluators");

confusionMatrix = k_fold_cross_validation_naive (dataset, 10, 4); % 4-fold
metricsMatrix = metrics (confusionMatrix);
[precisions avgPrecision] = precision (metricsMatrix);
avgPrecision
[recalls avgRecall] = recall (metricsMatrix);
avgRecall
avgF1Measure = 2 * avgPrecision * avgRecall / (avgPrecision + avgRecall)
