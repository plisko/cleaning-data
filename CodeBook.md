CodeBook for run_analysis.R 
===========================

run_analysis.R script gathers data related to the following research project:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The actual data that are downloaded from the script are:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original CodeBook from the project is available in the zip file above.

Since the original application is a machine-learning application, the data is split in:
# training set - input features
# training set - output labels (activity)
# training set - subject id (id of the subject that generated the data)
# test set - input features
# test set - output labels (activity)
# test set - subject id (id of the subject that generated the data)
# activity id - dictionary of the activities with descriptive explaination

The script performs the following steps:
# **downlad and import of the data** - files are downloaded and unpacked in the current working directory.
# **merge test data with training data** - using load.table, data is loaded in R variables and both test data and training data are enriched with activity ids, activity descriptions and subject ids. Test data and training data are bound in a single data frame variable
# **selection of base features** - 

(activity descriptions are added, and subject id are added to the dataset)
# select only the features that correspond to the 



