cleaning-data
=============

Repository for "Getting and Cleaning Data"
-------------

Information on the run_analysis script.

The run_analysis.R performs the download of the original data from the website, unzips the file in the R workspace, reads the data in R variables and performs the cleaning of the data.
The original dataset is related to mobile phone sensors linked to the activity (walking, sitting, laying, ...) that is performed.

Since the original analysis was aimed to a machine-learining model, original data was split in data set and test set, several features were extracted, and output data (label of activity performed) were in separate files.
My R script accumulates the all of the data in a single, cleaned dataset.

Moreover, the script generates a second dataset that accumulates the average values of the variables computed over the groups of activity and subjects of the experiment.


You can find details about the script in the CodeBook.md markdown file (and in the script comments).
