# Auto download data if time persist
# Auto include any dependencies if time persist or probably just state what's needed and version numbers

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt");
features <- read.table("./UCI HAR Dataset/features.txt");

extractNeededFeatures <- grepl("mean|std", features$V2);


# Load test data
# Then extract needed measurements
# In the mean time adding descriptive labels to variables and to observations
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt");
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt");
xTest <- read.table("./UCI HAR Dataset/test/x_test.txt");

# Add Activity Labels to yTest
yTest[, 2] <- activityLabels[yTest[, 1], 2];
names(yTest) <- c("Activity_ID", "Activity_Label");

# Label subject column
names(subjectTest) <- c("Subject");

# Set measurement column names
names(xTest) <- features$V2;

# Extract needed measurement columns
xTest <- xTest[, extractNeededFeatures];

# Merge all tables for test column wise
testData <- cbind(subjectTest, yTest, xTest);


# Load train data
# Then extract needed measurements
# In the mean time adding descriptive labels to variables and to observations
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt");
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt");
xTrain <- read.table("./UCI HAR Dataset/train/x_train.txt");

# Add Activity Labels to yTrain
yTrain[, 2] <- activityLabels[yTrain[, 1], 2];
names(yTrain) <- c("Activity_ID", "Activity_Label");

# Label subject column
names(subjectTrain) <- c("Subject");

# Set measurement column names
names(xTrain) <- features$V2;

# Extract needed measurement columns
xTrain <- xTrain[, extractNeededFeatures];

# Merge all tables for train column wise
trainData <- cbind(subjectTrain, yTrain, xTrain);


# Merge both test and train data row wise
data <- rbind(testData, trainData);

# create a second, independent tidy data set with the average of each variable for each activity and each subject.
idLabels <- c("Subject", "Activity_ID", "Activity_Label");
dataLabels <- setdiff(colnames(data), idLabels);
meltData <- melt(data, id = idLabels, measure.vars = dataLabels);
tidyData <- dcast(meltData, Subject + Activity_Label ~ variable, mean);

# Output tidy data to a text file
write.table(tidyData, file ="tidy_data.txt", row.names = FALSE);
