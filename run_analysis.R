# source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

library(plyr)

### STEP I ###
# Set workspace and copy data in R variables
### STEP I ###

# UNCOMMENT THIS to set the working directory to download and operate on files
#setwd(dir="/Users/paul/Documents/Coursera/Getting And Cleaning Data/hw/peer_assessment/")

# download and unzip file in the working directory
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="./UCI_HAR_dataset.zip", method="curl")
unzip("./UCI_HAR_dataset.zip")

# creating a table of mappings: activity_id, activity_name
activity_labels <- read.table(file="UCI HAR Dataset/activity_labels.txt");
colnames(activity_labels) <- c("activity_id", "activity_name")
activity_labels$activity_id <- as.factor(activity_labels$activity_id)

# creating a list of all the features
feature_list <- read.table(file="UCI HAR Dataset/features.txt")
colnames(feature_list) <- c("feat_id", "feature_name")

# reading TRAINING data with corresponding activity and subjects
train_data <- read.table(file="UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
train_activity <- as.factor(train_activity[,1])
train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_subj <- as.factor(train_subj[,1])

# reading TEST data with corresponding activity and subjects
test_data <- read.table(file="UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
test_activity <- as.factor(test_activity[,1])
test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_subj <- as.factor(test_subj[,1])


# binding Training data and Test data in a single data frame
train_data <- cbind(subj_id=train_subj, act_id=train_activity, train_data)
test_data <- cbind(subj_id=test_subj, act_id=test_activity, test_data)
all_data <- rbind(train_data, test_data)


# time to clean the workspace!
remove(train_data)
remove(train_subj)
remove(train_activity)
remove(test_data)
remove(test_subj)
remove(test_activity)

### PART II ###
# Extracting only columns with means() and std() of variables.
# Include SubjectID, ActivityID and ActivityName (decriptive name)
# Save cleaned dataset in the workspace
### PART II ###

# find the columns related to mean and std of measurements
means_idx <- with(feature_list, grepl("mean()", feature_name, fixed=TRUE))
std_idx <- with(feature_list, grepl("std()", feature_name, fixed=TRUE))

# from the dataset, choose the columns for mean and std variables
sel_feature_names <- feature_list[means_idx | std_idx,]$feature_name
clean_data <- cbind(all_data$subj_id, all_data$act_id, all_data[,sel_feature_names])
names(clean_data) <- c("subject_id", "activity_id", as.character(feature_list[means_idx | std_idx,]$feature_name))
# add activity descriptive name
clean_data <- merge(activity_labels, clean_data, by.x="activity_id", by.y="activity_id")

# clean unused variables
remove(means_idx)
remove(std_idx)

# write result to file
write.table(clean_data, file="cleanedData.txt")
write.csv(clean_data, file="cleanedData.csv")

### PART III ###
# Compute means of data over the dataset
# Grouping by activity and subject
### PART III ###

clean_means <- ddply(clean_data, .(activity_id,activity_name,subject_id), colwise(mean))

# write result to file
write.table(clean_means, file="meansData.txt")
write.csv(clean_means, file="meansData.csv")

