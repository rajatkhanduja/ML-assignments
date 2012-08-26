% Octave script to use the data and functions defined in the Naive Bayes class to
% test classification using Naive Bayes on the data in "class.csv"

%datafile = "fhr.csv";
%datafile = "spambase.data";
datafile = "synthetic-data";
dataset = csvread (datafile);

% Modify dataset using threshold values. (TODO)


% Add required folders to the path
addpath("./Naive_Bayes");
addpath("./Evaluators");
nClasses = 2;
%nClasses = 10;
confusionMatrix = k_fold_cross_validation_naive (dataset, nClasses, 4); % 4-fold
metricsMatrix = metrics (confusionMatrix);
[precisions avgPrecision] = precision (metricsMatrix)
[recalls avgRecall] = recall (metricsMatrix)
[f1scores avgF1Score] = f1score (precisions, avgPrecision, recalls, avgRecall)
precisionMacro = sum (precisions) / nClasses;
recallMacro    = sum (recalls) / nClasses;
macroAvgF1 = sum(f1scores) / nClasses
