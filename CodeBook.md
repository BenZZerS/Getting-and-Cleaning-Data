##CodeBook
This CodeBook will describe the variables, the data, and any transformations or work that I performed to clean up the data.

###Data and Description
* Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Full description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Variables
1. Subject - The subject who performed the activity for each window sample. Its range is from 1 to 30. 
2. Activity - Description of the activity. The following are the 6 types of the activity.
** WALKING
** WALKING_UPSTAIRS
** WALKING_DOWNSTAIRS
** SITTING
** STANDING
** LAYING.
3. Features - The variables used on the feature vector, such as tBodyAccMeanX, tBodyAccMeanY, tBodyAccMeanZ.

###Transformation and Work
The R script called “run_analysis.R” will provide the following function
1. Merges the training and the test sets to create one data set.
** Use read.table() function to read both train and test data.
*** ”train/X_train.txt”, "test/X_test.txt" (Store in xDf)
*** ”train/subject_train.txt”, "test/subject_test.txt" (Store in subjDf)
*** ”train/y_train.txt”, "test/y_test.txt" (Store in yDf)
** Use rbind() function to merge the data.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
** Read feature data from "features.txt”. (Store in measureDf)
** Use grep() function to extract only measurements that related to mean and standard deviation.
** Use gsub() function to clean the column names and assign the column names to xDf.
3. Uses descriptive activity names to name the activities in the data set.
** Read activity labels data from “activity_labels.txt” (Store in activDf)
** Use gsub() function to clean the activity labels in activDf.
** Map activity number in yDf with activity labels in activDf.
4. Appropriately labels the data set with descriptive variable names.
** Use cbind() function to combine three data frames to one data frame called tidyData
** Use write.table() function to export the tidy data set called “1-tidyData.txt”
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
** Use tidyData  to calculate the mean of each variable for each activity and each subject. (Store in avgTidyData)
** Use write.table() to export the average tidy data set called “2-avgTidydata.txt”


