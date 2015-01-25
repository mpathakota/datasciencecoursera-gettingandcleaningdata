## Getting and Cleaning Data Course Project

Source dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Description of data http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Notes

*  Merges the training and the test sets to create one data set
*  Extracts only the measurements on the mean and standard deviation for each measurement
*  Uses descriptive activity names to name the activities in the data set
*  Appropriately labels the data set with descriptive activity names
*  Creates a second, independent tidy data set with the average of each variable for each activity and each subject
*  Only vaiables containing mean() & std() are used
*  Requires the reshape2 package.

##  Running

```bash
$ rscript run_analysis.R
```

Writes data set with the average of each variable for each activity and each subject as tidy.txt
