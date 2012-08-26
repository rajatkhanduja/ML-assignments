% Octave script to use the data and functions defined in the Naive Bayes class to
% test classification using Naive Bayes on the data in "class.csv"

datafile = "class.csv";
dataset = csvread (datafile);

% Modify dataset using threshold values. (TODO)


% Add "Naive_Bayes" folder to the path
addpath("./Naive_Bayes");
confusionMatrix = k_fold_cross_validation (dataset, 10, 4); % 4-fold
metricsMatrix = metrics (confusionMatrix);
[precisions avgPrecision] = precision (metricsMatrix);
avgPrecision
[recalls avgRecall] = recall (metricsMatrix);
avgRecall
avgF1Measure = 2 * avgPrecision * avgRecall / (avgPrecision + avgRecall)
