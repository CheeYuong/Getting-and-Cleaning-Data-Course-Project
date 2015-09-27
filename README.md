Getting and Cleaning Data Course Project
Introduction
A course project is to test the skills of collecting the data, work with the data which has been collected and cleans a data set. The goal of the course project is to prepare the tidy data that can be used for an analysis in the next data process.
Processes
a)	Getting Data
i)	Download the data (UCI HAR Dataset) from the URL given: 
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
ii)	Unzip the folder and create a path to the folder
iii)	Read the raw data from three different text files (subject, features and activity) consists of training and test sets.

b)	Work with Data
i)	Merge the two sets of data to create one data set
ii)	Extract only the two measurements from the data set, which are mean and standard deviation
iii)	Read the descriptive activity names in data set and uses the six descriptive names to name the activities such as walking, walking_upstairs, walking_downstairs, sitting, standing and lying.
iv)	Labels the data set with descriptive variable names.
v)	Create a second, independent tidy data set with the average of each variable
vi)	write.table() to create a tidy data set as a txt file

Output at my Repository:
run_analysis.R 
codebook.md
README.md
