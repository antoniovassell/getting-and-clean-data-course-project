# Code Book

## Raw data Overview
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The raw dataset includes the following files:
=========================================

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

In the raw dataset, following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


## Transformations done to generate Tidy Data ```tidy_data.txt```

- Load test datasets into R
- Add Activity Labels to yTest
- Set measurement column names to x_test dataset
- Extract needed measurement columns from x_test which deals with "mean" and "std"
- Merge all tables for test column wise
- Repeat same with training data
- Merge both test and train data row wise
- Create a second, independent tidy data set with the average of each variable for each activity and each subject
- This is done by determine the id columns vs the data columns of the merged data set
- Melt the data by passing data, id and data (measure) columns to the ```melt``` function
- Use ```dcast``` function to create data in required format
- Outputs this to tidy_data.txt using the ```write.table``` function


## Description of variables for tidy data
- Subject                        : int  1 1 1 1 1 1 2 2 2 2 ... (Representing the ID of the Subject, from 1 - ~30)
- Activity_Label                 : Factor w/ 6 levels "LAYING","SITTING" (For the type of activity done for subject)
- tBodyAcc-mean()-X              : numeric (Average value for this variable per subject per activity)
- tBodyAcc-mean()-Y              : numeric (Average value for this variable per subject per activity)
- tBodyAcc-mean()-Z              : numeric (Average value for this variable per subject per activity)
- tBodyAcc-std()-X               : numeric (Average value for this variable per subject per activity)
- tBodyAcc-std()-Y               : numeric (Average value for this variable per subject per activity)
- tBodyAcc-std()-Z               : numeric (Average value for this variable per subject per activity)
- tGravityAcc-mean()-X           : numeric (Average value for this variable per subject per activity)
- tGravityAcc-mean()-Y           : numeric (Average value for this variable per subject per activity)
- tGravityAcc-mean()-Z           : numeric (Average value for this variable per subject per activity)
- tGravityAcc-std()-X            : numeric (Average value for this variable per subject per activity)
- tGravityAcc-std()-Y            : numeric (Average value for this variable per subject per activity)
- tGravityAcc-std()-Z            : numeric (Average value for this variable per subject per activity)
- tBodyAccJerk-mean()-X          : numeric (Average value for this variable per subject per activity)
- tBodyAccJerk-mean()-Y          : numeric (Average value for this variable per subject per activity)
- tBodyAccJerk-mean()-Z          : numeric (Average value for this variable per subject per activity)
- tBodyAccJerk-std()-X           : numeric (Average value for this variable per subject per activity)
- tBodyAccJerk-std()-Y           : numeric (Average value for this variable per subject per activity)
- tBodyAccJerk-std()-Z           : numeric (Average value for this variable per subject per activity)
- tBodyGyro-mean()-X             : numeric (Average value for this variable per subject per activity)
- tBodyGyro-mean()-Y             : numeric (Average value for this variable per subject per activity)
- tBodyGyro-mean()-Z             : numeric (Average value for this variable per subject per activity)
- tBodyGyro-std()-X              : numeric (Average value for this variable per subject per activity)
- tBodyGyro-std()-Y              : numeric (Average value for this variable per subject per activity)
- tBodyGyro-std()-Z              : numeric (Average value for this variable per subject per activity)
- tBodyGyroJerk-mean()-X         : numeric (Average value for this variable per subject per activity)
- tBodyGyroJerk-mean()-Y         : numeric (Average value for this variable per subject per activity)
- tBodyGyroJerk-mean()-Z         : numeric (Average value for this variable per subject per activity)
- tBodyGyroJerk-std()-X          : numeric (Average value for this variable per subject per activity)
- tBodyGyroJerk-std()-Y          : numeric (Average value for this variable per subject per activity)
- tBodyGyroJerk-std()-Z          : numeric (Average value for this variable per subject per activity)
- tBodyAccMag-mean()             : numeric (Average value for this variable per subject per activity)
- tBodyAccMag-std()              : numeric (Average value for this variable per subject per activity)
- tGravityAccMag-mean()          : numeric (Average value for this variable per subject per activity)
- tGravityAccMag-std()           : numeric (Average value for this variable per subject per activity)
- tBodyAccJerkMag-mean()         : numeric (Average value for this variable per subject per activity)
- tBodyAccJerkMag-std()          : numeric (Average value for this variable per subject per activity)
- tBodyGyroMag-mean()            : numeric (Average value for this variable per subject per activity)
- tBodyGyroMag-std()             : numeric (Average value for this variable per subject per activity)
- tBodyGyroJerkMag-mean()        : numeric (Average value for this variable per subject per activity)
- tBodyGyroJerkMag-std()         : numeric (Average value for this variable per subject per activity)
- fBodyAcc-mean()-X              : numeric (Average value for this variable per subject per activity)
- fBodyAcc-mean()-Y              : numeric (Average value for this variable per subject per activity)
- fBodyAcc-mean()-Z              : numeric (Average value for this variable per subject per activity)
- fBodyAcc-std()-X               : numeric (Average value for this variable per subject per activity)
- fBodyAcc-std()-Y               : numeric (Average value for this variable per subject per activity)
- fBodyAcc-std()-Z               : numeric (Average value for this variable per subject per activity)
- fBodyAcc-meanFreq()-X          : numeric (Average value for this variable per subject per activity)
- fBodyAcc-meanFreq()-Y          : numeric (Average value for this variable per subject per activity)
- fBodyAcc-meanFreq()-Z          : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-mean()-X          : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-mean()-Y          : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-mean()-Z          : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-std()-X           : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-std()-Y           : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-std()-Z           : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-meanFreq()-X      : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-meanFreq()-Y      : numeric (Average value for this variable per subject per activity)
- fBodyAccJerk-meanFreq()-Z      : numeric (Average value for this variable per subject per activity)
- fBodyGyro-mean()-X             : numeric (Average value for this variable per subject per activity)
- fBodyGyro-mean()-Y             : numeric (Average value for this variable per subject per activity)
- fBodyGyro-mean()-Z             : numeric (Average value for this variable per subject per activity)
- fBodyGyro-std()-X              : numeric (Average value for this variable per subject per activity)
- fBodyGyro-std()-Y              : numeric (Average value for this variable per subject per activity)
- fBodyGyro-std()-Z              : numeric (Average value for this variable per subject per activity)
- fBodyGyro-meanFreq()-X         : numeric (Average value for this variable per subject per activity)
- fBodyGyro-meanFreq()-Y         : numeric (Average value for this variable per subject per activity)
- fBodyGyro-meanFreq()-Z         : numeric (Average value for this variable per subject per activity)
- fBodyAccMag-mean()             : numeric (Average value for this variable per subject per activity)
- fBodyAccMag-std()              : numeric (Average value for this variable per subject per activity)
- fBodyAccMag-meanFreq()         : numeric (Average value for this variable per subject per activity)
- fBodyBodyAccJerkMag-mean()     : numeric (Average value for this variable per subject per activity)
- fBodyBodyAccJerkMag-std()      : numeric (Average value for this variable per subject per activity)
- fBodyBodyAccJerkMag-meanFreq() : numeric (Average value for this variable per subject per activity)
- fBodyBodyGyroMag-mean()        : numeric (Average value for this variable per subject per activity)
- fBodyBodyGyroMag-std()         : numeric (Average value for this variable per subject per activity)
- fBodyBodyGyroMag-meanFreq()    : numeric (Average value for this variable per subject per activity)
- fBodyBodyGyroJerkMag-mean()    : numeric (Average value for this variable per subject per activity)
- fBodyBodyGyroJerkMag-std()     : numeric (Average value for this variable per subject per activity)
- fBodyBodyGyroJerkMag-meanFreq(): numeric (Average value for this variable per subject per activity)

