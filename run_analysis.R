
# Checks whether the package 'reshape2' is already installed. Otherwise, the package is installed and loaded.

if (!require("reshape2")) {
        install.packages("reshape2")
}

require("reshape2")

# Loads the activity labels, features,and test and train data.

activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = TRUE)
features = read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = TRUE)

subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = TRUE)
X_train = read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = TRUE)
y_train = read.table("./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = TRUE)

subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = TRUE)
X_test = read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = TRUE)
y_test = read.table("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = TRUE)

# The function extractor() takes as input the x,y, and subject data and extractors the required variables and labels them appropriately.

extractor = function(x,y,subject){
        
names(x) = features$V2

mean = grep("mean()",names(x),fixed = TRUE)
std = grep("std()",names(x))
z = append(mean, std, length(mean))
Extracted_DF = x[,z]

activitylabel = activity_labels$V2[y[,1]]

dataFrame = cbind(activitylabel, Extracted_DF)

names(subject) = "subject"

dataFrame = cbind(subject,dataFrame)

}

# The function extractor() is called on the test and train data.

train = extractor(X_train,y_train,subject_train)

test = extractor(X_test,y_test,subject_test)

# Merges the extracted test and train data.

mergedDataFrame = rbind(train,test)

# The melt function in the 'reshape2' package is used to create the melted dataframe 'dfMelt'.

dfMelt = melt(mergedDataFrame, id =c("subject", "activitylabel") , measure.vars = names(mergedDataFrame)[3:68])

# The dcast function in the 'reshape2' package is used to find the mean of the variables for each subject and activity label.

finalDataFrame = dcast(dfMelt, subject + activitylabel ~ variable, mean)

# The cleaned dataframe is written to the file 'tidy_data.txt'.

write.table(finalDataFrame, file = "./tidy_data.txt", row.names = FALSE)

