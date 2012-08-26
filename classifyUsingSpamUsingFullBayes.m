% Octave script to use the data and functions defined in the Naive Bayes class to
% test classification using Naive Bayes on the data in "class.csv"

%datafile = "fhr.csv";
datafile = "../spambase.data";
%datafile = "synthetic-data";
dataset = csvread (datafile);

% Add required folders to the path
addpath("./Full_Bayes");
addpath("./Evaluators");
%nClasses = 10;
nClasses = 2;
confusionMatrix = k_fold_cross_validation_full_bayes (dataset, nClasses, 4); % 4-fold
metricsMatrix = metrics (confusionMatrix);
[precisions avgPrecision] = precision (metricsMatrix)
[recalls avgRecall] = recall (metricsMatrix)
[f1scores avgF1Score] = f1score (precisions, avgPrecision, recalls, avgRecall)
precisionMacro = sum (precisions) / nClasses
recallMacro    = sum (recalls) / nClasses
macroAvgF1 = sum(f1scores) / nClasses
