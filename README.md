Getting and Cleaning Data Course Project

Introduction

A course project is to test the skills of collecting the data, work with the data which has been collected and cleans a data set. The goal of the course project is to prepare the tidy data that can be used for an analysis in the next data process.


Processes

Step 1: Getting Data

Download the data (UCI HAR Dataset) from the URL given: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip the folder and create a path to the folder.

Read the raw data from three different text files (subject, features and activity) consists of training and test sets.


Step 2: Work with Data

Merge the two sets of data to create one data set

Extract only the two measurements from the data set, which are mean and standard deviation

Read the descriptive activity names in data set and uses the six descriptive names to name the activities. The six descriptive names are:- walking, walking_upstairs, walking_downstairs, sitting, standing and lying.

Labels the data set with descriptive variable names.

Create a second, independent tidy data set with the average of each variable.

write.table() to create a tidy data set as a txt file.


Step 3: Upload the output to repository

Output at my Repository:- (1) run_analysis.R   (2) codebook.md    (3) README.md    (4) tidy_data.txt