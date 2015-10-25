Getting and Cleaning Data

Course Project Goal:

To create an R script called run_analysis.R that does the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names.
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps to be performed to acheive the final goal:

1.Download the data source from the URL given in the CodeBook and unzip it. You'll have a folder named UCI    HAR Dataset. Place this folder in the working directory of R or change the working directory of R to be     the parent folder of the folder UCI HAR Dataset.
2.Put run_analysis.R in the working directory of R (Which is the parent folder of UCI HAR Dataset).
3.Run source("run_analysis.R") , and it will generate a new file 'tiny_data.txt' in your working directory.

Dependencies:

run_analysis.R depends on the package 'reshape2' , and it will install the package automatically.