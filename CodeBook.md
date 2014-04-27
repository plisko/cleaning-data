CodeBook for run_analysis.R 
===========================

run_analysis.R script gathers data related to the following research project:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The actual data that are downloaded from the script are available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The original CodeBook from the project is available in the zip file above (as README.txt).

Since the original application is a machine-learning application, the data is split in:
* training set - input features
* training set - output labels (activity)
* training set - subject id (id of the subject that generated the data)
* test set - input features
* test set - output labels (activity)
* test set - subject id (id of the subject that generated the data)
* activity id - dictionary of the activities with descriptive explaination

The script performs the following steps:
* **downlad and import of the data** - files are downloaded and unpacked in the current working directory.
* **selection of mean/std of measured features** - the complete dataset feature list is read. Only the *features that contain the string "mean()" or "std()" are selected* from the feature list. These values are related either to means/std on axial measurements (X, Y, Z) or to means/std to vectorial variables.
* **merge test data with training data** - using load.table, data is loaded in R variables and both test data and training data are enriched with activity ids, activity descriptions and subject ids. Test data and training data are bound in a single data frame variable. Only the features chosen at the previous point are kept.
* **export cleaned dataset** - the cleaned dataset is exported in the working directory in two formats (*"cleanedData.txt" and "cleanedData.csv"*).
* **compute aggregate data** - from the cleaned dataset, an aggregate dataframe is computed. Such dataframe contains only one observation for each pair (subject id, activity id). Each observation contains the average value of all the features considered in the previous points (mean() / std()).
* **export aggregate dataset** - the aggregation dataset is exported in the working directory in two formats (*"meansData.txt" and "meansData.csv"*).


These are the columns of both datasets:
"activity_id"
"activity_name"              
"subject_id"
"tBodyAcc-mean()-X"          
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"          
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"           
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"       
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"       
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"        
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-X"      
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"      
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"       
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-X"         
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"         
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"          
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-X"     
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"     
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"      
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-mean()"         
"tBodyAccMag-std()"
"tGravityAccMag-mean()"      
"tGravityAccMag-std()"
"tBodyAccJerkMag-mean()"     
"tBodyAccJerkMag-std()"
"tBodyGyroMag-mean()"        
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-X"          
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"          
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"           
"fBodyAcc-std()-Z"
"fBodyAccJerk-mean()-X"      
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"      
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"       
"fBodyAccJerk-std()-Z"
"fBodyGyro-mean()-X"         
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"         
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"          
"fBodyGyro-std()-Z"
"fBodyAccMag-mean()"         
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-mean()"    
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()" 
