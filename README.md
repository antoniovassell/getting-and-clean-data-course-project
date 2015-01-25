# Getting and Cleaning Data Course Project

## Getting the raw data and Running Script

The raw input data of the script is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please download this and extract. There will be a folder called "UCI HAR Dataset"

This will contain the test and training data with other files.

Place the run_analysis.R script into this folder.

Set your working directory to this folder on your terminal or in RStudio.

Then set source("run_analysis.R") to run script. When it's finish, it will output transformed data to tidy_data.txt

## Goals of the script

### run_analysis.R aims to do the following
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How script works

- Load test data into R
- Then extract needed measurements
- In the mean time adding descriptive labels to variables and to observations
- Add Activity Labels to yTest
- Set measurement column names
- Extract needed measurement columns from x_test
- Merge all tables for test column wise
- Repeat same with training data
- Merge both test and train data row wise
- Create a second, independent tidy data set with the average of each variable for each activity and each subject
- This is done by determine the id columns vs the data columns
- Melt the data by passing data, id and data (measure) columns to the ```melt``` function
- Use ```dcast``` function to create data in required format
- Outputs this to tidy_data.txt using the ```write.table``` function 

## Dependencies such as Libraries
- reshape2
- data.table