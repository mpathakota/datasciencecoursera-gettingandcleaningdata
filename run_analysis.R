library(reshape2)

## 1. Merge the training and the test sets to create one data set
setwd("~/Coursera/workspace/data/")
## read data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
## Assign names
featureNames = read.table("UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2
names(y_train) <- "activity"
names(y_test) <- "activity"
names(subject_train) <- "subject"
names(subject_test) <- "subject"
## Merge datasets
training <- cbind(subject_train, y_train, X_train)
testing <- cbind(subject_test, y_test, X_test)
allData <- rbind(training, testing)

## 2. Extract only the measurements on the mean and standard deviation for each measurement
## Identify columns of interest
meanstdCols <- grepl("mean\\(\\)", names(allData)) | grepl("std\\(\\)", names(allData))
meanstdCols[1:2] <- TRUE
## Subset of data
allData <- allData[, meanstdCols]

## 3. Use descriptive activity names to name the activities in the data set
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt")

## 4. Appropriately labels the data set with descriptive variable names
allData$activity <- factor(allData$activity, labels=activityLabels$V2)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
melted <- melt(allData, id=c("subject","activity"))
tidy <- dcast(melted, subject + activity ~ variable, mean)
# Write the tidy dataset to a text file
write.csv(tidy, "tidy.txt", row.names=FALSE)
