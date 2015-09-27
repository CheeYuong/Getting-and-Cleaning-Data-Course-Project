##Getting and Cleaning Data Course Project
#
# Create one R script called run_analysis.R that does the following:-
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement.
# 3. Uses the descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
#
# Please upload the tidy data set created in step 5 of the instructions. Please
# upload your data set as a txt file created with write.table() using row.name=
# FALSE (do not cut and paste a dataset directly into the text box, as this may
# cause errors saving your submission).

# Load the package plyr
library(plyr)

# Directories, download files and unzip files
setwd('C:/Users/user/Desktop/Coursera/Lecture 3 - Getting and cleaning data')
getwd()
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "data.zip")
unzip("data.zip",exdir="data")
list.files("data")

# Data path
path <-'C:/Users/user/Desktop/Coursera/Lecture 3 - Getting and cleaning data/data/UCI HAR Dataset'

# Read the raw data from the files
# Read the subject txt files consist training and test sets
# Read the features txt files consist training and test sets
# Read the activity txt files consist training and test sets
# Check the properties of the all variables
subject_train_data <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
subject_test_data <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)
features_train_data <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)
features_test_data <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
activity_train_data <- read.table(file.path(path, "train", "y_train.txt"),header = FALSE)
activity_test_data <- read.table(file.path(path, "test" , "y_test.txt" ),header = FALSE)
str(subject_train_data)
str(subject_test_data)
str(features_train_data)
str(features_test_data)
str(activity_train_data)
str(activity_test_data)

# Binding the data tables by rows
data_subject <- rbind(subject_train_data, subject_test_data)
data_activity<- rbind(activity_train_data, activity_test_data)
data_features<- rbind(features_train_data, features_test_data)

# Read the features name in the data set
featuresNames_path <- read.table(file.path(path, "features.txt"),head=FALSE)

# Set name to the variables
names(data_subject)<-c("subject")
names(data_activity)<-c("activity")
names(data_features)<-featuresNames_path$V2

# Binding the data tables by rows
subject_activity_data <- cbind(data_subject, data_activity)
combine_data<-cbind(data_features, subject_activity_data)

# Extracts only the measurements on the mean and standard deviation 
subdata_mean_std <- featuresNames_path$V2[grep("(mean|std)\\(\\)", featuresNames_path$V2)]
Names <- c(as.character(subdata_mean_std),"subject","activity")
complete_data<-subset(combine_data, select=Names)
str(complete_data)

# Uses descriptive activity names to name the activities in the data set 
activity_name_labels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE) 
str(activity_name_labels) 
names(activity_name_labels)<-c("activity","name_activity")
activity_name_labels
complete_data <- merge(complete_data, activity_name_labels, by='activity') 

str(complete_data) 
head(complete_data)

# Appriopriate labels the data set with descriptive variable names
names(complete_data)<-gsub("Acc", "Accelerometer", names(complete_data))
names(complete_data)<-gsub("Gyro", "Gyroscope", names(complete_data))
names(complete_data)<-gsub("Mag", "Magnitude", names(complete_data))
names(complete_data)<-gsub("BodyBody", "Body", names(complete_data))
names(complete_data)<-gsub("^t", "time", names(complete_data))
names(complete_data)<-gsub("^f", "frequency", names(complete_data))
names(complete_data)<-gsub("[-]",".",names(complete_data))
names(complete_data)<-gsub("-mean()",".mean",names(complete_data))
names(complete_data)<-gsub("-std()",".std",names(complete_data))
names(complete_data)

# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
data<-aggregate(.~subject+activity, complete_data ,mean)
data<-data[order(data$subject,data$activity),]
write.table(data,file="tidy_data.txt",row.name=FALSE)
