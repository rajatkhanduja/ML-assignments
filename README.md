Fetal heart rate pattern classifier on the dataset available at http://archive.ics.uci.edu/ml/datasets/Cardiotocography .

This is a 10-class classification problem.

CSV File
--------
- CTG.csv contains the original data
- modifyCSV.py is used to modify CTG.csv such that columns that have only -1 and 1 as there values are removed as they are the columns that let us know the class of the vector. Also, it splits the data to create to separate files for different classification problems. In this case, we use "fhr.csv" for finding the FHR pattern code.
